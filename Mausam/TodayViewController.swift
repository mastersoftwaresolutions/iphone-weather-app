//
//  TodayViewController.swift
//  Mausam
//
//  Created by Poonam Parmar on 3/14/15.
//  Copyright (c) 2015 MSS. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreLocation



@objc (TodayViewController)
class TodayViewController: UIViewController, NCWidgetProviding, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    
    var waitLbl :UILabel = UILabel()
   
    

    
    //  forecast.io apiKey
    private let apiKey = "011f57a8593545db6f22c0a975829f6d"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.preferredContentSize = CGSizeMake(0,250);
        
        
        waitLbl.backgroundColor = UIColor .clearColor()
        waitLbl.textColor = UIColor .whiteColor()
        waitLbl.textAlignment = NSTextAlignment.Center
        waitLbl.text = "Please wait.."
        waitLbl.font = UIFont.boldSystemFontOfSize(15)
        self.waitLbl.hidden = false
        self.view.addSubview(waitLbl)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 480 {
              waitLbl.frame = CGRectMake(0, 100, 320, 40)
                
            }
            if UIScreen.mainScreen().nativeBounds.height == 960 {
               waitLbl.frame = CGRectMake(0, 100, 320, 40)
                
            }
            if UIScreen.mainScreen().nativeBounds.height == 1136 {
               waitLbl.frame = CGRectMake(0, 100, 320, 40)
            }
            if UIScreen.mainScreen().nativeBounds.height == 1334 {
                waitLbl.frame = CGRectMake(0, 100, 375, 40)
                
            }
            if UIScreen.mainScreen().nativeBounds.height == 2208 {
                waitLbl.frame = CGRectMake(0, 100, 414, 40)            }
        }
        
        
    }
    
   
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero;
        
    }
    
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    
    // MARK: Location
    
    func locationManager(manager: CLLocationManager!,   didUpdateLocations locations: [AnyObject]!) {
        var locValue:CLLocationCoordinate2D = manager.location.coordinate
        println("locations = \(locValue.latitude), \(locValue.longitude)")
        locationManager.stopUpdatingLocation()
        
        var string1 = locValue.latitude
        var string2 = locValue.longitude
        var appleSummary = "\(string1),\(string2)"

        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
         let forecastURL = NSURL(string: "\(string1),\(string2)", relativeToURL: baseURL)
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            if (error == nil){
                let dataObject = NSData(contentsOfURL: location)
                let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
                
                let currentWeather = Weather(weatherDictionary: weatherDictionary)

                
                var backImage:UIImageView = UIImageView()
                backImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 250)
                self.view.addSubview(backImage)
                
                
                var profileImage:UIImageView = UIImageView()
                
                self.view.addSubview(profileImage)
                
                
                var dateLbl :UILabel = UILabel()
                
                dateLbl.backgroundColor = UIColor .clearColor()
                dateLbl.textColor = UIColor .whiteColor()
                dateLbl.textAlignment = NSTextAlignment.Center
                dateLbl.font = UIFont.boldSystemFontOfSize(16)
                self.view.addSubview(dateLbl)
                
                var tempLbl :UILabel = UILabel()
                
                tempLbl.backgroundColor = UIColor .clearColor()
                tempLbl.textColor = UIColor .whiteColor()
                tempLbl.textAlignment = NSTextAlignment.Center
                tempLbl.font = UIFont.boldSystemFontOfSize(50)
                self.view.addSubview(tempLbl)
                
                var humidLbl :UILabel = UILabel()
                
                humidLbl.backgroundColor = UIColor .clearColor()
                humidLbl.textColor = UIColor .whiteColor()
                humidLbl.textAlignment = NSTextAlignment.Left
                humidLbl.text = "Humidity"
                humidLbl.font = UIFont.boldSystemFontOfSize(16)
                self.view.addSubview(humidLbl)
                
                
                var humidIsLbl :UILabel = UILabel()
               
                humidIsLbl.backgroundColor = UIColor .clearColor()
                humidIsLbl.textColor = UIColor .whiteColor()
                humidIsLbl.textAlignment = NSTextAlignment.Left
                humidIsLbl.font = UIFont.boldSystemFontOfSize(16)
                self.view.addSubview(humidIsLbl)
                
                
                var rainLbl :UILabel = UILabel()
               
                rainLbl.backgroundColor = UIColor .clearColor()
                rainLbl.textColor = UIColor .whiteColor()
                rainLbl.text = "Rain"
                rainLbl.textAlignment = NSTextAlignment.Left
                rainLbl.font = UIFont.boldSystemFontOfSize(16)
                self.view.addSubview(rainLbl)
                
                var rainIsLbl :UILabel = UILabel()
                
                rainIsLbl.backgroundColor = UIColor .clearColor()
                rainIsLbl.textColor = UIColor .whiteColor()
                rainIsLbl.textAlignment = NSTextAlignment.Left
                rainIsLbl.font = UIFont.boldSystemFontOfSize(16)
                self.view.addSubview(rainIsLbl)
                
                var discriptionLbl :UILabel = UILabel()
                
                discriptionLbl.backgroundColor = UIColor .clearColor()
                discriptionLbl.textColor = UIColor .whiteColor()
                discriptionLbl.textAlignment = NSTextAlignment.Center
                discriptionLbl.font = UIFont.boldSystemFontOfSize(25)
                self.view.addSubview(discriptionLbl)
                
                if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
                    if UIScreen.mainScreen().nativeBounds.height == 480 {
                        profileImage.frame = CGRectMake(130, 10, 50, 50)
                        dateLbl.frame = CGRectMake(0, 60, 320, 40)
                        tempLbl.frame = CGRectMake(0, 80, 320, 80)
                        humidLbl.frame = CGRectMake(30, 120, 100, 80)
                        humidIsLbl.frame = CGRectMake(30, 145, 150, 80)
                        rainLbl.frame = CGRectMake(240, 120, 70, 80)
                        rainIsLbl.frame = CGRectMake(240, 145, 70, 80)
                        discriptionLbl.frame = CGRectMake(0, 190, 320, 60)
                        
                        
                    }
                    if UIScreen.mainScreen().nativeBounds.height == 960 {
                       profileImage.frame = CGRectMake(130, 10, 50, 50)
                        dateLbl.frame = CGRectMake(0, 60, 320, 40)
                        tempLbl.frame = CGRectMake(0, 80, 320, 80)
                        humidLbl.frame = CGRectMake(30, 120, 100, 80)
                        humidIsLbl.frame = CGRectMake(30, 145, 150, 80)
                        rainLbl.frame = CGRectMake(240, 120, 70, 80)
                        rainIsLbl.frame = CGRectMake(240, 145, 70, 80)
                        discriptionLbl.frame = CGRectMake(0, 190, 320, 60)
                        
                    }
                    if UIScreen.mainScreen().nativeBounds.height == 1136 {
                        profileImage.frame = CGRectMake(130, 10, 50, 50)
                        dateLbl.frame = CGRectMake(0, 60, 320, 40)
                        tempLbl.frame = CGRectMake(0, 80, 320, 80)
                        humidLbl.frame = CGRectMake(30, 120, 100, 80)
                        humidIsLbl.frame = CGRectMake(30, 145, 150, 80)
                        rainLbl.frame = CGRectMake(240, 120, 70, 80)
                        rainIsLbl.frame = CGRectMake(240, 145, 70, 80)
                        discriptionLbl.frame = CGRectMake(0, 190, 320, 60)
                    }
                    if UIScreen.mainScreen().nativeBounds.height == 1334 {
                        profileImage.frame = CGRectMake(180, 10, 50, 50)
                        dateLbl.frame = CGRectMake(0, 60, 375, 40)
                        tempLbl.frame = CGRectMake(0, 80, 375, 80)
                        humidLbl.frame = CGRectMake(30, 120, 100, 80)
                        humidIsLbl.frame = CGRectMake(30, 145, 150, 80)
                        rainLbl.frame = CGRectMake(240, 120, 70, 80)
                        rainIsLbl.frame = CGRectMake(240, 145, 70, 80)
                        discriptionLbl.frame = CGRectMake(0, 190, 375, 60)
                        
                    }
                    if UIScreen.mainScreen().nativeBounds.height == 2208 {
                        profileImage.frame = CGRectMake(180, 10, 50, 50)
                        dateLbl.frame = CGRectMake(0, 60, 414, 40)
                        tempLbl.frame = CGRectMake(0, 80, 414, 80)
                        humidLbl.frame = CGRectMake(70, 120, 100, 80)
                        humidIsLbl.frame = CGRectMake(70, 145, 150, 80)
                        rainLbl.frame = CGRectMake(280, 120, 70, 80)
                        rainIsLbl.frame = CGRectMake(280, 145, 70, 80)
                        discriptionLbl.frame = CGRectMake(0, 190, 414, 60)
                    }
                }
                
                
               // dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.waitLbl.hidden = true
                    backImage.image = currentWeather.Backicon!
                    profileImage.image = currentWeather.icon!
                    let formatter = NSDateFormatter()
                    formatter.timeStyle = .ShortStyle
                    dateLbl.text = formatter.stringFromDate(NSDate())
                    var Ftemp:Double
                    Ftemp = currentWeather.temperature
                    var CelciusTemp:Double
                    CelciusTemp = (Ftemp - 32.0) / 1.8
                    var resultTemp = NSString(format:"%.f", CelciusTemp)
                    tempLbl.text = "\(resultTemp)°"
                    discriptionLbl.text = "\(currentWeather.summary)"
                    humidIsLbl.text = "\(Int(currentWeather.humidity * 100))%"
                    rainIsLbl.text = "\(Int(currentWeather.precipProbability))%"
                    
                    
                    
                                
                    
               // })
                
            }
                
            else {
                
                self.waitLbl.hidden = true
                var noImage:UIImageView = UIImageView()
                noImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 250)
                noImage.image = UIImage (named: "Clearnight")
                self.view.addSubview(noImage)
                
               

                let networkIssueController = UIAlertController(title: "Error", message: "Unable to load", preferredStyle: .Alert)
                let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                networkIssueController.addAction(okButton)
                
                let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                networkIssueController.addAction(cancelButton)
                
                self.presentViewController(networkIssueController, animated: true, completion: nil)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                  
                    
                    
                })
                
                
                
            }
        })
        downloadTask.resume()

        
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
    
    
    
}
