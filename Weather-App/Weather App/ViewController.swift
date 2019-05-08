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



class ViewController: UIViewController {
  
  let gradientLayer = CAGradientLayer()
  let apiKey = "9b2fb5dca9b26bd478e68abba09a4392"
  let lat = 49.2827
  let lon = 123.1207
  var activityIndicator: NVActivityIndicatorView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    backgroundView.layer.addSublayer(gradientLayer)
    
    let indicatorSize: CGFloat = 70
    let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
    activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0)
    activityIndicator.backgroundColor = UIColor.black
    view.didAddSubview(activityIndicator)
    
    //activityIndicator.startAnimating()
    // activityIndicator.stopAnimating()
    
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

