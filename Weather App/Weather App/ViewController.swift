//
//  ViewController.swift
//  Weather App
//
//  Created by Aurlin Dhillon on 2019-05-07.
//  Copyright © 2019 Aurlin Dhillon. All rights reserved.
//

import UIKit





class ViewController: UIViewController {
  
  let gradientLayer = CAGradientLayer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    backgroundView.layer.addSublayer(gradientLayer)
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
  
  }
  
  func setGreyGradientBackground(){
    
  }
  
}

