//
//  XMGStatusCell.m
//  自定义不等高的cell-frame方式
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "XMGStatusCell.h"
#import "XMGStatus.h"

@interface XMGStatusCell ()

/** 图像*/
@property (nonatomic ,weak)UIImageView *iconImageView;
/** 昵称*/
@property (nonatomic ,weak)UILabel *nameLabel;
/** vip*/
@property (nonatomic ,weak)UIImageView *vipImageView;
/** 正文*/
@property (nonatomic ,weak)UILabel *text_Label;
/** 配图*/
@property (nonatomic ,weak)UIImageView *pictureImageView;

@end

@implementation XMGStatusCell

// 添加子控件，并设置一些属性
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        /** 图像*/
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        /** 昵称*/
        UILabel *nameLabel = [[UILabel alloc] init];
        // 设置字体
        nameLabel.font = XMGNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        /** vip*/
        UIImageView *vipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipImageView];
        // 设置图片
        vipImageView.image = [UIImage imageNamed:@"vip"];
        // 设置模式,居中
        vipImageView.contentMode = UIViewContentModeCenter;
        self.vipImageView = vipImageView;
        /** 正文*/
        UILabel *text_Label = [[UILabel alloc] init];
        [self.contentView addSubview:text_Label];
        // 设置字体
        text_Label.font = XMGTextFont;
        // 设置自动换行
        text_Label.numberOfLines = 0;
        self.text_Label = text_Label;
        /** 配图*/
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
      
    }
    return self;
}

// 计算设置子控件的位置和尺寸
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconImageView.frame = self.status.iconFrame;
    self.nameLabel.frame = self.status.nameFrame;
    self.vipImageView.frame = self.status.vipFrame;
    self.text_Label.frame = self.status.textFrame;
    self.pictureImageView.frame = self.status.pictureFrame;
}

// 赋值
- (void)setStatus:(XMGStatus *)status
{
    _status = status;
    // 设置图像的图片
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    // 设置昵称
    self.nameLabel.text = status.name;
    // 判断是否是会员
    if (status.isVip) { // 是会员
        // 设置昵称为橙色
        self.nameLabel.textColor = [UIColor orangeColor];
        // 显示会员图标
        self.vipImageView.hidden = NO;
    } else { // 不是会员
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipImageView.hidden = YES;
    }
    // 设置正文
    self.text_Label.text = status.text;
    // 判断是否有配图
    if (status.picture) { // 有配图
        // 显示配图
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    } else { // 没有配图
        // 隐藏配图
        self.pictureImageView.hidden = YES;
    }
}
@end
