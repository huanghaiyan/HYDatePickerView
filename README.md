# HYDatePickerView
使用时，导入头文件#import "HYDatePickerView.h"

遵守HYDatePickerViewDelegate代理协议

@interface ViewController ()<HYDatePickerViewDelegate>

{

    HYDatePickerView *pickerView;
    
}


点击时，弹出

if (pickerView == nil){

    pickerView = [[HYDatePickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-240, self.view.frame.size.width, 240)];
    
    [self.view addSubview:pickerView];
    
    pickerView.delegate = self;//设置代理
    
}

[pickerView presentPickerView];//弹出pickerView

  
实现代理方法

#pragma mark -DatePickerViewDelegate

- (void)selectDatePicker:(NSDate *)date{

    [pickerView removeFromSuperview];

    pickerView = nil;
    
    pickerView.delegate = nil;
    
    if (date != nil){
    
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        
        [dateFormat setDateFormat:@"dd-MM-yyyy"];
        
        
        [self.dateTextField setText:[dateFormat stringFromDate:date]];
        
    } else {
        
        
    }
    
}
