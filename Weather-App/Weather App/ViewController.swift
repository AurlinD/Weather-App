//
//  ViewController.swift
//  Weather App
//
//  Created by Aurlin Dhillon on 2019-05-07.
//  Copyright © 2019 Aurlin Dhillon. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView
import SwiftyJSON
import CoreLocation
import Foundation



class ViewController: UIViewController, CLLocationManagerDelegate {
  
  let gradientLayer = CAGradientLayer()
  let apiKey = "9b2fb5dca9b26bd478e68abba09a4392"
  var lat = 49.2827
  var lon = 123.1207
  var activityIndicator: NVActivityIndicatorView!
  let locationManager = CLLocationManager()
  var jsonKelvin = 0
  var numberFromString = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    backgroundView.layer.addSublayer(gradientLayer)
    
    let indicatorSize: CGFloat = 70
    let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
    activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0)
    activityIndicator.backgroundColor = UIColor.black
    view.addSubview(activityIndicator)
    
    //activityIndicator.startAnimating()
    // activityIndicator.stopAnimating()
    
    locationManager.requestWhenInUseAuthorization()
    
    activityIndicator.startAnimating()
    if(CLLocationManager.locationServicesEnabled()){
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
  }

  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var conditionalImageView: UIImageView!
  @IBOutlet weak var conditionLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var backgroundView: UIView!
  
  override func viewWillAppear(_ animated: Bool) {
    setBlueGradientBackground()
  }
  
  // will be called when location information is UPDATED
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location  = locations[0]
    lat = Double(location.coordinate.latitude)
    lon = Double(location.coordinate.longitude)
   // read the doccumentation of the API return query
    
    Alamofire.request("https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON{
      response in
      self.activityIndicator.stopAnimating()
      if let responseStr = response.result.value {
        let jsonResponse = JSON(responseStr)
        let jsonWeather = jsonResponse["weather"].array![0]
        let jsonTemp = jsonResponse["main"]
        let iconName = jsonWeather["icon"].stringValue
        
        self.locationLabel.text = jsonResponse["name"].stringValue
        self.conditionalImageView.image = UIImage(named : iconName)
        self.conditionLabel.text = jsonWeather["main"].stringValue
        // round to avoid decimal values
        self.temperatureLabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.dayLabel.text = dateFormatter.string(from: date)
        
        let suffix = iconName.suffix(1)
        if(suffix == "n"){
          self.setGreyGradientBackground()
        }
        else{
          self.setBlueGradientBackground()
        }
      }
    }
    self.locationManager.stopUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
  
  func setBlueGradientBackground(){
    let topColor = UIColor(red: 95.0/255.0, green: 165.0/255.00, blue: 1.0, alpha: 1.0).cgColor
    let bottomColor = UIColor(red: 74.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [topColor, bottomColor]
    
  }
  
  func setGreyGradientBackground(){
    let topColor = UIColor(red: 151.0/255.0, green: 151.0/255.00, blue: 151.0/255.0, alpha: 1.0).cgColor
    let bottomColor = UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 72.0/255.0, alpha: 1.0).cgColor
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [topColor, bottomColor]
    
  }
  
}

