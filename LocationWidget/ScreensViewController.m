//
//  ScreensViewController.m
//  LocationWidget
//
//  Created by Nivedita on 3/11/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import "ScreensViewController.h"

@interface ScreensViewController ()

@end

@implementation ScreensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self ViewInitialization];
}

-(void)ViewInitialization
{
    vwScreen=[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    vwScreen.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:vwScreen];
    
    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.backgroundColor=[UIColor clearColor];
    [vwScreen addSubview:scroll];
    [scroll setContentSize:CGSizeMake(320, 1650)];
    
    UIView *vwHeader=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    vwHeader.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:50/255.0f blue:50/255.0f alpha:1.0];
    [vwScreen addSubview:vwHeader];
    
    UILabel *lblStart=[[UILabel alloc]initWithFrame:CGRectMake(0, 2, vwHeader.frame.size.width, vwHeader.frame.size.height)];
    lblStart.text=@"Steps To Follow";
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
    
    UILabel *lblStep1=[[UILabel alloc]initWithFrame:CGRectMake(5, 55,320, 40)];
    lblStep1.text=@"1.Pull down the notification center";
    lblStep1.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    lblStep1.textColor=[UIColor blackColor];
    lblStep1.textAlignment=NSTextAlignmentLeft;
    [scroll addSubview:lblStep1];
    
    int DeviceHeight = self.view.frame.size.height;
    UIImageView *iViewStep1=[[UIImageView alloc] init];
    if (DeviceHeight==667) {
        iViewStep1.frame = CGRectMake(62.5, 100, 250, 320);
    }else if (DeviceHeight==736){
        iViewStep1.frame = CGRectMake(82, 100, 250, 320);
    }else{
        iViewStep1.frame = CGRectMake(35, 100, 250, 320);
    }
    iViewStep1.image=[UIImage imageNamed:@"Step1.png"];
    [scroll addSubview:iViewStep1];
    
    UILabel *lblStep2=[[UILabel alloc]initWithFrame:CGRectMake(5, 425,320, 40)];
    lblStep2.text=@"2.Tap Edit";
    lblStep2.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    lblStep2.textColor=[UIColor blackColor];
    lblStep2.textAlignment=NSTextAlignmentLeft;
    [scroll addSubview:lblStep2];
    
    UIImageView *iViewStep2=[[UIImageView alloc]init];
    if (DeviceHeight==667) {
        iViewStep2.frame = CGRectMake(62.5, 470, 250, 320);
    }else if (DeviceHeight==736){
        iViewStep2.frame = CGRectMake(82, 470, 250, 320);
    }else{
        iViewStep2.frame = CGRectMake(35, 470, 250, 320);
    }
    iViewStep2.image=[UIImage imageNamed:@"Step2.png"];
    [scroll addSubview:iViewStep2];
    
    UILabel *lblStep3=[[UILabel alloc]initWithFrame:CGRectMake(5, 800,320, 40)];
    lblStep3.text=@"3.Tap + to  add the calculator widget.";
    lblStep3.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    lblStep3.textColor=[UIColor blackColor];
    lblStep3.textAlignment=NSTextAlignmentLeft;
    [scroll addSubview:lblStep3];
    
    UIImageView *iViewStep3=[[UIImageView alloc]init];
    if (DeviceHeight==667) {
        iViewStep3.frame = CGRectMake(62.5, 850, 250, 320);
    }else if (DeviceHeight==736){
        iViewStep3.frame = CGRectMake(82, 850, 250, 320);
    }else{
        iViewStep3.frame = CGRectMake(35, 850, 250, 320);
    }
    iViewStep3.image=[UIImage imageNamed:@"Step3.png"];
    [scroll addSubview:iViewStep3];
    
    UILabel *lblStep4=[[UILabel alloc]initWithFrame:CGRectMake(5, 1175,320, 40)];
    lblStep4.text=@"4.Calculator widget added";
    lblStep4.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    lblStep4.textColor=[UIColor blackColor];
    lblStep4.textAlignment=NSTextAlignmentLeft;
    [scroll addSubview:lblStep4];
    
    UIImageView *iViewStep4=[[UIImageView alloc]init];
    if (DeviceHeight==667) {
        iViewStep4.frame = CGRectMake(62.5, 1220, 250, 320);
    }else if (DeviceHeight==736){
        iViewStep4.frame = CGRectMake(82, 1220, 250, 320);
    }else{
        iViewStep4.frame = CGRectMake(35, 1220, 250, 320);
    }
    iViewStep4.image=[UIImage imageNamed:@"Step4.png"];
    [scroll addSubview:iViewStep4];

}

-(void)MoveBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
