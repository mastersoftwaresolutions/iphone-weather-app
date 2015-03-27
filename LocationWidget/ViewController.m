//
//  ViewController.m
//  LocationWidget
//
//  Created by Nivedita on 3/5/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import "ViewController.h"
#import "ScreensViewController.h"
#import "AboutUsView.h"

@interface ViewController (){
    NSString *OpenIdfa;
}

@end

@implementation ViewController
@synthesize locationManager;
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor blackColor];
    [self InitializingViews];
    [self APIPostRequest];
    
}
-(void) APIPostRequest{
    
    ////**** Parameters dictionary ****////
    OpenIdfa = [OpenIDFA sameDayOpenIDFA];
    NSMutableDictionary *parameters=[NSMutableDictionary new];
    [parameters setObject:OpenIdfa forKey:@"uniqueKey"];
    
//    NSMutableDictionary *headers=[NSMutableDictionary new];
//    [headers setObject:@"application/json; charset=utf-8" forKey:@"Content-Type"];
    
    ////**** Post ****////
    [APIRequest postRequestUrl:@"http://mastersoftwaretechnologies.com/mobileApi/getUniqueKey" parameters:parameters headers:nil indicator:YES indicatorMessage:@"loading.." withErrorResponse:NO response:^(NSMutableDictionary *response) {
        
        NSLog(@"response %@",response);
        
    }];

}
-(void)InitializingViews
{
    vwAbout=[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    vwAbout.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:vwAbout];

    UIView *vwHeader=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    vwHeader.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:50/255.0f blue:50/255.0f alpha:1.0];
    [vwAbout addSubview:vwHeader];
    
    UILabel *lblStart=[[UILabel alloc]initWithFrame:CGRectMake(0, 2, vwHeader.frame.size.width, vwHeader.frame.size.height)];
    lblStart.text=@"Getting Started";
    lblStart.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    lblStart.textColor=[UIColor whiteColor];
    lblStart.textAlignment=NSTextAlignmentCenter;
    [vwHeader addSubview:lblStart];
    
    UIButton *btnSupport = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSupport.frame=CGRectMake(vwHeader.frame.size.width-65, 0, 65, 60);
    [btnSupport setTitle:@"Support" forState:UIControlStateNormal];
    btnSupport.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    [btnSupport setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btnSupport addTarget:self action:@selector(openSupport) forControlEvents:UIControlEventTouchUpInside];
    btnSupport.titleLabel.textColor = [UIColor whiteColor];
    [vwHeader addSubview:btnSupport];
    
    UIButton *btnAboutus = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAboutus.frame=CGRectMake(5, 0, 65, 60);
    [btnAboutus setTitle:@"About Us" forState:UIControlStateNormal];
    btnAboutus.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    [btnAboutus setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btnAboutus addTarget:self action:@selector(openAboutus) forControlEvents:UIControlEventTouchUpInside];
    btnAboutus.titleLabel.textColor = [UIColor whiteColor];
    [vwHeader addSubview:btnAboutus];
    
    UIButton *btnHelp=[UIButton buttonWithType:UIButtonTypeCustom];
    btnHelp.frame=CGRectMake(0, 45, vwHeader.frame.size.width, 40);
    btnHelp.backgroundColor=[UIColor clearColor];
    [btnHelp setTitleColor:[UIColor colorWithRed:255.0/255.0f green:55/255.0f blue:92/255.0f alpha:1.0] forState:UIControlStateNormal];
    [btnHelp setTitle:@"Tap here for help" forState:UIControlStateNormal];
    [btnHelp addTarget:self action:@selector(showScreenView) forControlEvents:UIControlEventTouchUpInside];
    btnHelp.titleLabel.textAlignment=NSTextAlignmentCenter;
    btnHelp.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:12.0f];
    [vwAbout addSubview:btnHelp];

    UIButton *btnWidget=[UIButton buttonWithType:UIButtonTypeCustom];
    btnWidget.frame=CGRectMake(0, 65, vwHeader.frame.size.width, 50);
    btnWidget.backgroundColor=[UIColor clearColor];
    [btnWidget setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnWidget setTitle:@"HOW TO USE WIDGET" forState:UIControlStateNormal];
    [btnWidget addTarget:self action:@selector(showScreenView) forControlEvents:UIControlEventTouchUpInside];
    btnWidget.titleLabel.textAlignment=NSTextAlignmentCenter;
    btnWidget.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    [vwAbout addSubview:btnWidget];
    
    int DeviceHeight = self.view.frame.size.height;
    UIImageView *iViewMap=[[UIImageView alloc]init];
    if (DeviceHeight==667) {
        iViewMap.Frame = CGRectMake(62.5, 120, 250, 280);
    }else if (DeviceHeight==736){
        iViewMap.Frame = CGRectMake(82, 120, 250, 280);
    }else{
        iViewMap.Frame = CGRectMake(35, 120, 250, 280);
    }
    iViewMap.image=[UIImage imageNamed:@"Step5.png"];
    [vwAbout addSubview:iViewMap];
    
    UILabel *lblMap=[[UILabel alloc]initWithFrame:CGRectMake(0, 420, vwHeader.frame.size.width, 40)];
    lblMap.text=@"Calculator Widget";
    lblMap.textColor=[UIColor whiteColor];
    lblMap.backgroundColor=[UIColor colorWithRed:255.0/255.0f green:55/255.0f blue:92/255.0f alpha:1.0];
    lblMap.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    lblMap.textAlignment=NSTextAlignmentCenter;
    [vwAbout addSubview:lblMap];
}
-(void)openSupport
{
    if ([MFMailComposeViewController canSendMail])
    {
        
        NSString *deviceType = [UIDevice currentDevice].model;
        NSString *deviceIosVersion = [[UIDevice currentDevice] systemVersion];
        // Email Subject
        NSString *emailTitle = [NSString stringWithFormat:@"Suggestion for Widzy app Device Version %@",deviceIosVersion];
        // Email Content
        NSString * MessageBody = [NSString stringWithFormat:@"\n\n\n\nDevice Type: %@\nDevice iOSVersion: %@",deviceType,deviceIosVersion];
        NSLog(@"MessageBody: %@",MessageBody);
        NSArray *toRecipients = [NSArray arrayWithObjects:@"mastersoftwaresolutions@gmail.com",nil];
        mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:MessageBody isHTML:NO];
        [mc setToRecipients:toRecipients];
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please configured your email." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            mc=nil;
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            mc=nil;
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)openAboutus
{
    AboutUsView *vcScreens=[[AboutUsView alloc]init];
    [self.navigationController pushViewController:vcScreens animated:YES];
}

-(void)showScreenView
{
    ScreensViewController *vcScreens=[[ScreensViewController alloc]init];
    [self.navigationController pushViewController:vcScreens animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
