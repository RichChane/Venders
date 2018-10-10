//
//  LYBookShelfMainView.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/9.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "LYBookShelfMainView.h"
#import "BookShelfHeaderView.h"
#import "BookShelfCollectinView.h"
#import "YTBookCollectionViewCell.h"
#import "AppDelegate.h"
#import "LSYReadPageViewController.h"

@interface LYBookShelfMainView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) BookShelfCollectinView *collectionView;
@property (nonatomic,strong) BookShelfHeaderView *headerView;




@end

static NSString * const reuseIdentifier = @"Cell";
static NSString * const HeaderIdentifier = @"HeaderIdentifier";

@implementation LYBookShelfMainView
{
    BOOL deleteBtnFlag;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = [UIColor redColor];
        
        
        
//        [self createCollectinView];
//        [self createHeaderView];
        
    }
    return self;
}

- (void)createCollectinView
{
    // 设置流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // UICollectionViewFlowLayout流水布局的内部成员属性有以下：
    /**
     @property (nonatomic) CGFloat minimumLineSpacing;
     @property (nonatomic) CGFloat minimumInteritemSpacing;
     @property (nonatomic) CGSize itemSize;
     @property (nonatomic) CGSize estimatedItemSize NS_AVAILABLE_IOS(8_0); // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
     @property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
     @property (nonatomic) CGSize headerReferenceSize;
     @property (nonatomic) CGSize footerReferenceSize;
     @property (nonatomic) UIEdgeInsets sectionInset;
     */
    // 定义大小
    layout.itemSize = CGSizeMake(100, 100);
    // 设置最小行间距
    layout.minimumLineSpacing = 2;
    // 设置垂直间距
    layout.minimumInteritemSpacing = 2;
    // 设置滚动方向（默认垂直滚动）
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[BookShelfCollectinView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    
    [_collectionView registerClass:[YTBookCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [_collectionView registerClass:[BookShelfHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderIdentifier];
    
}

- (void)createHeaderView
{
    
    
}

- (void)setBooksArr:(NSMutableArray *)booksArr
{
    _booksArr = booksArr;
    [_collectionView reloadData];
}

//这个方法是返回 Header的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(SCREEN_WIDTH, 200);
}
//这个也是最重要的方法 获取Header的 方法。
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    
//    BookShelfHeaderView *headReusableView;
//    //此处是headerView
//    if (kind == UICollectionElementKindSectionHeader) {
//        headReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderIdentifier forIndexPath:indexPath];
//
//    }
//    return headReusableView;
//}

#pragma mark <UICollectionViewDataSource>

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(13,8,10,8);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return _booksArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YTBookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    YTBookItem *item = _booksArr[indexPath.row];
    cell.imageView.image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:item.imageKey];
    cell.bookNameView.text = item.name;
    //如果小说没有封面，就使用默认图
    if (cell.imageView.image == nil) {
        cell.imageView.image = [UIImage imageNamed:@"default_cover_blue"];
    }
    //如果是最后一项，则显示加号图
    if ([item.imageKey isEqualToString:@"addbtnInshelf"]) {
        cell.imageView.image = [UIImage imageNamed:@"addbtnInshelf"];
        
    }
    
    cell.indexPath = indexPath;
    cell.deleteBtn.hidden = deleteBtnFlag?YES:NO;
    cell.delegate =  self;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //如果点击最后一项，就跳转到书城界面
    if (indexPath.row == _booksArr.count -1 ) {
        
        UIWindow *window = appDelegate.window;
        window.rootViewController.tabBarController.selectedIndex = 1;
        
    }else{
        
        YTBookItem *bookitem = _booksArr[indexPath.row];
        
        //pdf
        
        //新版阅读器
        LSYReadPageViewController *pageCtr = [[LSYReadPageViewController alloc] init];
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:bookitem.name withExtension:bookitem.fileExtension];
        pageCtr.resourceURL = fileURL;    //文件位置
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            pageCtr.model = [LSYReadModel getLocalModelWithBookItem:bookitem];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [appDelegate.window.rootViewController presentViewController:pageCtr animated:YES completion:nil];
            });
        });

    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
