//
//  LeftViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/19.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftArrowTableViewCell.h"
#import "ImageCenterTableViewCell.h"

#import "ViewController.h"
#import "ReviewsViewController.h"

#define HEIGHT_CELL_TYPE_ORDINARY 55
#define HEIGHT_CELL_TYPE_LARGE 60

@interface LeftViewController ()
typedef enum : NSInteger{
    LeftCellTypeSearch = 0,
    LeftCellTypeMyItem,
    LeftCellTypeNewReview,
    LeftCellTypeFollowLabeler,
    LeftCellTypeFollowBrand,
    LeftCellTypeUnderWrite,
    LeftCellTypeBuyAppli,
    LeftCellTypeFinal
} LeftCellType;



@end

@implementation LeftViewController{
    UITextField *tfSearch;
    
    UITableView *menuLeftTable;
    
//    NSArray *arrLeftItems;
//    NSArray *arrLeftBottomItems;
}
-(id)init{
    self = [super init];
    if(self){
        [self setRestorationIdentifier:@"MMExampleLeftSideDrawerController"];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    arrLeftItems =
//    [NSArray arrayWithObjects:
//     @"マイアイテム",
//     @"最新レビューの一覧",
//     @"フォロー中のLABELER一覧",
//     @"フォロー中のブランド一覧",
//     nil];
//    
//    arrLeftBottomItems =
//    [NSArray arrayWithObjects:
//     @"下書き中のレビュー",
//     @"LABEL 買い物アプリへ",
//     nil];
    
    
    
    
    //右に１px大きくしているのはcenter-controllerの距離が一瞬見えてしまわないように。
    menuLeftTable =
    [[UITableView alloc]
     initWithFrame:
     CGRectMake(0, 0,
                self.view.bounds.size.width * RIGHT_SIDE_VIEW_WIDTH_RATIO + 1,
                //[UIScreen mainScreen].bounds.size.width * RIGHT_SIDE_VIEW_WIDTH_RATIO +1,
                self.view.bounds.size.height)
     style:UITableViewStylePlain];
    menuLeftTable.delegate = self;
    menuLeftTable.dataSource = self;
    menuLeftTable.scrollEnabled = false;
    //menuLeftTable.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:menuLeftTable];
    
    
    //tableViewにcellを登録する
    UINib *nibLeftArrow = [UINib nibWithNibName:@"LeftArrowTableViewCell" bundle:nil];
    [menuLeftTable registerNib:nibLeftArrow forCellReuseIdentifier:@"leftArrowTableViewCell"];
    
    UINib *nibCenterImage = [UINib nibWithNibName:@"ImageCenterTableViewCell" bundle:nil];
    [menuLeftTable registerNib:nibCenterImage forCellReuseIdentifier:@"imageCenterTableViewCell"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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


#pragma mark - textfield delegate

// キーボードのReturnボタンがタップされたらキーボードを閉じるようにする
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return YES;
}

//テキストフィールドを編集する直前に呼び出される
-(BOOL)textFieldShouldBeginEditing:(UITextField*)textField{
    return YES;
}
//テキストフィールドの編集が終了する直前に呼び出される
-(BOOL)textFieldShouldEndEditing:(UITextField*)textField{
    return YES;
}
//テキストフィールドを編集する直後に呼び出される
-(void)textFieldDidBeginEditing:(UITextField*)textField{
}
//テキストフィールドの編集が終了する直後に呼び出される
-(void)textFieldDidEndEditing:(UITextField*)textField{
    
}
//クリアボタンがタップされた時に呼ばれる(クリアしたい場合はYESを返す)
-(BOOL)textFieldShouldClear:(UITextField*)textField{
    return YES;
}


#pragma mark - tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //arrLeftItemsに加えて、下書き中のレビューとLABEL買い物アプリへの項目
    return LeftCellTypeFinal;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s, indexpath.row = %d", __func__, indexPath.row);
    switch ((LeftCellType)indexPath.row) {
        case LeftCellTypeSearch:
        case LeftCellTypeMyItem:
        case LeftCellTypeNewReview:
        case LeftCellTypeFollowLabeler:
        case LeftCellTypeFollowBrand:{
            return HEIGHT_CELL_TYPE_ORDINARY;
            break;
        }
            
        case LeftCellTypeUnderWrite:
        case LeftCellTypeBuyAppli:{
            return HEIGHT_CELL_TYPE_LARGE;
            break;
        }
        
        default:{
            
            break;
        }
    }
    //念のため
    return HEIGHT_CELL_TYPE_ORDINARY;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
    
    
    

    
    
    switch ((LeftCellType)indexPath.row) {
        case LeftCellTypeSearch:{
            
            
            cell.contentView.backgroundColor = [UIColor colorWithRed:30.f/255.f
                                                               green:30.f/255.f
                                                                blue:30.f/255.f
                                                               alpha:1.f];
            
            int marginTop = 10;
            int marginLeft = 13;
            UIView *viewWhite =
            [[UIView alloc]
             initWithFrame:CGRectMake(marginLeft, marginTop,
                                      [UIScreen mainScreen].bounds.size.width * RIGHT_SIDE_VIEW_WIDTH_RATIO - 2 * marginLeft,
                                      HEIGHT_CELL_TYPE_ORDINARY - 2 * marginTop)];
            viewWhite.backgroundColor = [UIColor whiteColor];
            [cell.contentView addSubview:viewWhite];
            
            
            
            
            tfSearch = [[UITextField alloc]
                        initWithFrame:
                        CGRectMake(viewWhite.frame.origin.x + 10,
                                   viewWhite.frame.origin.y,
                                   viewWhite.bounds.size.width,
                                   viewWhite.bounds.size.height)];
                        //viewWhite.frame];
            tfSearch.placeholder = @"  search";
            tfSearch.borderStyle = UITextBorderStyleNone;
            tfSearch.delegate = self;
            tfSearch.leftViewMode = UITextFieldViewModeAlways;
//            tfSearch.leftViewMode =
//            //UITextFieldViewModeWhileEditing;
//            UITextFieldViewModeUnlessEditing;
            tfSearch.returnKeyType = UIReturnKeySearch;
            
            
            
            //検索フィールドに表示するための虫眼鏡(color=lightGray)
            UIImage *image = [UIImage imageNamed:@"search2_small"];
            UIImageView *imvSearch = [[UIImageView alloc]init];
            imvSearch.frame = CGRectMake(0, 0, tfSearch.bounds.size.height/3, tfSearch.bounds.size.height/3);
            imvSearch.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            imvSearch.tintColor = [UIColor lightGrayColor];
            
            tfSearch.leftView = imvSearch;
            [cell.contentView addSubview:tfSearch];
            
            
            
            
            
            
            break;
        }
            
        case LeftCellTypeMyItem:{
            
            static NSString *CellIdentifierArrow = @"leftArrowTableViewCell";
            
            LeftArrowTableViewCell *cellArrow =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierArrow];
            
            cellArrow.lblItemName.text = @"マイアイテム";
            
            return cellArrow;
            break;
        }
        case LeftCellTypeNewReview:{
            
            static NSString *CellIdentifierArrow = @"leftArrowTableViewCell";
            
            LeftArrowTableViewCell *cellArrow =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierArrow];
            
            cellArrow.lblItemName.text = @"最新レビューの一覧";
            
            return cellArrow;
            break;
            
            break;
        }
        case LeftCellTypeFollowLabeler:{
            
            static NSString *CellIdentifierArrow = @"leftArrowTableViewCell";
            
            LeftArrowTableViewCell *cellArrow =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierArrow];
            
            cellArrow.lblItemName.text = @"フォロー中のLABELER一覧";
            
            return cellArrow;
            break;
        }case LeftCellTypeFollowBrand:{
            
            static NSString *CellIdentifierArrow = @"leftArrowTableViewCell";
            
            LeftArrowTableViewCell *cellArrow =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierArrow];
            
            cellArrow.lblItemName.text = @"フォロー中のブランド一覧";
            
            return cellArrow;
            break;
        }
        case LeftCellTypeUnderWrite:{
            
            static NSString *CellIdentifierImage = @"imageCenterTableViewCell";
            ImageCenterTableViewCell *cellImage =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierImage];
            
            //cellImage.imvCenter.image = [UIImage imageNamed:@"img_logout"];
            cellImage.lblCenter.text = @"下書き中のレビュー";
            
            cellImage.selectionStyle = UITableViewCellSelectionStyleNone;
            return cellImage;
            
            break;
        }
        case LeftCellTypeBuyAppli:{
            
            static NSString *CellIdentifierImage = @"imageCenterTableViewCell";
            ImageCenterTableViewCell *cellImage =
            [tableView dequeueReusableCellWithIdentifier:CellIdentifierImage];
            
            //cellImage.imvCenter.image = [UIImage imageNamed:@"img_logout"];
            cellImage.lblCenter.text = @"LABEL 買い物アプリへ";
            cellImage.lblCenter.backgroundColor =
            [UIColor colorWithRed:200.f/255.f
                            green:0 blue:0 alpha:1];
            
            cellImage.selectionStyle = UITableViewCellSelectionStyleNone;
            return cellImage;
            
            break;
        }
        case LeftCellTypeFinal:{
            return nil;
            break;
        }
        default:
            break;
    }
//    if(indexPath.row < arrLeftItems.count){
//        [cell.textLabel setText:arrLeftItems[(int)indexPath.row]];
//    }else{//arrLeftBottomItems
//        [cell.textLabel setText:arrLeftBottomItems[(int)indexPath.row-arrLeftItems.count]];
//    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    LeftCellTypeSearch = 0,
//    LeftCellTypeMyItem,
//    LeftCellTypeNewReview,
//    LeftCellTypeFollowLabeler,
//    LeftCellTypeFollowBrand,
//    LeftCellTypeUnderWrite,
//    LeftCellTypeBuyAppli,
//    LeftCellTypeFinal
    
    switch ((LeftCellType)indexPath.row) {
        case LeftCellTypeSearch:{
            NSLog(@"search -> nothing");
            break;
        }
        case LeftCellTypeMyItem:{
            
            
            NSLog(@"myitem");
            ViewController * center = [[ViewController alloc] init];
            
            UINavigationController * nav = [[MMNavigationController alloc] initWithRootViewController:center];
            
            //そのまま中央画面を表示するパターン
            [self.mm_drawerController
             setCenterViewController:nav
             withCloseAnimation:YES
             completion:nil];
            
            //（中央画面が見えている場合は）一度中央画面を閉じてから中央画面を表示するパターン
//            [self.mm_drawerController
//             setCenterViewController:nav
//             withFullCloseAnimation:YES
//             completion:nil];
            
            return;
            break;
        }
            
        case LeftCellTypeNewReview:{
            NSLog(@"newReview");
            
            
            ReviewsViewController * center = [[ReviewsViewController alloc] init];
            
            UINavigationController * nav = [[MMNavigationController alloc] initWithRootViewController:center];
            
            //そのまま中央画面を表示するパターン
            [self.mm_drawerController
             setCenterViewController:nav
             withCloseAnimation:YES
             completion:nil];
            
            
        }
        
        default:
            break;
    }
        
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
