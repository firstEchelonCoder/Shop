//
//  OrderTableCell.m
//  Shop
//
//  Created by 朱啸 on 2018/5/7.
//  Copyright © 2018年 朱啸. All rights reserved.
//

#import "OrderTableCell.h"


@interface OrderTableCell()

@property (strong, nonatomic)   UIImageView *iconImage; //商品图片
@property (strong, nonatomic)   UILabel *goodsTitle;    //商品名字
@property (strong, nonatomic)   UILabel *goodsPrice;    //商品价钱


@end


@implementation OrderTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.goodsTitle];
        [self addSubview:self.goodsPrice];
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof (self) weakSelf = self;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.height.equalTo(@16);
    }];
    
    [_goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-25);
        make.height.equalTo(@16);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
    }];
}

- (void)setOrderArray:(NSArray *)orderArray{
    _iconImage.image = [UIImage imageWithContentsOfFile:[orderArray valueForKey:@"product_iconimage"]];
    _goodsTitle.text = [orderArray valueForKey:@"product_name"];
    _goodsPrice.text = [NSString stringWithFormat:@"%@x%@",[orderArray valueForKey:@"product_price"],[orderArray valueForKey:@"number"]];
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}

- (UILabel *)goodsTitle{
    if (!_goodsTitle) {
        _goodsTitle = [[UILabel alloc]init];
        _goodsTitle.font = [UIFont systemFontOfSize:15.0];
        _goodsTitle.textColor = [UIColor blackColor];
    }
    return _goodsTitle;
}

- (UILabel *)goodsPrice{
    if (!_goodsPrice) {
        _goodsPrice = [[UILabel alloc]init];
        _goodsPrice.textAlignment = NSTextAlignmentRight;
        _goodsPrice.textColor = [UIColor redColor];
        _goodsPrice.font = [UIFont systemFontOfSize:17.0];
    }
    return _goodsPrice;
}



@end
