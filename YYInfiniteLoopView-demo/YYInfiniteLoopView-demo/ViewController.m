//
//  ViewController.m
//  YYInfiniteLoopView-demo
//
//  Created by Arvin on 16/9/2.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "ViewController.h"
#import "YYConfigured.h"
#import "YYInfiniteLoopView.h"
#import "TestTableViewController.h"

#define width self.view.frame.size.width
#define height self.view.frame.size.height

@interface ViewController ()<YYInfiniteLoopViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *imgUrls;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    // Do any additional setup after loading the view, typically from a nib.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self.view addSubview:self.scrollView];
    [self loopViewDelegate];
    [self loopViewBlock];
    [self loopViewTest];
}

- (void)loopViewDelegate {
    // 类方法
    YYInfiniteLoopView *loopView = [YYInfiniteLoopView
                                    infiniteLoopViewWithImageUrls:self.imgUrls
                                    titles:self.titles
                                    didSelectedImage:^(NSInteger index) {
                                        NSLog(@"%zd",index);
                                    }];
    // 设置代理
    loopView.delegate = self;
    // 设置frame
    loopView.frame = CGRectMake(0, 0, width, height*0.25);
    [self.scrollView addSubview:loopView];
}

- (void)loopViewBlock {
    // 实例方法
    YYInfiniteLoopView *loopView = [[YYInfiniteLoopView alloc]
                                    initWithImageUrls:self.imgUrls
                                    titles:self.titles
                                    didSelectedImage:^(NSInteger index) {
                                        [self didSelectedImageWithIndex:index];
                                    }];
    // 是否隐藏蒙版
    loopView.hideCover = NO;
    
    // 是否自动轮播
    loopView.autoPlayer = NO;
    
    // 设置轮播时间
    // loopView.timeInterval = 1.5f;
    
    // 是否隐藏标题, 如果标题数组为nil, 请手动设置隐藏, 默认为NO
    loopView.hideTitleLabel = YES;
    
    // 标题文字的颜色
    // loopView.titleTextColor = [UIColor blueColor];
    
    // 标题文字的尺寸
    // loopView.titleTextFont = [UIFont systemFontOfSize:16];
    
    // 设置标题的背景颜色
    // loopView.bgViewColor = RGBAColor(23, 138, 230, 0.4);
    
    // 以下两个设置pageControl的圆点颜色
    // loopView.pageIndicatorColor = [UIColor yellowColor];
    // loopView.currentPageIndicatorColor = [UIColor magentaColor];
    
    // 以下两个设置pageControl的图片, 用于替代默认的圆点
    loopView.pageImage = [UIImage imageNamed:@"PageControlImage"];
    loopView.currentPageImage = [UIImage imageNamed:@"CurrentPageControlImage"];
    
    // 设置轮播时的占位图, 用于网络状态不好未能及时请求到网络图片时展示
    // loopView.placeholderImage = [UIImage imageNamed:@"PlaceholderImage"];
    
    // 枚举, 设置标题的展示位置, 不设置时默认在底部
    // loopView.titlePosition = InfiniteLoopViewTitlePositionTop;
    
    // 枚举, 设置pageControl的位置, 只有设置标题在顶部时此设置才有效, 默认居中
    // loopView.pagePosition = InfiniteLoopViewPagePositionCenter;
    
    // 设置frame
    loopView.frame = CGRectMake(0, height*0.25+10, width, height*0.25);
    
    [self.scrollView addSubview:loopView];
}

- (void)loopViewTest {
    YYInfiniteLoopView *loopView = [[YYInfiniteLoopView alloc]
                                    initWithImageUrls:self.imgUrls
                                    titles:self.titles
                                    didSelectedImage:^(NSInteger index) {
                                        [self didSelectedImageWithIndex:index];
                                    }];
    loopView.timeInterval = 1.0f;
    loopView.bgViewColor = [UIColor clearColor];
    loopView.titleTextColor = [UIColor yellowColor];
    loopView.titleTextFont = [UIFont systemFontOfSize:18];
    loopView.pageIndicatorColor = [UIColor redColor];
    loopView.currentPageIndicatorColor = [UIColor blueColor];
    loopView.titlePosition = InfiniteLoopViewTitlePositionTop;
    loopView.pagePosition = InfiniteLoopViewPagePositionLeft;
    loopView.frame = CGRectMake(0, height*0.5+20, width, height*0.25);
    [self.scrollView addSubview:loopView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - YYInfiniteLoopViewDelegate
- (void)infiniteLoopView:(YYInfiniteLoopView *)infiniteLoopView
        didSelectedImage:(NSInteger)selectedImageIndex {
    [self didSelectedImageWithIndex:selectedImageIndex];
}


#pragma mark -
- (void)didSelectedImageWithIndex:(NSInteger)index {
    TestTableViewController *testVC = [[TestTableViewController alloc] init];
    UIColor *bgColor = nil;
    switch (index) {
        case 0:
            testVC.title = @"第一张图";
            bgColor = [UIColor redColor];
            break;
        case 1:
            testVC.title = @"第二张图";
            bgColor = [UIColor brownColor];
            break;
        case 2:
            testVC.title = @"第三张图";
            bgColor = [UIColor greenColor];
            break;
        case 3:
            testVC.title = @"第四张图";
            bgColor = [UIColor orangeColor];
            break;
        default:
            testVC.title = @"第五张图";
            bgColor = [UIColor whiteColor];
            break;
    }
    testVC.view.backgroundColor = bgColor;
    [self.navigationController pushViewController:testVC animated:YES];
}


- (NSArray *)imgUrls {
    if (!_imgUrls) {
        _imgUrls = @[@"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/06/0F/ChMkJ1eB42-IXICZAC-b2z1kN5IAATZEAGIpKQAL5vz687.jpg",
                       @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/0F/0A/ChMkJ1eZ8OOITLc2AAQWEZjZFAgAAT71gKtNRQABBYp187.jpg",
                       @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/06/0F/ChMkJleB422IXV93ACmx9ykNKG8AATZEAFaBoMAKbIP392.jpg",
                       @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/00/04/ChMkJ1ebRfuIfC-3AAQNjkmPpFYAAT-PwLA1wYABA2m812.jpg",
                       @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/0F/01/ChMkJleYmTCID1AzAAau5xfqy0UAAT5igN01VIABq7_951.jpg"];
    }
    return _imgUrls;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"第一张图, ( ⊙ o ⊙ )啊！O(∩_∩)O哈哈~",
                    @"第二张图, ( ⊙ o ⊙ )啊！O(∩_∩)O哈哈~",
                    @"第三张图, ( ⊙ o ⊙ )啊！O(∩_∩)O哈哈~",
                    @"第四张图, ( ⊙ o ⊙ )啊！O(∩_∩)O哈哈~",
                    @"第五张图, ( ⊙ o ⊙ )啊！O(∩_∩)O哈哈~"];
    }
    return _titles;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = self.view.bounds;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.contentSize = CGSizeMake(width, height+100);
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
