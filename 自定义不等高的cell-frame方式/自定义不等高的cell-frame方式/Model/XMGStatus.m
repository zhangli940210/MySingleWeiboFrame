//
//  XMGStatus.m
//  自定义不等高的cell-frame方式
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "XMGStatus.h"

@implementation XMGStatus

- (CGFloat)cellHeight
{
    if (_cellHeight == 0) {
        CGFloat space = 10;
        /** 图像*/
        CGFloat iconX = space;
        CGFloat iconY = space;
        CGFloat iconWH = 40;
        self.iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        /** 昵称*/
        CGFloat nameX = CGRectGetMaxX(self.iconFrame) + space;
        CGFloat nameY = iconY;
        NSDictionary *nameAttt = @{NSFontAttributeName : XMGNameFont};
        // 计算昵称文字的尺寸
        CGSize nameSize = [self.name sizeWithAttributes:nameAttt];
        CGFloat nameW = nameSize.width;
        CGFloat nameH = nameSize.height;
        self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
        
        /** vip*/
        if (self.isVip) { // 如果有，就计算
            CGFloat vipW = 14;
            CGFloat vipH = nameH;
            CGFloat vipX = CGRectGetMaxX(self.nameFrame) + space;
            CGFloat vipY = nameY;
            self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
        }
        
        /** 正文*/
        CGFloat textX = iconX;
        CGFloat textY = CGRectGetMaxY(self.iconFrame) + space;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
        NSDictionary *textAttt = @{NSFontAttributeName : XMGTextFont};
        // 最大宽度是textW,高度不限制
        CGSize maxTextSize = CGSizeMake(textW, MAXFLOAT);
        // 计算正文文字的高度
        CGFloat textH = [self.text boundingRectWithSize:maxTextSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttt context:nil].size.height;
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        /** 配图*/
        if (self.picture) { // 有配图
            CGFloat pictureX = iconX;
            CGFloat pictureY = CGRectGetMaxY(self.textFrame) + space;
            CGFloat pictureWH = 100;
            self.pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
            _cellHeight = CGRectGetMaxY(self.pictureFrame) + space;
        } else {
            _cellHeight = CGRectGetMaxY(self.textFrame) + space;
        }

    }
    return _cellHeight;
}

@end
