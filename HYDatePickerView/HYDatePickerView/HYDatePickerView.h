//
//  HYDatePickerView.h
//  VIVAT
//
//  Created by 黄海燕 on 16/6/30.
//  Copyright © 2016年 AnBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYDatePickerViewDelegate;

@interface HYDatePickerView : UIView
{
    BOOL isPressent;
}

@property (nonatomic ,unsafe_unretained)id <HYDatePickerViewDelegate> delegate;

- (BOOL)isPresent;
- (void)presentPickerView;
- (void)dismissPickerView:(BOOL)isDate;

@end

@protocol HYDatePickerViewDelegate <NSObject>
@optional

- (void)selectDatePicker:(NSDate *)date;

@end