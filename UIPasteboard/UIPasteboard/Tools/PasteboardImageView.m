//
//  PasteboardImageView.m
//  Practice_UIPasteboard
//
//  Created by 毛韶谦 on 2016/12/13.
//  Copyright © 2016年 毛韶谦. All rights reserved.
//

#import "PasteboardImageView.h"

@implementation PasteboardImageView

- (BOOL)canBecomeFirstResponder {
    
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
        
    return (action == @selector(copy:) || action == @selector(paste:) );
}

-(void)copy:(id)sender{
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    if (self.image) {
        [pasteboard setImage:self.image];
    }

    if ([self.delegate respondsToSelector:@selector(transSomeTing:)]) {
        [self.delegate transSomeTing:pasteboard.image];
        NSLog(@"%@",self.image);
    }
    NSLog(@"您点击的是拷贝%@",pasteboard.items);
}

-(void)paste:(id)sender{
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    UIImage *image = [pasteboard image];
    if (image) {
        self.image = image;
    }
    NSLog(@"您点击的是粘贴");
}

- (void)cut:(id)sender {
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setImage:self.image];
    NSLog(@"您点击的是剪切");
}

- (void)select:(id)sender {
    
    NSLog(@"您点击的是选择");
}

-(void)selectAll:(id)sender {
    
    NSLog(@"您点击的是全选");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
