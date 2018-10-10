//
//  YTBookCollectionViewCell.m
//  仿搜狗阅读
//
//  Created by Mac on 16/6/11.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "YTBookCollectionViewCell.h"

@implementation YTBookCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {

        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.frame = CGRectMake(self.frame.size.width - 20, 0, 20, 20);
        [_deleteBtn setImage:[UIImage imageNamed:@"bookSelectedIcon_nl"] forState:UIControlStateNormal];
        _deleteBtn.hidden = YES;
        [_deleteBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_deleteBtn];
        //长按手势
        UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longClick:)];
        [self addGestureRecognizer:lpgr];
        [_deleteBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat textViewHeight = 35;
        UIImageView *bookImV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height - textViewHeight)];
        _imageView = bookImV;
        
        [self addSubview:bookImV];
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bookImV.frame), self.width, textViewHeight)];
        _bookNameView = textView;
        textView.userInteractionEnabled = NO;
        textView.font = [UIFont systemFontOfSize:10];
        //textView.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_bookNameView];
        
        
    }
    return self;
}



//长按手势
- (void)longClick:(UILongPressGestureRecognizer *)lpgr
{
    //    _btn.hidden=NO;
    [self.delegate showAllDeleteBtn];
    
}

-(void)btnClick
{
    
    [self.delegate deleteCellAtIndexpath:_indexPath];
}



@end
