//
//  ReviewsViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/29.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "ReviewsViewController.h"
#import "ReviewTableViewCell.h"

#import "CreateLabelViewController.h"

#define HEIGHT_ROW 80

@interface ReviewsViewController ()

@end

@implementation ReviewsViewController{
    UITableView *tableReviews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tableReviews = [[UITableView alloc]
                    initWithFrame:self.view.bounds
                    style:UITableViewStyleGrouped];
    tableReviews.delegate = self;
    tableReviews.dataSource = self;
    
    UINib *nibCell = [UINib nibWithNibName:@"ReviewTableViewCell"
                                    bundle:nil];
    [tableReviews registerNib:nibCell
       forCellReuseIdentifier:@"reviewTableViewCell"];
    
    [self.view addSubview:tableReviews];
    
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


#pragma mark - tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //arrLeftItemsに加えて、下書き中のレビューとLABEL買い物アプリへの項目
    return 100;//test
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s, indexpath.row = %d", __func__, (int)indexPath.row);
    
    return HEIGHT_ROW;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"reviewTableViewCell";
    
    ReviewTableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //cellArrow.lblItemName.text = @"マイアイテム";
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CreateLabelViewController *vc = [[CreateLabelViewController alloc]init];
    /*
     *vcを新規入力ではなく、編集モードにする
     */
    [self.navigationController pushViewController:vc animated:YES];
}


//慣性スクロール完了時
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s", __func__);
    
    
}

//自動スクロール完了時にのみコール
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%s", __func__);
    
    
}

//手動スクロール完了時:フリック(decelerate=1)とドラッグ(decelerate=0)時にコール
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    NSLog(@"%s decelerate=%d", __func__, decelerate);
    
    
}

//ドラッグ（フリック）し始めたタイミング
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    NSLog(@"%s : %f, %f", __func__, translation.x, translation.y);
    //    if(translation.x > 0)
    //    {
    //        // react to dragging right
    //    } else
    //    {
    //        // react to dragging left
    //    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}


@end
