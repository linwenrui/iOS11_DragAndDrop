//
//  ImageTableViewCell.m
//  iOS11_DragAndDrop
//
//  Created by LWR on 2017/11/5.
//  Copyright © 2017年 lwr. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    [self.contentView addSubview:self.targetImageView];
}

- (void)layoutSubviews {

    [super layoutSubviews];
    CGFloat margin = 20;
    self.targetImageView.frame = CGRectMake(margin, margin, self.bounds.size.width - 2 * margin, self.bounds.size.height - 2 * margin);
}

#pragma mark - setters && getters
- (UIImageView *)targetImageView {

    if (!_targetImageView) {
        
        _targetImageView = [[UIImageView alloc] init];
        _targetImageView.contentMode = UIViewContentModeScaleAspectFill;
        _targetImageView.layer.cornerRadius = 10;
        _targetImageView.clipsToBounds = YES;
    }
    return _targetImageView;
}

@end
