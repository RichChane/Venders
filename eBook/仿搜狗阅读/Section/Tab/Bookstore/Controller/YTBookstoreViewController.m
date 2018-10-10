//
//  YTBookstoreViewController.m
//  仿搜狗阅读
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 YinTokey. All rights reserved.
//

#import "YTBookstoreViewController.h"
#import "YTSearchViewController.h"
#import "AppDelegate.h"
#import "SDCycleScrollView.h"
#import "YGBookStoreMainView.h"
#import "LYBookShelfRequest.h"
#import "LYTestDownLoadRequest.h"
#import "LYBookStoreRequest.h"
#import "LYBookStoreRequestPost.h"
#import "BookStoreRequest.h"

@interface YTBookstoreViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *failImgView;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UILabel *failLabel;
- (IBAction)refreshBtnClick:(id)sender;
- (IBAction)searchBtnClick:(id)sender;
- (IBAction)iconBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *bookstoreWebView;
@property (weak, nonatomic) IBOutlet SDCycleScrollView *adScrollView;
@property (strong, nonatomic) IBOutlet YGBookStoreMainView *mainView;



@end

@implementation YTBookstoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.failImgView.hidden = YES;
    self.failLabel.hidden = YES;
    self.refreshBtn.hidden = YES;
    
    //webview
//    self.bookstoreWebView.delegate = self;
//    self.bookstoreWebView.scrollView.bounces = NO;
//    self.bookstoreWebView.backgroundColor = [UIColor whiteColor];
//    [self bookStoreWebViewRequest];
  
    
    [self createMainScrollView];
    
    [self requestBookStoreInfo];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setAdData];
    
}

- (void)requestBookStoreInfo
{
    NSInteger type = 1;
//    LYBookStoreRequest *request = [[LYBookStoreRequest alloc]initWithRequestType:type];
//    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
//        // 你可以直接在这里使用 self
//        NSLog(@"succeed");
//        
//        
//        
//    } failure:^(__kindof YTKBaseRequest *request) {
//        // 你可以直接在这里使用 self
//        NSLog(@"failed");
//        
//    }];

    
    {
        BookStoreRequest *request = [[BookStoreRequest alloc]init];
        
        [request getInfoForHomePageWithParam:nil withSuccess:^(ResponseObject *object) {
            
            
        } failure:^(NSError *error) {
            
            
        }];
        
    }
    
    {//原框架方式请求书城
        
        BookStoreRequest *request = [[BookStoreRequest alloc]init];
        
        [request getBookStoreInfoWithParam:nil withSuccess:^(ResponseObject *object) {
            
            
        } failure:^(NSError *error) {
            
            
        }];
        
    }
    
    
    {//YTK的方式请求书城
        LYBookStoreRequestPost *request = [[LYBookStoreRequestPost alloc]initWithRequestType:type];
        [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            // 你可以直接在这里使用 self
            NSLog(@"succeed");
            
            
            
        } failure:^(__kindof YTKBaseRequest *request) {
            // 你可以直接在这里使用 self
            NSLog(@"failed");
            
        }];
    }

    
    
}


- (void)request
{
    NSString *username = @"RichChane";
    NSString *password = @"crc6814337";
    LYBookShelfRequest *request = [[LYBookShelfRequest alloc]initWithUsername:username password:password];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        // 你可以直接在这里使用 self
        NSLog(@"succeed");
        //进度条 后期实现
       
        
    } failure:^(__kindof YTKBaseRequest *request) {
        // 你可以直接在这里使用 self
        NSLog(@"failed");
        
    }];
    
}

- (void)testFileDownLoad
{
    NSString *eBookId = @"1";
    LYTestDownLoadRequest *request = [[LYTestDownLoadRequest alloc]initWithEBookId:eBookId];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        // 你可以直接在这里使用 self
        NSLog(@"succeed");
        
    } failure:^(__kindof YTKBaseRequest *request) {
        // 你可以直接在这里使用 self
        NSLog(@"failed");
        
    }];
    

    
}


- (void)createMainScrollView
{
    //mainview 需要处理tabbar高度
    CGFloat tabHeight = self.tabBarController.tabBar.height;
    CGFloat navHeight = self.navigationController.navigationBar.height;
    CGFloat staHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    _mainView = [[YGBookStoreMainView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - tabHeight - navHeight - staHeight)];
    [self.view addSubview:_mainView];
    
}

#pragma mark - set data

- (void)setAdData
{
    [_mainView setAdData:@[
      @"http://zswpfile.682.com/upload/2017/01/13/14/afdfe620f7a1cd377be242d533e36e97.jpg?750X350",
      @"http://zswpfile.682.com/upload/2017/01/13/14/bf13458ecc5e4721ff778f6e9ed58e62.jpg?750X350",
      @"https://dn-ifangchou.qbox.me/upimages/ueditor/jsp/upload/image/20151210/1449758477596066876.png"
      ]];
    
}

- (void)bookStoreWebViewRequest{
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://k.sogou.com/abs/ios/v3/girl?gender=1"]];
    [self.bookstoreWebView loadRequest:request];
}

- (IBAction)refreshBtnClick:(id)sender {
    [self bookStoreWebViewRequest];
}

- (IBAction)searchBtnClick:(id)sender {
    [YTNavAnimation NavPushAnimation:self.navigationController.view];
    YTSearchViewController *searchVC = [[self storyboard]instantiateViewControllerWithIdentifier:@"searchVC"];
    
    [[self navigationController]pushViewController:searchVC animated:NO];

}

- (IBAction)iconBtnClick:(id)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
    NSLog(@"open left");
    
}



#pragma mark - webview delegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [LBProgressHUD showHUDto:self.view animated:NO];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.failImgView.hidden = YES;
    self.failLabel.hidden = YES;
    self.refreshBtn.hidden = YES;
    [LBProgressHUD hideAllHUDsForView:self.view animated:NO];

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [LBProgressHUD hideAllHUDsForView:self.view animated:NO];
    self.failImgView.hidden = NO;
    self.failLabel.hidden = NO;
    self.refreshBtn.hidden = NO;
}
@end
