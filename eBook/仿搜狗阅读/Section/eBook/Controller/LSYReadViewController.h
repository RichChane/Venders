//
//  LSYReadViewController.h
//  LSYReader
//
//  Created by Labanotation on 16/5/30.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSYRecordModel.h"
#import "LSYReadView.h"
#import "ReaderContentView.h"


@class LSYReadViewController;
@protocol LSYReadViewControllerDelegate <NSObject>
-(void)readViewEditeding:(LSYReadViewController *)readView;
-(void)readViewEndEdit:(LSYReadViewController *)readView;
- (void)menuViewFontSize:(id)objc;//为了兼容epub字体缩放的手势
@end


typedef NS_ENUM (NSInteger, DocumentType)
{
    Epud = 1,
    PDF = 2,
    Other = 3,
    
};

@interface LSYReadViewController : UIViewController
@property (nonatomic,strong) NSString *content; //显示的内容
@property (nonatomic,strong) LSYRecordModel *recordModel;   //阅读进度
@property (nonatomic,assign) NSUInteger currentPage;
@property (nonatomic,strong) LSYReadView *readView;
@property (nonatomic,strong) ReaderContentView *pdfReadView;
@property (nonatomic,weak) id<LSYReadViewControllerDelegate>delegate;
@property (nonatomic,assign) DocumentType documentType;
//pdf 时需要 书名
@property (nonatomic,strong) NSString *bookName;
@property (nonatomic,assign) BookType bookType;

@end
