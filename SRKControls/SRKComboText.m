//
//  SRKComboText.m
//  ComboBox
//
//  Created by Sagar R. Kothari on 06-Mar-2015
//  Copyright 2015 http://Sugartin.info. All rights reserved.
//

#import "SRKComboText.h"

@interface SRKComboText () <UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate>
@property (nonatomic, strong) UIActionSheet *action;
@property (nonatomic, strong) UIView *v;
@property (nonatomic, strong) UIView *viewOfPicker;
@property (nonatomic, strong) UIPickerView *pkrView;
@property (nonatomic, strong) UIToolbar *tBar;
@property (nonatomic) BOOL defaultFirstSelect;
@end

@implementation SRKComboText

#define kTagToolBar		1
#define kTagPicker		2

 
- (void)showOptions {
    self.defaultFirstSelect = YES;
	if(!self.viewOfPicker) {
		self.viewOfPicker=[[UIView alloc] init];
		self.pkrView=[[UIPickerView alloc] init];
		self.pkrView.dataSource=self;
		self.pkrView.delegate=self;
		self.pkrView.tag=kTagPicker;
		self.pkrView.showsSelectionIndicator=YES;
		[self.pkrView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin];
		
		[self.viewOfPicker addSubview:self.pkrView];
		
		self.tBar=[[UIToolbar alloc] init ]; //WithFrame:CGRectMake(0, 0, self.delegateVCtr.view.frame.size.width, 44)];
		UIBarButtonItem *itemCancel=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clear)];
		UIBarButtonItem *itemFlex=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		UIBarButtonItem *itemDone=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
		[self.tBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin];
		[self.tBar setItems:[NSArray arrayWithObjects:itemCancel,itemFlex,itemDone, nil] animated:YES];
		self.tBar.tag=kTagToolBar;
		[self.tBar setTintColor:[UIColor blackColor]];
		[self.viewOfPicker addSubview:self.tBar];
		[self.viewOfPicker setClipsToBounds:YES];
	}
    
    BOOL isLandscape = UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]);
    CGFloat height = (isLandscape)?[[UIScreen mainScreen] bounds].size.width:[[UIScreen mainScreen] bounds].size.height;
    CGFloat width = (isLandscape)?[[UIScreen mainScreen] bounds].size.height:[[UIScreen mainScreen] bounds].size.width;
    self.viewOfPicker.frame=CGRectMake(0, height-230, width, 230);
    self.pkrView.frame=CGRectMake(0, 44, width, 216);
    self.tBar.frame=CGRectMake(0, 0, width, 44);
    
    [self.pkrView reloadAllComponents];
    if(self.defaultFirstSelect) {
        [self.pkrView selectRow:0 inComponent:0 animated:YES];
        [self pickerView:self.pkrView didSelectRow:0 inComponent:0];
    }
    
    self.v = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.v.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:0.45];
    self.v.clipsToBounds = YES;
    self.v.opaque = YES;
    self.v.autoresizesSubviews = NO;
    self.pkrView.backgroundColor = [UIColor lightGrayColor];
    [self.v addSubview:self.viewOfPicker];
    [[[UIApplication sharedApplication] keyWindow].rootViewController.view addSubview:self.v];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [self.delegateVCtr srkComboTextNumberOfOptions:self];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [self.delegateVCtr srkComboText:self textForRow:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[self.delegateVCtr srkComboText:self didSelectRow:row];
}

- (void)clear {
	[self setText:@""];
    [self.v removeFromSuperview];
	[self.action dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)done {
    [self.v removeFromSuperview];
	[self.action dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)changeToolBarColor:(UIColor*)color {
	[self.tBar setTintColor:color];
}

@end
