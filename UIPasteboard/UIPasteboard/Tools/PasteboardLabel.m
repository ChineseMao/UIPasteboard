//
//  PasteboardLabel.m
//  Practice_UIPasteboard
//
//  Created by 毛韶谦 on 2016/12/13.
//  Copyright © 2016年 毛韶谦. All rights reserved.
//

#import "PasteboardLabel.h"

@implementation PasteboardLabel


- (BOOL)canBecomeFirstResponder {
    
    return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return (action == @selector(copy:) || action == @selector(paste:)  || action == @selector(cut:));
}

-(void)copy:(id)sender{
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.text];
    NSLog(@"您点击的是拷贝");
}

- (void)paste:(id)sender {
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    self.text = pasteboard.string;
    NSLog(@"您点击的是粘贴");
}
- (void)cut:(id)sender {
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.text];
    self.text = @"";
    NSLog(@"您点击的是剪切");

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
