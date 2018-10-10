//
//  LSYReadModel.m
//  LSYReader
//
//  Created by Labanotation on 16/5/31.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import "LSYReadModel.h"


@implementation LSYReadModel
-(instancetype)initWithContent:(NSString *)content
{
    self = [super init];
    if (self) {
        _content = content;
        NSMutableArray *charpter = [NSMutableArray array];
        [LSYReadUtilites separateChapter:&charpter content:content];
        _chapters = charpter;
        _notes = [NSMutableArray array];
        _marks = [NSMutableArray array];
        _record = [[LSYRecordModel alloc] init];
        _record.chapterModel = charpter.firstObject;
        _record.chapterCount = _chapters.count;
    }
    return self;
}
-(instancetype)initWithePub:(NSString *)ePubPath;
{
    self = [super init];
    if (self) {
        _bookType = BookTypeEpud;
        _chapters = [LSYReadUtilites ePubFileHandle:ePubPath];;
        _notes = [NSMutableArray array];
        _marks = [NSMutableArray array];
        _record = [[LSYRecordModel alloc] init];
        _record.chapterModel = _chapters.firstObject;
        _record.chapterCount = _chapters.count;
    }
    return self;
}

-(instancetype)initWitheBookItem:(YTBookItem *)bookItem;
{
    self = [super init];
    if (self) {

        _chapters = [LSYReadUtilites pdfFileHandle:bookItem.fileURL];
        _record = [[LSYRecordModel alloc] init];
        _record.chapterModel = _chapters.firstObject;
        _record.chapterCount = _chapters.count;
        _record.page = 1;//默认PDF默认起始章节为1
        _record.theFirstPage = 1;//PDF默认起始页为1
        //pdf
        _bookType = BookTypePDF;
        _bookName = bookItem.name;
        _bookExtension = bookItem.fileExtension;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.marks forKey:@"marks"];
    [aCoder encodeObject:self.notes forKey:@"notes"];
    [aCoder encodeObject:self.chapters forKey:@"chapters"];
    [aCoder encodeObject:self.record forKey:@"record"];
    [aCoder encodeObject:self.resource forKey:@"resource"];
    //pdf
    [aCoder encodeObject:@(self.bookType) forKey:@"bookType"];
    [aCoder encodeObject:self.bookName forKey:@"bookName"];
    [aCoder encodeObject:self.bookExtension forKey:@"bookExtension"];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.marks = [aDecoder decodeObjectForKey:@"marks"];
        self.notes = [aDecoder decodeObjectForKey:@"notes"];
        self.chapters = [aDecoder decodeObjectForKey:@"chapters"];
        self.record = [aDecoder decodeObjectForKey:@"record"];
        self.resource = [aDecoder decodeObjectForKey:@"resource"];
        //pdf
        self.bookType = (BookType)[[aDecoder decodeObjectForKey:@"bookType"] integerValue];
        self.bookName = [aDecoder decodeObjectForKey:@"bookName"];
        self.bookExtension = [aDecoder decodeObjectForKey:@"bookExtension"];
    }
    return self;
}
+(void)updateLocalModel:(LSYReadModel *)readModel url:(NSURL *)url
{
    //缓存
    NSString *key = [url.path lastPathComponent];
    NSMutableData *data=[[NSMutableData alloc]init];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:readModel forKey:key];
    [archiver finishEncoding];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
}
//+(id)getLocalModelWithURL:(NSURL *)url
//{
//    
//    // 关键是 LSYReadModel 是怎么使用的
//    NSString *key = [url.path lastPathComponent];
//    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    if (!data) {//无缓存
//        if ([[key pathExtension] isEqualToString:@"txt"]) {
//            LSYReadModel *model = [[LSYReadModel alloc] initWithContent:[LSYReadUtilites encodeWithURL:url]];
//            model.resource = url;
//            [LSYReadModel updateLocalModel:model url:url];
//            return model;
//        }
//        else if ([[key pathExtension] isEqualToString:@"epub"]){
//            NSLog(@"this is epub");
//            LSYReadModel *model = [[LSYReadModel alloc] initWithePub:url.path];
//            model.resource = url;
//            [LSYReadModel updateLocalModel:model url:url];
//            return model;
//        }
//        else if([[key pathExtension] isEqualToString:@"pdf"]){//这里需要实现pdf的解析--> 总章节、总页码
//            NSLog(@"this is pdf");
//            LSYReadModel *model = [[LSYReadModel alloc] initWitheBookItem:url];
//            model.resource = url;
//            [LSYReadModel updateLocalModel:model url:url];
//            return model;
//            
//            
//        }
//        else{
//            @throw [NSException exceptionWithName:@"FileException" reason:@"文件格式错误" userInfo:nil];
//        }
//        
//    }
//    NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
//    LSYReadModel *model = [unarchive decodeObjectForKey:key];
//    return model;
//}
+(id)getLocalModelWithBookItem:(YTBookItem *)bookItem
{
    NSURL *url = bookItem.fileURL;
    // 关键是 LSYReadModel 是怎么使用的
    NSString *key = [url.path lastPathComponent];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    NSData *data;
    if (!data)
    {//无缓存
        if ([[key pathExtension] isEqualToString:@"txt"]) {
            LSYReadModel *model = [[LSYReadModel alloc] initWithContent:[LSYReadUtilites encodeWithURL:url]];
            model.resource = url;
            [LSYReadModel updateLocalModel:model url:url];
            return model;
        }
        else if ([[key pathExtension] isEqualToString:@"epub"]){
            NSLog(@"this is epub");
            LSYReadModel *model = [[LSYReadModel alloc] initWithePub:url.path];
            model.resource = url;
            [LSYReadModel updateLocalModel:model url:url];
            return model;
        }
        else if([[key pathExtension] isEqualToString:@"pdf"]){//这里需要实现pdf的解析--> 总章节、总页码
            NSLog(@"this is pdf");
            LSYReadModel *model = [[LSYReadModel alloc] initWitheBookItem:bookItem];
            model.resource = url;
            [LSYReadModel updateLocalModel:model url:url];
            return model;
            
        }
        else{
            @throw [NSException exceptionWithName:@"FileException" reason:@"文件格式错误" userInfo:nil];
        }
        
    }
    NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    LSYReadModel *model = [unarchive decodeObjectForKey:key];
    return model;

}

@end
