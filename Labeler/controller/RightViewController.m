//
//  RightViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/19.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "RightViewController.h"
#import "RightIconTableViewCell.h"
#import "LeftArrowTableViewCell.h"
#import "ImageCenterTableViewCell.h"

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
    
    UIImageView *navBarHairlineImageView;
    
    
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
    
    //ナビバーのアンダーラインを消去するため
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    [self setNavigationBar];
    
//    self.view.backgroundColor = [UIColor greenColor];
    
    int marginSideInLabel = 30;
    //MMDrawerの特性として右側が少し表示されないのでその分(以下)を考慮したマージンにする必要がある
    int widthHidden = [UIScreen mainScreen].bounds.size.width * (1 - RIGHT_SIDE_VIEW_WIDTH_RATIO);
    
    labelExplain = [[UILabel alloc]initWithFrame:
                    CGRectMake(marginSideInLabel, 0,
                               self.view.bounds.size.width-widthHidden-marginSideInLabel*2,30)];
    labelExplain.text = @"テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト";
    labelExplain.font = [UIFont systemFontOfSize:15.f];
    labelExplain.numberOfLines = 0;
    labelExplain.textColor = [UIColor lightGrayColor];
    labelExplain.textAlignment = NSTextAlignmentCenter;
    [labelExplain sizeToFit];
    heightRowIcon = 200;
    heightRowExplain = labelExplain.bounds.size.height;
    heightRowProfileConfig = 60;
    heightRowLogout = 60;
    
    NSLog(@"heightRowExplain = %d", heightRowExplain);
    
    menuRightTableview =
    [[UITableView alloc]
     initWithFrame:
     CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * RIGHT_SIDE_VIEW_WIDTH_RATIO+1,
                self.view.bounds.size.height)
     style:UITableViewStylePlain];
    menuRightTableview.delegate = self;
    menuRightTableview.dataSource = self;
//    menuRightTableview.backgroundColor = [UIColor yellowColor];
    
    //tableViewにcellを登録する
    UINib *nibIcon = [UINib nibWithNibName:@"RightIconTableViewCell" bundle:nil];
    [menuRightTableview registerNib:nibIcon forCellReuseIdentifier:@"rightIconTableViewCell"];
    
    UINib *nibLeftArrow = [UINib nibWithNibName:@"LeftArrowTableViewCell" bundle:nil];
    [menuRightTableview registerNib:nibLeftArrow forCellReuseIdentifier:@"leftArrowTableViewCell"];
    
    UINib *nibCenterImage = [UINib nibWithNibName:@"ImageCenterTableViewCell" bundle:nil];
    [menuRightTableview registerNib:nibCenterImage forCellReuseIdentifier:@"imageCenterTableViewCell"];
    
    
    
    [self.view addSubview:menuRightTableview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super  viewWillAppear:animated];
    //ナビバーのアンダーラインを消去するため
    navBarHairlineImageView.hidden = YES;
    
    [menuRightTableview reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //ナビバーのアンダーラインを消去するため
    navBarHairlineImageView.hidden = NO;
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
            
            cellIcon.selectionStyle = UITableViewCellSelectionStyleNone;
            
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
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        }
        case CellTypeProfileConfig:{
            NSLog(@"config");
            //通常せるの場合
            //cell.imageView.image = [UIImage imageNamed:@"icon_arrowToRight"];
            
            static NSString *CellIdentifierArrow = @"leftArrowTableViewCell";
            
            LeftArrowTableViewCell *cellArrow =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierArrow];
            
            cellArrow.lblItemName.text = @"マイプロフィール設定";
            
            return cellArrow;
            break;
        }
        case CellTypeLogout:{
//            return heightRowLogout;
            static NSString *CellIdentifierImage = @"imageCenterTableViewCell";
            ImageCenterTableViewCell *cellImage =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierImage];
            
            //cellImage.imvCenter.image = [UIImage imageNamed:@"img_logout"];
            cellImage.lblCenter.text = @"ログアウト";
            
            cellImage.selectionStyle = UITableViewCellSelectionStyleNone;
            return cellImage;
            break;
        }
        case CellTypeFinal:{
            return cell;//ここに制御が移ることはない
            break;
        }
//        default:
//            break;
    }
    
    NSLog(@"default");
    return cell;
    
}

-(void)updateCellIcon:(RightIconTableViewCell *)cell{
    
    cell.imvFace.image = [UIImage imageNamed:@"a2.jpg"];
    
    NSLog(@"cell.imvFace.frame = %@",
          NSStringFromCGRect(cell.imvFace.frame));
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    
//    if(indexPath.row == CellTypeProfileConfig){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    }
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


-(void)setNavigationBar{
    
    //ナビバーのアンダーラインを消去するため
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarBackground"]//存在しない画像
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    
    
    
    
    
    
    
    //right-button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"icon_close"]
     forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 35);
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];

    
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    
    
}

-(void)close{
    NSLog(@"%s", __func__);
}


//ナビバーのアンダーラインを消去するため
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}



@end
