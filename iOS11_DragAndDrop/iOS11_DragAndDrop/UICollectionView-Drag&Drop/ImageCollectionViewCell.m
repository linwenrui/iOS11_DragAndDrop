//
//  ImageCollectionViewCell.m
//  iOS11_DragAndDrop
//
//  Created by LWR on 2017/11/5.
//  Copyright © 2017年 lwr. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {

        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    [self.contentView addSubview:self.targetImageView];
    self.targetImageView.frame = self.contentView.bounds;
}

- (void)dragStateDidChange:(UICollectionViewCellDragState)dragState {
    [super dragStateDidChange:dragState];

    switch (dragState) {
        case UICollectionViewCellDragStateNone:
            NSLog(@"UICollectionViewCellDragStateNone");
            break;

        case UICollectionViewCellDragStateLifting:
            NSLog(@"UICollectionViewCellDragStateLifting");
            break;

        case UICollectionViewCellDragStateDragging:
            NSLog(@"UICollectionViewCellDragStateDragging");
            break;

        default:
            break;
    }

    // 在该方法监控到最新的拖动状态，可添加自定义外观和行为

    //    UICollectionViewCellDragStateNone,
    /* The cell is in the "lifting" state.
     */
    //    UICollectionViewCellDragStateLifting,

    /* A cell in the "dragging" state is left behind with a
     * "ghosted" appearance to denote where the drag
     * started from.
     */
    //    UICollectionViewCellDragStateDragging
}

#pragma mark - setters && getters
- (UIImageView *)targetImageView {
    if (!_targetImageView) {
        _targetImageView = [[UIImageView alloc] init];
        _targetImageView.contentMode = UIViewContentModeScaleAspectFill;
        _targetImageView.layer.cornerRadius = 5;
        _targetImageView.clipsToBounds = YES;
    }
    return _targetImageView;
}

@end
