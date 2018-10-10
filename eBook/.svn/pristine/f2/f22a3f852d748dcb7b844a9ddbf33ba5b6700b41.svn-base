//
//  MDCollectionView.m
//  MDCollectionView
//
//  Created by joey on 16/11/25.
//  Copyright © 2016年 com.joey. All rights reserved.
//

#define SW [[UIScreen mainScreen]bounds].size.width
#define SH [[UIScreen mainScreen]bounds].size.height
#import "MDCollectionView.h"
#import "MDFlowLayout.h"
#import "MDCollectionCell.h"
#import "YTBookCollectionViewCell.h"
#import "LSYReadPageViewController.h"
#import "AppDelegate.h"
#import "LYBookShelfVCViewController.h"

@interface MDCollectionView()<UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              MDCellDeleteDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) MDFlowLayout *flowLayout;
@property (nonatomic, assign) BOOL isShake;
@property (nonatomic, strong) UIPanGestureRecognizer *MoveGesture;
@property (nonatomic, strong) UILongPressGestureRecognizer *InsertGesture;

@property (nonatomic, assign) CGFloat itemSpace;//item间隙
@end

#define backColor [UIColor color]
static NSString *const cellId = @"cellId";
static NSString *const headerViewId = @"headerViewId";
static CGFloat cellWidth = 82;
static CGFloat cellHeight = 139;

@implementation MDCollectionView
@synthesize dataSource;

- (CGFloat)itemSpace{
    if (!_itemSpace) {
        int rowNum = (int)(SW/self.flowLayout.itemSize.width);
        _itemSpace = (SW - rowNum * self.flowLayout.itemSize.width - self.flowLayout.sectionInset.left - self.flowLayout.sectionInset.right)/rowNum ;
        if (_itemSpace < self.flowLayout.minimumInteritemSpacing) {
            _itemSpace = self.flowLayout.minimumInteritemSpacing;
        }
    }
    return _itemSpace;
}
- (id)initWithFrame:(CGRect)frame DataSource:(NSArray *)data{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        dataSource = [NSMutableArray arrayWithArray:data];
        [self setBackgroundColor:[UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1]];
        [self addObserver:self forKeyPath:@"type" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (UIPanGestureRecognizer *)MoveGesture{
    if (!_MoveGesture) {
        _MoveGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleMethod:)];
    }
    return _MoveGesture;
}

- (UILongPressGestureRecognizer *)InsertGesture{
    if (!_InsertGesture) {
        _InsertGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleMethod:)];
        _InsertGesture.minimumPressDuration = 1.0f;
    }
    return _InsertGesture;
}

- (MDFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[MDFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(cellWidth, cellHeight);
//        _flowLayout.minimumLineSpacing = 20.0f;
//        _flowLayout.minimumInteritemSpacing = 10;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[YTBookCollectionViewCell class] forCellWithReuseIdentifier:cellId];
//        [_collectionView registerClass:[MDCollectionCell class] forCellWithReuseIdentifier:cellId];
    }
    return _collectionView;
}

#pragma mark CollectionView DataSource Override
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YTBookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    YTBookItem *item = dataSource[indexPath.row];
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
    //cell.deleteBtn.hidden = deleteBtnFlag?YES:NO;
    cell.delegate =  self;
    
    return cell;
    
    
//    MDCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
//    cell.deleteDelegate = self;
////    [cell.image setImage:[UIImage imageNamed:dataSource[indexPath.row]]];
//    [cell.image setImage:[[SDImageCache sharedImageCache] imageFromDiskCacheForKey:@""]];
//    return cell;
}

#pragma mark UICollectionView Delegate

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    id obj = [dataSource objectAtIndex:sourceIndexPath.row];
    [dataSource removeObjectAtIndex:sourceIndexPath.row];
    [dataSource insertObject:obj atIndex:destinationIndexPath.row];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    MDCollectionCell *MDcell = (MDCollectionCell *)cell;
//    if (_isShake) {
//        if (self.type == MDDelete) {
//            MDcell.deleteBtn.hidden = NO;
//        }else MDcell.deleteBtn.hidden = YES;
//        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
//        keyAnimation.keyPath = @"transform.rotation";
//        keyAnimation.values = @[@(-0.03),@(0.03)];
//        keyAnimation.repeatCount = MAXFLOAT;
//        keyAnimation.duration = 0.2f;
//        [MDcell.image.layer addAnimation:keyAnimation forKey:@"keyAnimation"];
//    }else if (!_isShake){
//        [MDcell.image.layer removeAllAnimations];
//        MDcell.deleteBtn.hidden = YES;
//    }
}

//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
    
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //如果点击最后一项，就跳转到书城界面
    if (indexPath.row == dataSource.count - 1 ) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(mdClickAddBookBtn)]) {
            [self.delegate mdClickAddBookBtn];
        }
        
    }else{
        
        YTBookItem *bookitem = dataSource[indexPath.row];
        
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

#pragma Move Method

- (void)setMoving{
    [self shake];
    [self.collectionView addGestureRecognizer:self.MoveGesture];
}
- (void)cancelMoving{
    [self cancelShake];
    [self.collectionView removeGestureRecognizer:self.MoveGesture];
}

#pragma mark 手势方法
- (void)handleMethod:(UIPanGestureRecognizer *)sender{
    CGPoint location = [sender locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
//    location.x =
    if (self.type == MDMove) {
        if (indexPath) {
            switch (sender.state) {
                case UIGestureRecognizerStateBegan:
                    [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
                    break;
                case UIGestureRecognizerStateChanged:
                    [self.collectionView updateInteractiveMovementTargetPosition:[sender locationInView:self.collectionView]];
                    break;
                default:
                    break;
            }
        }
        if (sender.state == UIGestureRecognizerStateEnded) {
            [self.collectionView endInteractiveMovement];
        }
    }
 //以女神周慧敏照片做例子插入
    else if (self.type == MDInsert){
        if (!indexPath) {
            indexPath = [self getIndexPathWithPoint:location];
            if (sender.state == UIGestureRecognizerStateBegan) {
                CGRect destinationFrame = [self.collectionView cellForItemAtIndexPath:indexPath].frame;
                if (indexPath.row == dataSource.count) {
                    CGRect lastItemFrame = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:dataSource.count-1 inSection:0]].frame;


                    destinationFrame = CGRectMake(lastItemFrame.origin.x+self.flowLayout.itemSize.width +   self.itemSpace, lastItemFrame.origin.y, self.flowLayout.itemSize.width, self.flowLayout.itemSize.height);
                    if (destinationFrame.origin.x > SW) {
                        destinationFrame.origin.x = self.flowLayout.sectionInset.left;
                        destinationFrame.origin.y += self.flowLayout.minimumLineSpacing + self.flowLayout.itemSize.height;
                    }
                }
                UIImageView *showImage = [[UIImageView alloc]initWithFrame:CGRectMake(SW/2-100, self.collectionView.contentOffset.y+self.collectionView.bounds.size.height/2 - 100, 200, 200)];
                [showImage setImage:[UIImage imageNamed:@"vivian.jpg"]];
                showImage.layer.cornerRadius = 5.0f;
                showImage.layer.masksToBounds = YES;
                [self.collectionView addSubview:showImage];
                [UIView animateWithDuration:1 animations:^{
                    [showImage setFrame:destinationFrame];
                }completion:^(BOOL finished) {
                    [showImage removeFromSuperview];
                    
                    //插入操作
                    [dataSource insertObject:@"vivian.jpg" atIndex:indexPath.row];
                    [self.collectionView performBatchUpdates:^{
                        [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
                    } completion:nil];

                }];
            }
            }
    }
    
}
//获取按压点该插入的IndexPath
- (NSIndexPath *)getIndexPathWithPoint:(CGPoint)point{
    if(![self.collectionView indexPathForItemAtPoint:CGPointMake(point.x+self.flowLayout.itemSize.width, point.y)] && [self.collectionView indexPathForItemAtPoint:CGPointMake(point.x, point.y+self.flowLayout.itemSize.height)]){
        return [self.collectionView indexPathForItemAtPoint:CGPointMake(point.x, point.y+self.flowLayout.itemSize.height)];
    }else if (![self.collectionView indexPathForItemAtPoint:CGPointMake(point.x, point.y+self.flowLayout.itemSize.height)] && [self.collectionView indexPathForItemAtPoint:CGPointMake(point.x+self.flowLayout.itemSize.width, point.y)]){
        return [self.collectionView indexPathForItemAtPoint:CGPointMake(point.x+self.flowLayout.itemSize.width, point.y)];
    }else{
        return [NSIndexPath indexPathForItem:dataSource.count inSection:self.collectionView.numberOfSections - 1];
    }
    return nil;
}
#pragma mark Delete Method
- (void)setDeleting{
    [self shake];
}
- (void)cancelDelting{
    [self cancelShake];
}
- (void)deleteCellAction:(CGPoint)point{
    NSIndexPath *index = [self.collectionView indexPathForItemAtPoint:point];
    [dataSource removeObjectAtIndex:index.row];
    [self.collectionView deleteItemsAtIndexPaths:@[index]];
    [self.collectionView reloadData];
}

#pragma mark Insert Method

- (void)setInserting{
    [self shake];
    [self.collectionView addGestureRecognizer:self.InsertGesture];
}

- (void)cancelInserting{
    [self cancelShake];
    [self.collectionView removeGestureRecognizer:self.InsertGesture];
}

#pragma mark 抖动效果
- (void)shake{
    self.collectionView.allowsSelection = NO;
    _isShake = YES;
    [self.collectionView reloadData];
}
- (void)cancelShake{
    self.collectionView.allowsSelection = YES;
    _isShake = NO;
    [self.collectionView reloadData];
}

#pragma mark Observer delegate
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"type"]) {
        switch (self.type) {
            case MDDelete:[self setDeleting];
                break;
            case MDCancelDelete:[self cancelDelting];
                break;
            case MDMove:[self setMoving];
                break;
            case MDCancelMove:[self cancelMoving];
                break;
            case MDInsert:[self setInserting];
                break;
            case MDCancelInsert:[self cancelInserting];
                break;
            default:
                break;
        }
    }
}
@end
