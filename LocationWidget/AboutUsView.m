//
//  AboutUsView.m
//  LocationWidget
//
//  Created by Gaganpreet Singh on 3/23/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import "AboutUsView.h"

@interface AboutUsView (){
    UIActivityIndicatorView*activityView;
}

@end

@implementation AboutUsView

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* vwAbout=[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    vwAbout.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:vwAbout];
    
    UIView *vwHeader=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    vwHeader.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:50/255.0f blue:50/255.0f alpha:1.0];
    [vwAbout addSubview:vwHeader];
    
    UILabel *lblStart=[[UILabel alloc]initWithFrame:CGRectMake(0, 2, vwHeader.frame.size.width, vwHeader.frame.size.height)];
    lblStart.text=@"About Us";
    lblStart.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    lblStart.textColor=[UIColor whiteColor];
    lblStart.textAlignment=NSTextAlignmentCenter;
    [vwHeader addSubview:lblStart];
    
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame=CGRectMake(5, 10, 30, 30);
    btnBack.backgroundColor=[UIColor clearColor];
    [btnBack setImage:[UIImage imageNamed:@"arrow_40x40.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(MoveBack) forControlEvents:UIControlEventTouchUpInside];
    [vwHeader addSubview:btnBack];
    
    int DeviceHeight = self.view.frame.size.height;
    UIImageView *Companylogo=[[UIImageView alloc] initWithFrame:CGRectMake(30, 100, 260, 200)];
    if (DeviceHeight==667) {
        Companylogo.frame = CGRectMake(57.5, 100, 260, 200);
    }else if (DeviceHeight==736){
        Companylogo.frame = CGRectMake(77, 100, 260, 200);
    }else{
        Companylogo.frame = CGRectMake(30, 100, 260, 200);
    }
    Companylogo.image = [UIImage imageNamed:@"mss_logo.png"];
    [self.view addSubview:Companylogo];
    
    UILabel *lblCredits=[[UILabel alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50)];
    lblCredits.text=@"Design and Developed by:";
    lblCredits.font=[UIFont fontWithName:@"HelveticaNeue" size:15.0f];
    lblCredits.textColor=[UIColor blackColor];
    lblCredits.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lblCredits];
    
    UILabel *lblCompname=[[UILabel alloc]initWithFrame:CGRectMake(0, 330, self.view.frame.size.width, 50)];
    lblCompname.text=@"Master Software Solutions";
    lblCompname.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f];
    lblCompname.textColor= [UIColor colorWithRed:255/255.0f green:55/255.0f blue:92/255.0f alpha:1.0f];
    lblCompname.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lblCompname];
    
    UILabel *lblVisit=[[UILabel alloc]initWithFrame:CGRectMake(0, 380, self.view.frame.size.width, 50)];
    lblVisit.text=@"Visit us at:";
    lblVisit.font=[UIFont fontWithName:@"HelveticaNeue" size:15.0f];
    lblVisit.textColor= [UIColor blackColor];
    lblVisit.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lblVisit];
    
    UIButton *btnHelp=[UIButton buttonWithType:UIButtonTypeCustom];
    btnHelp.frame=CGRectMake(0, 410, self.view.frame.size.width, 40);
    [btnHelp setTitleColor:self.view.tintColor forState:UIControlStateNormal];
    [btnHelp setTitle:@"www.mastersoftwaresolutions.com" forState:UIControlStateNormal];
    [btnHelp addTarget:self action:@selector(showWebView) forControlEvents:UIControlEventTouchUpInside];
    btnHelp.titleLabel.textAlignment=NSTextAlignmentCenter;
    btnHelp.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f];
    [self.view addSubview:btnHelp];
    
    UILabel *lblCopyright=[[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    lblCopyright.text=@"© Copyright Master Software Solutions, 2015. All rights reserved. ";
    lblCopyright.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0f];
    lblCopyright.textColor= [UIColor blackColor];
    lblCopyright.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lblCopyright];

}

-(void) showWebView
{
    WebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.height-64, self.view.frame.size.height)];
    NSString *strURL = @"http://www.mastersoftwaresolutions.com";
    NSURL *url = [NSURL URLWithString:strURL];
    WebView.delegate = self;
    WebView.scrollView.bounces = NO;
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [WebView loadRequest:urlRequest];
    [self.view addSubview:WebView];
    
    
    activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.layer.cornerRadius = 5;
    activityView.frame = CGRectMake(130, 190, 60, 60);
    activityView.backgroundColor = [UIColor colorWithRed:0/255.0f green:1/255.0f blue:2/255.0f alpha:.8f];
    activityView.tag = 100;
    activityView.hidden = NO;
    [activityView startAnimating];
    [WebView addSubview:activityView];}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    [activityView startAnimating];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityView stopAnimating];
    [self.view viewWithTag:100].hidden = YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityView stopAnimating];
    [self.view viewWithTag:100].hidden = YES;
}
-(void) MoveBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
