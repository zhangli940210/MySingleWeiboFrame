//
//  XMGStatus.h
//  自定义不等高的cell-frame方式
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//


#import <UIKit/UIKit.h>

#define XMGTextFont [UIFont systemFontOfSize:14]
#define XMGNameFont [UIFont systemFontOfSize:17]

@interface XMGStatus : NSObject
/** 头像*/
@property (nonatomic, strong) NSString *icon;
/** 昵称*/
@property (nonatomic, strong) NSString *name;
/** vip*/
@property (nonatomic, assign, getter=isVip) BOOL vip;
/** 正文*/
@property (nonatomic, strong) NSString *text;
/** 配图*/
@property (nonatomic, strong) NSString *picture;

/** 图像的frame*/
@property (nonatomic ,assign)CGRect iconFrame;
/** 昵称的frame*/
@property (nonatomic ,assign)CGRect nameFrame;
/** vip的frame*/
@property (nonatomic ,assign)CGRect vipFrame;
/** 正文的frame*/
@property (nonatomic ,assign)CGRect textFrame;
/** 配图的frame*/
@property (nonatomic ,assign)CGRect pictureFrame;

@property (nonatomic ,assign)CGFloat cellHeight;

@end
