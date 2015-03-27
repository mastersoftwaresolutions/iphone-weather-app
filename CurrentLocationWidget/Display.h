//
//  Display.h
//  Fennix2
//
//  Created by Hemant Bhargava on 20/02/12.
//  Copyright (c) 2012 Sharp Web Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
@class Gallery;

@interface Display : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate; 
    NSString *title; 
    NSString *subtitle;
    Gallery *gl;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate; 
@property (nonatomic, copy) NSString *title; 
@property (nonatomic, copy) NSString *subtitle;
@property  int clubnum;



@end
