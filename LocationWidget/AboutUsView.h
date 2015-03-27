//
//  AboutUsView.h
//  LocationWidget
//
//  Created by Gaganpreet Singh on 3/23/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUsView : UIViewController<UIWebViewDelegate>{
    
    UIWebView *WebView;
}
@property(nonatomic,retain) UIWebView *WebView;
@end
