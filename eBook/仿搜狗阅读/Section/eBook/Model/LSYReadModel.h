//
//  LSYReadModel.h
//  LSYReader
//
//  Created by Labanotation on 16/5/31.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSYMarkModel.h"
#import "LSYNoteModel.h"
#import "LSYChapterModel.h"
#import "LSYRecordModel.h"
#import "YTBookItem.h"
typedef enum{
    BookTypeEpud = 0,
    BookTypeTXT,
    BookTypePDF
} BookType;
@interface LSYReadModel : NSObject<NSCoding>
@property (nonatomic,strong) NSURL *resource;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) NSMutableArray <LSYMarkModel *>*marks;
@property (nonatomic,strong) NSMutableArray <LSYNoteModel *>*notes;
@property (nonatomic,strong) NSMutableArray <LSYChapterModel *>*chapters;//maybe 章节属性的model
@property (nonatomic,strong) LSYRecordModel *record;//记录被读到的章节
@property (nonatomic,assign) BookType bookType;
//@property (nonatomic,assign) NSInteger theFirstPage;
@property (nonatomic,strong) NSString *bookName;//本书名字（文件名字）
@property (nonatomic,strong) NSString *bookExtension;//本书拓展名（本书类型）
-(instancetype)initWithContent:(NSString *)content;
-(instancetype)initWithePub:(NSString *)ePubPath;
+(void)updateLocalModel:(LSYReadModel *)readModel url:(NSURL *)url;

+(id)getLocalModelWithURL:(NSURL *)url;
+(id)getLocalModelWithBookItem:(YTBookItem *)bookItem;
@end
