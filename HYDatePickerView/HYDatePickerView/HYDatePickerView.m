//
//  HYDatePickerView.m
//  VIVAT
//
//  Created by 黄海燕 on 16/6/30.
//  Copyright © 2016年 AnBang. All rights reserved.
//

#import "HYDatePickerView.h"

@interface HYDatePickerView (){
    UIDatePicker *datePicker;
    UIView *titleView;
}
@end

@implementation HYDatePickerView
@synthesize delegate = _delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    titleView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:titleView];
    UIButton *cancelBtn = [[UIButton alloc]init];
    cancelBtn.frame = CGRectMake(20, 0, 60, 40);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelSelectDate:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:cancelBtn];
    
    UIButton *okBtn = [[UIButton alloc]init];
    okBtn.frame = CGRectMake(self.frame.size.width-60, 0, 60, 40);
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(sureSelectDate:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:okBtn];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 25, self.frame.size.width, self.frame.size.height)];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    NSDate *minDate = [[NSDate alloc] initWithTimeIntervalSince1970:0];
    [datePicker setMinimumDate:minDate];
    [datePicker setMaximumDate:[NSDate date]];
    [self addSubview:datePicker];
}

- (BOOL)isPresent
{
    return isPressent;
}

- (void)presentPickerView
{
    isPressent = YES;
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self setCenter:CGPointMake(self.center.x, self.center.y)];
    
                     } completion:^(BOOL finished) {
    
                     }];
}

- (void)dismissPickerView:(BOOL)isDate
{
    isPressent = NO;
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self setCenter:CGPointMake(self.center.x, self.center.y + self.frame.size.height)];
                     } completion:^(BOOL finished) {
                         if (_delegate && [_delegate respondsToSelector:@selector(selectDatePicker:)]) {
                             [_delegate selectDatePicker: isDate == YES ? datePicker.date : nil];
                         }
                     }];
    
}

- (void)cancelSelectDate:(id)sender
{
    [self dismissPickerView:NO];
}

- (void)sureSelectDate:(id)sender
{
    [self dismissPickerView:YES];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if ([touch view] == self){
        [self cancelSelectDate:nil];
    }
}

@end
