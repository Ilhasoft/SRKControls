//
//  SRKComboText.h
//  ComboBox
//
//  Created by Sagar R. Kothari on 06-Mar-2015.
//  Copyright 2015 http://sagarrkothari.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRKComboText;

@protocol SRKComboTextDelegate <NSObject>
@required
- (NSString*)srkComboText:(SRKComboText*)srkComboText textForRow:(NSUInteger)row;
- (NSInteger)srkComboTextNumberOfOptions:(SRKComboText*)srkComboText;
- (void)srkComboText:(SRKComboText*)srkComboText didSelectRow:(NSUInteger)row;
@optional
- (void)btnDoneTapped:(SRKComboText*)srkComboText;
- (void)btnCancelTapped:(SRKComboText*)srkComboText;
@end

@interface SRKComboText : UITextField

@property (nonatomic, assign) IBOutlet UIViewController<SRKComboTextDelegate> *delegateVCtr;

- (void)showOptions;
- (void)changeToolBarColor:(UIColor*)color;
- (void)changePickerBackgroundColor:(UIColor *)color;

@end
