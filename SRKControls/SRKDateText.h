//
//  SRKDateText.h
//  SRKCustomControls
//
//  Created by Sagar R. Kothari on 06-Mar-2015.
//  Copyright 2015 http://sagarrkothari.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SRKDatePickerModeTime,
    SRKDatePickerModeDate,
    SRKDatePickerModeDateAndTime,
    SRKDatePickerModeCountDownTimer
} SRKDatePickerMode;

@class SRKDateText;

@protocol SRKDateTextDelegate <NSObject>

@required
- (void)srkDateText:(SRKDateText*)srkDateText dateChangedTo:(NSDate*)date;

@end



@interface SRKDateText : UITextField

@property	(nonatomic, assign)		IBOutlet UIViewController<SRKDateTextDelegate>	*delegateVCtr;
@property	(nonatomic)				SRKDatePickerMode			datePickerMode;
@property	(nonatomic,strong)		NSDate						*date;
@property	(nonatomic,strong)		NSDate						*minimumDate;
@property	(nonatomic,retain)		NSDate						*maximumDate;
@property	(nonatomic)				NSTimeInterval				countDownDuration;
@property	(nonatomic)				NSInteger					minuteInterval;

- (void)setDate:(NSDate *)date animated:(BOOL)animated;
- (void)showDatePicker;
- (void)changeToolBarColor:(UIColor*)color;
- (void)changePickerBackgroundColor:(UIColor *)color;

@end
