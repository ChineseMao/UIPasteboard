//
//  PasteboardImageView.h
//  Practice_UIPasteboard
//
//  Created by 毛韶谦 on 2016/12/13.
//  Copyright © 2016年 毛韶谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "transSometing.h"

@interface PasteboardImageView : UIImageView

@property (nonatomic, weak)id <transSometing>delegate;

@end
