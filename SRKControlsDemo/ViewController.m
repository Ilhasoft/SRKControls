//
//  ViewController.m
//  SRKControlsDemo
//
//  Created by Sagar Kothari on 3/6/15.
//  Copyright (c) 2015 sagarrkothari. All rights reserved.
//

#import "ViewController.h"
#import "SRKControls.h"

@interface ViewController () <SRKComboTextDelegate, SRKDateTextDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet SRKComboText *myComboText;
@property (weak, nonatomic) IBOutlet SRKDateText *myDatePicker;
@property (nonatomic, strong) NSArray *arrayForPicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayForPicker = [NSArray arrayWithObjects:@"Sagar", @"sagarrkothari.com", @"sag333ar", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([textField isKindOfClass:[SRKComboText class]]) {
        [(SRKComboText *)textField showOptions];
        return NO;
    } else if ([textField isKindOfClass:[SRKDateText class]]) {
        [(SRKDateText *)textField setDatePickerMode:SRKDatePickerModeDate];
        [(SRKDateText *)textField showDatePicker];
        return NO;
    }
    return YES;
}

#pragma mark - SRKComboTextDelegate

- (NSString*)srkComboText:(SRKComboText*)srkComboText textForRow:(NSUInteger)row {
    return [self.arrayForPicker objectAtIndex:row];
}

- (NSInteger)srkComboTextNumberOfOptions:(SRKComboText*)srkComboText {
    return self.arrayForPicker.count;
}

- (void)srkComboText:(SRKComboText*)srkComboText didSelectRow:(NSUInteger)row {
    self.myComboText.text = [self.arrayForPicker objectAtIndex:row];
}

- (void)btnDoneTapped:(SRKComboText*)srkComboText {
    NSLog(@"Something if you want to do when user taps on Done button.");
}

- (void)btnCancelTapped:(SRKComboText*)srkComboText {
    self.myComboText.text = @"";
}

#pragma mark - SRKDateTextDelegate

- (void)srkDateText:(SRKDateText*)srkDateText dateChangedTo:(NSDate*)date {
    self.myDatePicker.text = date.description;
}

@end
