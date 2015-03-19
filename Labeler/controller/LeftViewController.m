//
//  LeftViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/19.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController{
    UITextField *tfSearch;
    
    UITableView *menuLeftTable;
    
    NSArray *arrLeftItems;
    NSArray *arrLeftBottomItems;
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
    
    arrLeftItems =
    [NSArray arrayWithObjects:
     @"マイアイテム",
     @"最新レビューの一覧",
     @"フォロー中のLABELER一覧",
     @"フォロー中のブランド一覧",
     nil];
    
    arrLeftBottomItems =
    [NSArray arrayWithObjects:
     @"下書き中のレビュー",
     @"LABEL 買い物アプリへ",
     nil];
    
    
    tfSearch = [[UITextField alloc]
                initWithFrame:
                CGRectMake(0, 75, self.view.bounds.size.width, 70)];
    tfSearch.placeholder = @"search";
    tfSearch.borderStyle = UITextBorderStyleRoundedRect;
    tfSearch.delegate = self;
    [self.view addSubview:tfSearch];
    
    
    menuLeftTable =
    [[UITableView alloc]
     initWithFrame:CGRectMake(0, tfSearch.frame.origin.y + tfSearch.bounds.size.height,
                              self.view.bounds.size.width,
                              self.view.bounds.size.height -
                              (tfSearch.frame.origin.y + tfSearch.bounds.size.height))
     style:UITableViewStyleGrouped];
    menuLeftTable.delegate = self;
    menuLeftTable.dataSource = self;
    [self.view addSubview:menuLeftTable];
    
    
    
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
    return arrLeftItems.count + arrLeftBottomItems.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
    
//    switch ((int)indexPath.row) {
//        case 0:{
//            <#statements#>
//            break;
//        }
//        case 1:{
//            <#statements#>
//            break;
//        }
//        case 0:{
//            <#statements#>
//            break;
//        }case 0:{
//            <#statements#>
//            break;
//        }
//        case 0:{
//            <#statements#>
//            break;
//        }
//        case 0:{
//            <#statements#>
//            break;
//        }
//        default:
//            break;
//    }
    if(indexPath.row < arrLeftItems.count){
        [cell.textLabel setText:arrLeftItems[(int)indexPath.row]];
    }else{//arrLeftBottomItems
        [cell.textLabel setText:arrLeftBottomItems[(int)indexPath.row-arrLeftItems.count]];
    }
    
    return cell;
    
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
