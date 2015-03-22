//
//  CreateLabelViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/21.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "CreateLabelViewController.h"
#import "CreateLabelTopTableViewCell.h"

#define HEIGHT_HEADER1 64

@interface CreateLabelViewController ()

typedef enum : NSInteger{
    CreateSection0CellTypeTop = 0,
    CreateSection0CellTypeExplain,
    CreateSection0CellTypeFinal
} CreateSection0CellType;

typedef enum : NSInteger{
    CreateSection1CellTypeTitle = 0,
    CreateSection1CellTypeMain,
    CreateSection1CellTypeAddLink,
    CreateSection1CellTypeReserve,
    CreateSection1CellTypeConfirm,
    CreateSection1CellTypeFinal
} CreateSection1CellType;

@end

@implementation CreateLabelViewController{
    
    UITableView *tableCreate;
    
    UILabel *labelExplain;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    tableCreate = [[UITableView alloc]initWithFrame:self.view.bounds
                                            style:UITableViewStylePlain];
    
    tableCreate.delegate = self;
    tableCreate.dataSource = self;
    [self.view addSubview:tableCreate];
    
    UINib *nibTop = [UINib
                     nibWithNibName:@"CreateLabelTopTableViewCell"
                     bundle:nil];
    [tableCreate registerNib:nibTop
    forCellReuseIdentifier:@"createLabelTopTableViewCell"];
    
    
    
    int marginSideInLabel = 30;
    //MMDrawerの特性として右側が少し表示されないのでその分(以下)を考慮したマージンにする必要がある
    
    labelExplain =
    [[UILabel alloc]initWithFrame:
     CGRectMake(marginSideInLabel, 0,
                self.view.bounds.size.width-marginSideInLabel*2,30)];
    labelExplain.text = @"テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト";
    labelExplain.font = [UIFont systemFontOfSize:15.f];
    labelExplain.numberOfLines = 0;
    labelExplain.textColor = [UIColor lightGrayColor];
    labelExplain.textAlignment = NSTextAlignmentCenter;
    [labelExplain sizeToFit];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [tableCreate reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
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


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 2;
    }else if(section == 1){
        return 5;
    }
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return .1f;
    }else if(section == 1){
        return HEIGHT_HEADER1;
    }
    
    return .1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return nil;
    }else if(section == 1){
        UIView *viewHeader =
        [[UIView alloc]initWithFrame:
         CGRectMake(0, 0, self.view.bounds.size.width,
                    HEIGHT_HEADER1)];
        
        viewHeader.backgroundColor =
        [UIColor colorWithRed:30.f/255.f
                        green:30.f/255.f
                         blue:30.f/255.f
                        alpha:1.f];
        
        UILabel *labelHeader =
        [[UILabel alloc]
         initWithFrame:viewHeader.bounds];
        labelHeader.text = @"レビュー作成";
        labelHeader.textColor = [UIColor whiteColor];
//        labelHeader.font =
//        [UIFont fonthiraka]
        
        return viewHeader;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        switch ((CreateSection0CellType)indexPath.row) {
            case CreateSection0CellTypeTop:{
                return 350;
                break;
            }
            case CreateSection0CellTypeExplain:{
                //ラベルの大きさよりも少しだけ余裕を持って表示する
                return labelExplain.bounds.size.height + 50;
                break;
            }
            default:{
                return 0;
                break;
            }
        }
    }else{
        return 50;
    }
    
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView
       cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        switch((CreateSection0CellType)indexPath.row ){
            case CreateSection0CellTypeTop:{
                static NSString *CellIdentifierTop =
                @"createLabelTopTableViewCell";
                
                
                CreateLabelTopTableViewCell *cellTop =
                [tableView dequeueReusableCellWithIdentifier:CellIdentifierTop];
                
                cellTop.imvTop.image =
                [UIImage imageNamed:
                 @"a20.jpg"];
                
                cellTop.selectionStyle =
                UITableViewCellSelectionStyleNone;
                
                
                return cellTop;
                
                break;
            }
            case CreateSection0CellTypeExplain:{
                
                static NSString *CellIdentifier = nil;
                if(CellIdentifier == nil)
                    CellIdentifier =
                    [NSString stringWithFormat:@"cell%d", (int)indexPath.row];//unique
                UITableViewCell *cell =
                [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                
                //
                if (cell == nil) {
                    cell = [[UITableViewCell alloc]
                            initWithStyle:UITableViewCellStyleDefault
                            reuseIdentifier:CellIdentifier];
                }
                
                for(UIView *view in cell.subviews){
                    NSLog(@"view = %@", view);//UITableViewCellScrollView
                    for(UIView *subview in view.subviews){
                        NSLog(@"subview = %@", subview);//UITableViewCellContentView
                        for(UIView *subview2 in subview.subviews){
                            NSLog(@"cell");//view
                            [subview2 removeFromSuperview];
                        }
                        [subview removeFromSuperview];
                    }
                }
                
                [cell.contentView addSubview:labelExplain];
                
                return cell;
                
                
                break;
            }
                
            default:{
                return nil;
                break;
            }
        }
    }else if(indexPath.section == 1){
        
    }
    
    static NSString *CellIdentifier = nil;
    if(CellIdentifier == nil)
        CellIdentifier =
        [NSString stringWithFormat:@"cell%d", (int)indexPath.row];//unique
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    for(UIView *view in cell.subviews){
        NSLog(@"view = %@", view);//UITableViewCellScrollView
        for(UIView *subview in view.subviews){
            NSLog(@"subview = %@", subview);//UITableViewCellContentView
            for(UIView *subview2 in subview.subviews){
                NSLog(@"cell");//view
                [subview2 removeFromSuperview];
            }
            [subview removeFromSuperview];
        }
    }
    
    //[cell.contentView addSubview:labelExplain];
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
