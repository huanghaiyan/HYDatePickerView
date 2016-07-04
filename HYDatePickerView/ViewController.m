//
//  ViewController.m
//  HYDatePickerView
//
//  Created by 黄海燕 on 16/7/1.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"
#import "HYDatePickerView.h"
@interface ViewController ()<HYDatePickerViewDelegate>
{
    HYDatePickerView *pickerView;
}

@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.dateButton addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)selectDate:(UIButton *)button
{
    if (pickerView == nil){
        pickerView = [[HYDatePickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-240, self.view.frame.size.width, 240)];
        [self.view addSubview:pickerView];
        pickerView.delegate = self;
    }
    [pickerView presentPickerView];

}

#pragma mark -DatePickerViewDelegate
- (void)selectDatePicker:(NSDate *)date{
    [pickerView removeFromSuperview];
    pickerView = nil;
    pickerView.delegate = nil;
    if (date != nil){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        
        [self.dateTextField setText:[dateFormat stringFromDate:date]];
    } else {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
