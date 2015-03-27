//
//  TodayViewController.h
//  CurrentLocationWidget
//
//  Created by Nivedita on 3/5/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
typedef enum{ Plus,Minus,Multiply,Divide} CalcOperation;

@interface TodayViewController : UIViewController<MKMapViewDelegate,MKAnnotation,CLLocationManagerDelegate,UITextFieldDelegate>
{
    IBOutlet MKMapView *mkMap;
    CLLocationCoordinate2D currentCoordinate;
    CLLocation *currentLocation;
    CLLocationManager *locationManager;
    
    UIView *vwMap;
    
    UILabel *lbl;
    
    UITextField *textDisplay;
    NSString *storage;
    CalcOperation operation;

}
@property(strong,nonatomic)CLLocationManager *locationManager;
@property(strong,nonatomic)IBOutlet MKMapView *mkMap;

@end
