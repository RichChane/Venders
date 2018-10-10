//
//  LYBookShelfVCViewController.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/9.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYBookShelfVCViewController.h"
#import "LYBookShelfMainView.h"
#import "MDCollectionView.h"
#import "SDCycleScrollView.h"
#import "BookShelfHeaderView.h"

@interface LYBookShelfVCViewController ()<MDCollectionViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong) LYBookShelfMainView *mainView;
@property (nonatomic,strong) MDCollectionView *collectionView;
@property (nonatomic,strong) BookShelfHeaderView *adBookShelfHeaderView;

@end


static const CGFloat adViewHeight = 220;

@implementation LYBookShelfVCViewController
{
    NSMutableArray *booksArr;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //data
    [self fetchBooksArr];
    
    //[self createMainView];
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.adBookShelfHeaderView];
    
    //data
    [self setAdData:@[
                      @"http://zswpfile.682.com/upload/2017/01/13/14/afdfe620f7a1cd377be242d533e36e97.jpg?750X350",
                      @"http://zswpfile.682.com/upload/2017/01/13/14/bf13458ecc5e4721ff778f6e9ed58e62.jpg?750X350",
                      @"https://dn-ifangchou.qbox.me/upimages/ueditor/jsp/upload/image/20151210/1449758477596066876.png"
                           ]];
    
    
}

#pragma mark - views

- (UIView*)adBookShelfHeaderView
{
    if (!_adBookShelfHeaderView) {
        
        _adBookShelfHeaderView = [[BookShelfHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adViewHeight )];
        _adBookShelfHeaderView.backgroundColor = CUSTOM_LIGHT_GRAY_2;
        
    }
    
    return _adBookShelfHeaderView;
}

- (MDCollectionView *)collectionView{
    if (!_collectionView) {
        
        CGRect frame = CGRectMake(0, adViewHeight, SCREEN_WIDTH, self.view.height - adViewHeight - statusHeight - navgatHeight - tabBarHeight);
        _collectionView = [[MDCollectionView alloc]initWithFrame:frame DataSource:booksArr];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
    }
    return _collectionView;
}

//- (void)createMainView
//{
//    _mainView = [[LYBookShelfMainView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:_mainView];
//    
//}

#pragma mark - set data

- (void)fetchBooksArr
{
    booksArr = [YTBookItem readDatabase];
    
    //PDF
    NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
    for (NSString *pdfFile in pdfs) {
        YTBookItem *itm = [[YTBookItem alloc]initWithBookPath:pdfFile];
        [booksArr addObject:itm];
        NSLog(@"%@",pdfFile);
    }
    //Epud
    NSArray *epubs = [[NSBundle mainBundle] pathsForResourcesOfType:@"epub" inDirectory:nil];
    for (NSString *epudFile in epubs) {
        YTBookItem *itm = [[YTBookItem alloc]initWithBookPath:epudFile];
        [booksArr addObject:itm];
        NSLog(@"%@",epudFile);
    }
    
    //添加最后一项，是一个带加号的图片
    YTBookItem *itm2 = [[YTBookItem alloc]init];
    itm2.imageKey = @"addbtnInshelf";
    [booksArr addObject:itm2];
    

    
    [_mainView setBooksArr:booksArr];
    
}

- (void)setAdData:(NSArray*)adImages
{
    _adBookShelfHeaderView.adImages = adImages;
}

#pragma mark - MDCollectionViewDelegate

- (void)mdClickAddBookBtn
{
    self.tabBarController.selectedIndex = 0;//跳转到书城
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
