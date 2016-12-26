//
//  ViewController.m
//  Practice_UIPasteboard
//
//  Created by 毛韶谦 on 2016/12/13.
//  Copyright © 2016年 毛韶谦. All rights reserved.
//

#import "ViewController.h"
#import "PasteboardLabel.h"
#import "PasteboardImageView.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()<transSometing>

@property (strong, nonatomic) IBOutlet PasteboardImageView *leftImageView;
@property (strong, nonatomic) IBOutlet PasteboardImageView *rightImageView;
@property (strong, nonatomic) IBOutlet PasteboardLabel *leftLabel;
@property (strong, nonatomic) IBOutlet PasteboardLabel *rightLabel;
@property (strong, nonatomic) IBOutlet UIImageView *textImageView;

@property (assign, nonatomic) BOOL isOneLoad;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isOneLoad = YES;
    self.leftLabel.userInteractionEnabled = YES;
    self.rightLabel.userInteractionEnabled = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerWillShow) name:UIMenuControllerWillShowMenuNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerWillHide) name:UIMenuControllerWillHideMenuNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)longPressGestureAction:(UILongPressGestureRecognizer *)sender {
    
    if (_isOneLoad) {
        
        _isOneLoad = NO;
        [self.leftImageView becomeFirstResponder];
        self.leftImageView.userInteractionEnabled = YES;
        self.leftImageView.delegate = self;
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:self.leftImageView.frame inView:self.view];
        [menuController setMenuVisible:YES animated:YES];
        NSLog(@"%@",sender);
    }

}
- (IBAction)rightTapGesture:(UITapGestureRecognizer *)sender {
    
    if (_isOneLoad) {
        
        _isOneLoad = NO;
        [self.rightImageView becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:self.rightImageView.frame inView:self.view];
        [menuController setMenuVisible:YES animated:YES];
        NSLog(@"%@",sender);
    }

}
- (IBAction)labelLongPressGesture:(id)sender {
    
    if (_isOneLoad) {
        
        _isOneLoad = NO;
        [self.leftLabel becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:self.leftLabel.frame inView:self.view];
        [menuController setMenuVisible:YES animated:YES];
        NSLog(@"%@",sender);
    }

}
- (IBAction)labelTapGesture:(id)sender {
    
    if (_isOneLoad) {
        
        _isOneLoad = NO;
        [self.rightLabel becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:self.rightLabel.frame inView:self.view];
        [menuController setMenuVisible:YES animated:YES];
        NSLog(@"%@",sender);
    }

}



- (void)menuControllerWillShow {
    
    
}

- (void)menuControllerWillHide {
    
    _isOneLoad = YES;
}

- (void)transSomeTing:(id)sender {
    
    self.textImageView.image = sender;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
