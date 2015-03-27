//
//  TodayViewController.m
//  CurrentLocationWidget
//
//  Created by Nivedita on 3/5/15.
//  Copyright (c) 2015 Nivedita. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "Display.h"
@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation TodayViewController
@synthesize mkMap,locationManager;
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(userDefaultsDidChange:)
//                                                     name:NSUserDefaultsDidChangeNotification
//                                                   object:nil];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   self.preferredContentSize = CGSizeMake(0,300);
    [self Viewinititalization];
    
}

- (void)Viewinititalization
{
    NSMutableArray *marrCharacter=[[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"/",@"7",@"8",@"9",@"X",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"+",@"0",@".",@"C",@"=", nil];
    [vwMap removeFromSuperview];
    vwMap=[[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 300)];
    vwMap.backgroundColor=[UIColor clearColor];
    [self.view addSubview:vwMap];
    
    textDisplay= [[UITextField alloc] initWithFrame:CGRectMake(40,10, 240, 40)];
    textDisplay.borderStyle = UITextBorderStyleRoundedRect;
    textDisplay.font = [UIFont systemFontOfSize:22.0];
    textDisplay.placeholder = @"0";
    [textDisplay setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textDisplay setValue:[UIFont systemFontOfSize: 22.0] forKeyPath:@"_placeholderLabel.font"];
    textDisplay.alpha=0.6;
    textDisplay.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:50/255.0f blue:50/255.0f alpha:1.0];
    textDisplay.textColor=[UIColor whiteColor];
     textDisplay.userInteractionEnabled=NO;
    textDisplay.adjustsFontSizeToFitWidth=YES;
    textDisplay.textAlignment=NSTextAlignmentRight;
    textDisplay.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textDisplay.delegate = self;
    [vwMap addSubview:textDisplay];
    
    int x=40;
    int y=60;
    int divisor=1;
    
    for (int i=0; i<[marrCharacter count]; i++) {
        UIButton * btnKey=[UIButton buttonWithType:UIButtonTypeCustom];
        btnKey.frame=CGRectMake(x, y, 55, 40);
        btnKey.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:50/255.0f blue:50/255.0f alpha:1.0];
        btnKey.tag=i;
        if(i==0||i==1||i==2)
        {
            btnKey.alpha=0;
        }
        else{
        btnKey.alpha=0.6;
        }
        btnKey.layer.cornerRadius=5.0;
        btnKey.titleLabel.font=[UIFont boldSystemFontOfSize:22.0];
        [btnKey addTarget:self action:@selector(clkChr:) forControlEvents:UIControlEventTouchUpInside];
        [btnKey setTitle:[marrCharacter objectAtIndex:i] forState:UIControlStateNormal];
        [btnKey setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
        [vwMap addSubview:btnKey];
        
        if(divisor%4==0)
        {
            y+=47;
            x = 40;
        }
        else
        {
            x +=62;
        }
        
        divisor++;
    }
    
    UIButton * btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame=CGRectMake(40, 60, 175, 40);
    btnBack.backgroundColor=[UIColor colorWithRed:51.0/255.0f green:50/255.0f blue:50/255.0f alpha:1.0];
    btnBack.alpha=0.6;
    btnBack.layer.cornerRadius=5.0;
    btnBack.titleLabel.font=[UIFont boldSystemFontOfSize:22.0];
    [btnBack addTarget:self action:@selector(clkBackspace) forControlEvents:UIControlEventTouchUpInside];
    [btnBack setTitle:@"Backspace" forState:UIControlStateNormal];
    [btnBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [vwMap addSubview:btnBack];

    
}

-(void)clkBackspace
{
    NSString *string=textDisplay.text;
    if ([string length] > 0) {
        string = [string substringToIndex:[string length] - 1];
        textDisplay.text=string;
    } else {
        //no characters to delete... attempting to do so will result in a crash
        textDisplay.text=@"";
    }
}


-(void)clkChr:(UIButton*)btn
{
    if (btn.tag==0) {
        
    }
    if (btn.tag==1) {
        
    }
    if (btn.tag==2) {
        
    }
    if (btn.tag==3) {
    
        operation = Divide;
        storage = textDisplay.text;
        textDisplay.text=@"";
    }
    if (btn.tag==4) {
     
        [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@7",textDisplay.text];
    }
    if (btn.tag==5) {
    
        [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@8",textDisplay.text];
    }
    if (btn.tag==6) {
      
        [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@9",textDisplay.text];
    }
    if (btn.tag==7) {
     
        operation = Multiply;
        storage = textDisplay.text;
        textDisplay.text=@"";

    }
    if (btn.tag==8) {
     
        [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@4",textDisplay.text];
    }
    if (btn.tag==9) {
    
         [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@5",textDisplay.text];
    }
    if (btn.tag==10) {
  
      [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@6",textDisplay.text];
    }
    if (btn.tag==11) {
       
        operation = Minus;
        storage = textDisplay.text;
        textDisplay.text=@"";

    }
    if (btn.tag==12) {
     
       [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@1",textDisplay.text];
    }
    if (btn.tag==13) {
        
      [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@2",textDisplay.text];
    }
    if (btn.tag==14) {
      
        [self checkTextfieldValue];
         textDisplay.text=[NSString stringWithFormat:@"%@3",textDisplay.text];
    }
    if (btn.tag==15) {
       
        operation = Plus;
        storage = textDisplay.text;
        textDisplay.text=@"";

    }
    if (btn.tag==16) {
       
         textDisplay.text=[NSString stringWithFormat:@"%@0",textDisplay.text];
    }
    if (btn.tag==17) {
      
           textDisplay.text=[NSString stringWithFormat:@"%@.",textDisplay.text];
    }
    if (btn.tag==18) {
        
        textDisplay.text=@"";
    }
    if (btn.tag==19) {
        
        if ([textDisplay.text isEqualToString:@"0"]) {
             textDisplay.text=@"0";
             textDisplay.text=@"";
        }
        else if ([textDisplay.text isEqualToString:@"0.00"])
        {
            textDisplay.text=@"0.00";
             textDisplay.text=@"";
        }
        else{
       
        NSString *val = textDisplay.text;
        switch(operation) {
            case Plus :
                textDisplay.text= [NSString stringWithFormat:@"%0.2f",[val floatValue]+[storage floatValue]];
                break;
            case Minus:
                textDisplay.text= [NSString stringWithFormat:@"%0.2f",[storage floatValue]-[val floatValue]];
                break;
            case Divide:
                textDisplay.text= [NSString stringWithFormat:@"%0.2f",[storage floatValue]/[val floatValue]];
                break;
            case Multiply:
                textDisplay.text= [NSString stringWithFormat:@"%0.2f",[val floatValue]*[storage floatValue]];
                break;
        }
        }
    }
}

-(void)checkTextfieldValue
{
    if ([textDisplay.text isEqualToString:@"0.00"])
    {
        textDisplay.text=@"0.00";
        textDisplay.text=@"";
    }
}

-(void)clkButton
{
    [lbl setHidden:NO];
}



- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
      [self Viewinititalization];
    // If an error is encoutered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

- (void)userDefaultsDidChange:(NSNotification *)notification {
  
  

}


@end

