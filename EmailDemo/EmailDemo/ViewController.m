//
//  ViewController.m
//  EmailDemo
//
//  Created by sogou-Yan on 17/1/20.
//  Copyright © 2017年 sogou. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
#import "EasyMailSender.h"
#import "EasyMailAlertSender.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)buttonSendEmailAction:(UIButton *)sender {
    
    NSLog(@"buttonSendEmailAction");
    NSString *attachedText = @"text";
    EasyMailAlertSender *mailSender = [EasyMailAlertSender easyMail:^(MFMailComposeViewController *controller) {
        // Setup
        [controller addAttachmentData:[attachedText dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"plain/text" fileName:@"test.txt"];
    } complete:^(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error) {
        // When Sent/Cancel - MFMailComposeViewControllerDelegate action
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [mailSender showFromViewController:self];
}

- (void)buttonSendEmailImageAction:(UIButton *)sender {
    
    NSLog(@"buttonSendEmailImageAction");
    NSString *attachedText = @"text";
    EasyMailAlertSender *mailSender = [EasyMailAlertSender easyMail:^(MFMailComposeViewController *controller) {
        // Setup
        [controller addAttachmentData:[attachedText dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"plain/text" fileName:@"test.txt"];
    } complete:^(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error) {
        // When Sent/Cancel - MFMailComposeViewControllerDelegate action
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [mailSender showFromViewController:self competion:^{
        [[[UIAlertView alloc] initWithTitle:@"Information" message:@"Mail View is presented" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}

- (void)initUI {
    
    UIButton *buttonSendEmailText = [self buttonWithTitle:@"Send Email" titleFont:17 titleColor:[UIColor redColor] backgroundColor:[UIColor whiteColor] cornerRadius:10 tag:0 borderColor:[UIColor redColor] borderWidth:1];
    [buttonSendEmailText addTarget:self action:@selector(buttonSendEmailAction:) forControlEvents:UIControlEventTouchUpInside];
    buttonSendEmailText.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:buttonSendEmailText];
    UIButton *buttonSendEmailImage = [self buttonWithTitle:@"Send Email" titleFont:17 titleColor:[UIColor redColor] backgroundColor:[UIColor whiteColor] cornerRadius:10 tag:0 borderColor:[UIColor redColor] borderWidth:1];
    [buttonSendEmailImage addTarget:self action:@selector(buttonSendEmailImageAction:) forControlEvents:UIControlEventTouchUpInside];
    buttonSendEmailImage.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:buttonSendEmailImage];
}

- (UIButton *)buttonWithTitle:(NSString *)title
                    titleFont:(CGFloat)font
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
                 cornerRadius:(CGFloat)cornerRadius
                          tag:(NSInteger)tag
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth {
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setBackgroundColor:backgroundColor];
    button.layer.cornerRadius = cornerRadius;
    button.tag = tag;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = borderWidth;
    return button;
}

@end
