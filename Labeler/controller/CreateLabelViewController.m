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

#define HEIGHT_SMALL_ROW 70
#define HEIGHT_LARGE_ROW 200

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
    
    int marginLabel;
    int marginTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    tableCreate = [[UITableView alloc]
                   initWithFrame:self.view.bounds
                   style:UITableViewStyleGrouped];
    
    tableCreate.delegate = self;
    tableCreate.dataSource = self;
    [self.view addSubview:tableCreate];
    
    UINib *nibTop = [UINib
                     nibWithNibName:@"CreateLabelTopTableViewCell"
                     bundle:nil];
    [tableCreate registerNib:nibTop
    forCellReuseIdentifier:@"createLabelTopTableViewCell"];
    
    
    
    marginLabel = 30;
    //MMDrawerの特性として右側が少し表示されないのでその分(以下)を考慮したマージンにする必要がある
    
    labelExplain =
    [[UILabel alloc]initWithFrame:
     CGRectMake(marginLabel, marginLabel,
                self.view.bounds.size.width-marginLabel*2,30)];
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
        labelHeader.font =
        [UIFont fontHirakakuWithSize:17.f];
        labelHeader.textAlignment =
        NSTextAlignmentCenter;
        [labelHeader sizeToFit];
        
        labelHeader.center = viewHeader.center;
        
        [viewHeader addSubview:labelHeader];
        
        
        
        
        
        return viewHeader;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        switch ((CreateSection0CellType)indexPath.row) {
            case CreateSection0CellTypeTop:{
                return 250;
                break;
            }
            case CreateSection0CellTypeExplain:{
                //ラベルの大きさよりも少しだけ余裕を持って表示する
                return labelExplain.bounds.size.height + 2 * marginLabel;
                break;
            }
            default:{
                return 0;
                break;
            }
        }
    }else{
        switch ((CreateSection1CellType)indexPath.row) {
            case CreateSection1CellTypeTitle:
            case CreateSection1CellTypeAddLink:
            case CreateSection1CellTypeConfirm:
            case CreateSection1CellTypeReserve:{
             
                return HEIGHT_SMALL_ROW;
            }
            case CreateSection1CellTypeMain:{
                return HEIGHT_LARGE_ROW;
                break;
            }
            default:
                break;
        }
        return 0;
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
    
    
    if(indexPath.section == 1){
        
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
        
        
        switch ((CreateSection1CellType)indexPath.row) {
            case CreateSection1CellTypeTitle:{
                //NSLog(@"title in cell");
                UITextField *tfTitle = [[UITextField alloc]init];
                //縦マージンは横マージンの半分
                tfTitle.frame =
                CGRectMake(0, 0,
                           self.view.bounds.size.width - 2 * marginTextField,
                           HEIGHT_SMALL_ROW - marginTextField);
                tfTitle.delegate = self;
                tfTitle.borderStyle = UITextBorderStyleNone;
                
                
                tfTitle.placeholder = @"タイトルを入力";
                tfTitle.borderStyle = UITextBorderStyleNone;
                tfTitle.delegate = self;
                //画像を表示しない
                tfTitle.leftViewMode = UITextFieldViewModeNever;
                tfTitle.returnKeyType = UIReturnKeySearch;
                tfTitle.center = CGPointMake(self.view.bounds.size.width/2,
                                             HEIGHT_SMALL_ROW/2);
                
                [cell.contentView addSubview:tfTitle];
                break;
            }
            case CreateSection1CellTypeMain:{
                
                UIPlaceHolderTextView *textView =
                [[UIPlaceHolderTextView alloc]
                 initWithFrame:
                 CGRectMake(0, 0,
                            self.view.bounds.size.width - 2 * marginTextField,
                            HEIGHT_LARGE_ROW - marginTextField)];
                textView.placeholder = @"テキストを入力してください";
                textView.placeholderColor = [UIColor redColor];
                textView.delegate = self;
                [cell.contentView addSubview:textView];
                break;
            }
            case CreateSection1CellTypeAddLink:{
                
                break;
            }
            case CreateSection1CellTypeConfirm:{
                
                break;
            }
            case CreateSection1CellTypeReserve:{
                
                break;
            }
            case CreateSection1CellTypeFinal:{
                
                break;
            }
            default:
                break;
        }
    
        return cell;
    
    }
    
    return nil;
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


#pragma mark - textView and textField delegate methods

//textFieldもしくはtextViewで入力が検知されたら発動(アクティブになったら、、ではないので注意が必要)
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    // ここに入力検知時に実行させたい処理を記述
    NSLog(@"%s", __func__);
    return YES;
}

//textviewやtextfieldがdelegateされた時に所属するセル（自体）もしくはindexpathを取得するためのメソッド
-(NSIndexPath *)getIndexPathFromText:(id)sender{
    if([sender isKindOfClass:[UITextView class]] ||
       [sender isKindOfClass:[UITextField class]]){
        
        NSIndexPath *indexPath = nil;
        
        
        return indexPath;
        
    }
    
    return nil;
}

#pragma mark - textView delegate

//編集される直前に呼ばれるメソッド
-(BOOL)textViewShouldBeginEditing:(UITextView*)textView{
    
//    tableCreate scrollto
    return YES;
}
//編集が終了する直前に呼ばれるメソッド
-(BOOL)textViewShouldEndEditing:(UITextView*)textView{
    return YES;
}


#pragma mark - textField delegate
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



@end
