//
//  TestTableViewController.m
//  YYInfiniteLoopView-demo
//
//  Created by Arvin on 16/9/2.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "TestTableViewController.h"
#import "YYInfiniteLoopView.h"

#define width self.view.frame.size.width
#define height self.view.frame.size.height

@interface TestTableViewController ()
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loopView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loopView {
    YYInfiniteLoopView *loopView = [YYInfiniteLoopView
                                    infiniteLoopViewWithImageUrls:self.imageUrls
                                    titles:self.titles
                                    didSelectedImage:^(NSInteger index) {
                                        NSLog(@"%zd",index);
                                    }];
    loopView.frame = CGRectMake(0, 0, width, height*0.3);
    self.tableView.tableHeaderView = loopView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSArray *)imageUrls {
    if (!_imageUrls) {
        _imageUrls = @[@"http://img2.91.com/uploads/allimg/150106/59-1501061H225-53.jpg",
                       @"http://img1.91.com/uploads/allimg/150106/59-1501061GR6-51.jpg",
                       @"http://img2.91.com/uploads/allimg/150319/59-1503191P412-50.jpg",
                       @"http://img3.91.com/uploads/allimg/150304/59-1503041S553-50.jpg",
                       @"http://img1.91.com/uploads/allimg/150304/59-1503041SS0.jpg"];
    }
    return _imageUrls;
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

@end
