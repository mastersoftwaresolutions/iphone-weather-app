//
//  Weather.swift
//  Weather
//
//  Created by Benjamin Shyong on 9/21/14.
//  Copyright (c) 2014 ShyongTech. All rights reserved.
//

import Foundation
import UIKit

struct Weather {
  var currentTime: String?
  var temperature: Double
  var humidity: Double
  var precipProbability: Double
  var summary: String
  var icon: UIImage?
  var Backicon: UIImage?
  var location: String
  
  
  init(weatherDictionary: NSDictionary){
    let currentWeather = weatherDictionary["currently"] as NSDictionary
    println(currentWeather)

    temperature = currentWeather["temperature"] as Double
    humidity = currentWeather["humidity"] as Double
    precipProbability = currentWeather["precipProbability"] as Double
    summary = currentWeather["summary"] as String
    location = "location"
    icon = weatherIconFromString(currentWeather["icon"] as String)
    Backicon = weatherBackIconFromString(currentWeather["icon"] as String)
    currentTime = dateStringFromUnixTime(currentWeather["time"] as Int)
  }
    
  
  func dateStringFromUnixTime(unixTime: Int) -> String{
    let timeInSeconds = NSTimeInterval(unixTime)
    let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
    let dateFormatter = NSDateFormatter()
    dateFormatter.timeStyle = .ShortStyle

    return dateFormatter.stringFromDate(weatherDate)
  }
  
  func weatherIconFromString(stringIcon: String) -> UIImage {
    var imageName: String
    
    switch stringIcon {
      case "clear-day":
        imageName = "sun"
      case "clear-night":
        imageName = "clear_night"
      case "rain":
        imageName = "rain"
      case "sleet":
        imageName = "sleet"
      case "wind":
        imageName = "wind"
      case "fog":
        imageName = "fog"
        
      case "cloudy":
        imageName = "mostly_cloudy"
        
      case "partly-cloudy-day":
        imageName = "partly_cloud"
        
      case "partly-cloudy-night":
        imageName = "partly_cloudy_night"
        
      default:
        imageName = "no report"
    }
    //imageName = "clear-day"
    return UIImage(named: imageName)!
  }
    
    
    func weatherBackIconFromString(stringBackIcon: String) -> UIImage {
        var backimageName: String
        
        switch stringBackIcon {
        case "clear-day":
            backimageName = "clearday"
        case "clear-night":
            backimageName = "Clearnight"
        case "rain":
            backimageName = "rainyday"
        case "sleet":
            backimageName = "snowday"
        case "wind":
            backimageName = "windday"
        case "fog":
            backimageName = "fogday"
        case "cloudy":
            backimageName = "Cloudyday"
            
        case "partly-cloudy-day":
            backimageName = "2"
            
        case "partly-cloudy-night":
            backimageName = "partlycloudyday"
        default:
            backimageName = "partlycloudynight"
        }
       
        return UIImage(named: backimageName)!
    }
    
  
}
