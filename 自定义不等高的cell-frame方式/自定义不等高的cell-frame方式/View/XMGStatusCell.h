//
//  XMGStatusCell.h
//  自定义不等高的cell-frame方式
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGStatus;

@interface XMGStatusCell : UITableViewCell

/** 模型数据*/
@property (nonatomic, strong) XMGStatus *status;
@end
