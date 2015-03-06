//
//  ViewController.m
//  SRKControlsDemo
//
//  Created by Sagar Kothari on 3/6/15.
//  Copyright (c) 2015 sagarrkothari. All rights reserved.
//

#import "ViewController.h"
#import "SRKControls.h"

@interface ViewController () <SRKComboTextDelegate, SRKDateTextDelegate>
@property (weak, nonatomic) IBOutlet SRKComboText *myComboText;
@property (weak, nonatomic) IBOutlet SRKDateText *myDatePicker;
@property (nonatomic, strong) NSArray *arrayForPicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
