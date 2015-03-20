//
//  RightViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/19.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "RightViewController.h"
#import "RightIconTableViewCell.h"


@interface RightViewController ()

typedef enum : NSInteger{
    CellTypeIcon= 0,
    CellTypeExplain,
    CellTypeProfileConfig,
    CellTypeLogout,
    CellTypeFinal
} CellType;



@end

@implementation RightViewController{
    
    UITableView *menuRightTableview;
    UILabel *labelExplain;
    int heightRowIcon;
    int heightRowExplain;
    int heightRowProfileConfig;
    int heightRowLogout;
}
-(id)init{
    self = [super init];
    if(self){
        [self setRestorationIdentifier:@"MMExampleRightSideDrawerController"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    labelExplain = [[UILabel alloc]initWithFrame:
                    CGRectMake(0, 0, self.view.bounds.size.width,30)];
    labelExplain.text = @"テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト";
    labelExplain.font = [UIFont systemFontOfSize:17.f];
    labelExplain.numberOfLines = 0;
    [labelExplain sizeToFit];
    heightRowIcon = 200;
    heightRowExplain = labelExplain.bounds.size.height;
    heightRowProfileConfig = 60;
    heightRowLogout = 60;
    
    NSLog(@"heightRowExplain = %d", heightRowExplain);
    
    menuRightTableview =
    [[UITableView alloc]
     initWithFrame:
     CGRectMake(0, 64, self.view.bounds.size.width,
                self.view.bounds.size.height-64)
     style:UITableViewStylePlain];
    menuRightTableview.delegate = self;
    menuRightTableview.dataSource = self;
    
    //tableViewにcellを登録する
    UINib *nib = [UINib nibWithNibName:@"RightIconTableViewCell" bundle:nil];
    [menuRightTableview registerNib:nib forCellReuseIdentifier:@"rightIconTableViewCell"];
    
    
    [self.view addSubview:menuRightTableview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super  viewWillAppear:animated];
    
    [menuRightTableview reloadData];
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
    NSLog(@"%s", __func__);
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%s", __func__);
    //arrLeftItemsに加えて、下書き中のレビューとLABEL買い物アプリへの項目
    return 4;//アイコン、説明文、マイプロフィール設定リンク、ログアウト
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    NSLog(@"%s", __func__);
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSLog(@"%s", __func__);
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    switch ((CellType)indexPath.row) {
        case CellTypeIcon:{
            return heightRowIcon;
            break;
        }
        case CellTypeExplain:{
            return heightRowExplain;
            break;
        }
        case CellTypeProfileConfig:{
            return heightRowProfileConfig;
            break;
        }
        case CellTypeLogout:{
            return heightRowLogout;
            break;
        }
        case CellTypeFinal:{
            return 0;
            break;
        }
        default:
            break;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s, indexpath = %@", __func__, indexPath);
    
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
    
    for(UIView *subview in cell.contentView.subviews){
        [subview removeFromSuperview];
        
        for(UIView *subsubview in subview.subviews){
            [subsubview removeFromSuperview];
        }
    }
    
    
    switch ((CellType)indexPath.row) {
        case CellTypeIcon:{
            NSLog(@"celltypeicon");
            
            static NSString *CellIdentifierIcon = @"rightIconTableViewCell";
            
            RightIconTableViewCell *cellIcon =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierIcon];
            
            //真円にする
            //画像を設定する
            //
            [self updateCellIcon:cellIcon];
            return cellIcon;
            
            
            
            break;
        }
        case CellTypeExplain:{
            
            NSLog(@"celltypeexplain");
//            cell.imageView.image = [UIImage imageNamed:@"a2.jpg"];
            cell.imageView.image = nil;
            [cell.contentView addSubview:labelExplain];
            return cell;
            break;
        }
        case CellTypeProfileConfig:{
            NSLog(@"config");
            cell.imageView.image = [UIImage imageNamed:@"icon_arrowToRight"];
            return cell;
            break;
        }
//        case CellTypeLogout:{
//            return heightRowLogout;
//            break;
//        }
//        case CellTypeFinal:{
//            return 0;
//            break;
//        }
//        default:
//            break;
    }
    
    NSLog(@"default");
    return cell;
    
}

-(void)updateCellIcon:(RightIconTableViewCell *)cell{
    
    int radius = 80;
    cell.imageView.frame = CGRectMake(0, 0, radius*2, radius*2);
    cell.imageView.layer.cornerRadius = radius;
    cell.imageView.center = CGPointMake(cell.bounds.size.width/2,
                                        radius);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.imageView.image = [UIImage imageNamed:@"a2.jpg"];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
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
