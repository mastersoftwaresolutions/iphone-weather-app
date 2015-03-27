//
//  ViewController.h
//  LocationWidget
//
//  Created by Nivedita on 3/5/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>
#import "OpenIDFA.h"
#import "APIRequest.h"

@interface ViewController : UIViewController<CLLocationManagerDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>
{
    CLLocationCoordinate2D currentCoordinate;
    CLLocation *currentLocation;
    CLLocationManager *locationManager;
    UIView *vwNotification;
    UIView *vwAbout;
    MFMailComposeViewController *mc;
}

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

