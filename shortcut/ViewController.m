//
//  ViewController.m
//  shortcut
//
//  Created by Gabriel Massana on 07/04/2014.
//  Copyright (c) 2014 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shortcut:) name:UITextFieldTextDidChangeNotification object:self.textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) shortcut: (NSNotification*) notification
{
    UITextField *notificationTextField = [notification object];

    if (notificationTextField == self.textField)
    {
        [self checkDoubleA:notificationTextField];
        [self checkDoubleAB:notificationTextField];
        [self checkDoubleSpace:notificationTextField];
    }
}

-(void) checkDoubleA: (UITextField*) textField
{
    NSMutableString *string =  [textField.text mutableCopy];
    NSRange range = [string rangeOfString:@"aa"];
    if (range.location == NSNotFound)
    {
        NSLog(@"string was not found");
    }
    else
    {
        [string replaceCharactersInRange:range withString:@"ä"];
    }
    textField.text = string;
}

-(void) checkDoubleAB: (UITextField*) textField
{
    NSMutableString *string =  [textField.text mutableCopy];
    NSRange range = [string rangeOfString:@"ab"];
    if (range.location == NSNotFound)
    {
        NSLog(@"string was not found");
    }
    else
    {
        [string replaceCharactersInRange:range withString:@"XYZ"];
    }
    textField.text = string;
}

- (void) checkDoubleSpace: (UITextField*) textField
{
    NSMutableString *string =  [textField.text mutableCopy];
    NSRange range = [string rangeOfString:@"  "];
    if (range.location == NSNotFound)
    {
        NSLog(@"String was not found");
    }
    else
    {
        [string replaceCharactersInRange:range withString:@" "];
    }
    textField.text = string;
}



@end
