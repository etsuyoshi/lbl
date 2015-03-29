//
//  CreateLabelViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/21.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "CreateLabelViewController.h"
#import "CreateLabelTopTableViewCell.h"//垂直マージン１０
#import "ImageCenter2TableViewCell.h"//垂直マージン５
#import "AddLinkTableViewCell.h"

//下書き保存、確定ボタン
#import "ImageCenterTableViewCell.h"

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
    tableCreate.separatorColor = [UIColor clearColor];
    
    tableCreate.delegate = self;
    tableCreate.dataSource = self;
    
    tableCreate.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    tableCreate.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    
    [self.view addSubview:tableCreate];
    
    UINib *nibTop = [UINib
                     nibWithNibName:@"CreateLabelTopTableViewCell"
                     bundle:nil];
    [tableCreate registerNib:nibTop
    forCellReuseIdentifier:@"createLabelTopTableViewCell"];
    
    UINib *nibAdd = [UINib
                     nibWithNibName:@"AddLinkTableViewCell"
                     bundle:nil];
    [tableCreate registerNib:nibAdd
      forCellReuseIdentifier:@"addLinkTableViewCell"];
    
    UINib *nibButton = [UINib
                        nibWithNibName:@"ImageCenterTableViewCell"
                        bundle:nil];
    [tableCreate registerNib:nibButton
      forCellReuseIdentifier:@"imageCenterTableViewCell"];
    UINib *nibButton2 = [UINib
                         nibWithNibName:@"ImageCenter2TableViewCell"
                         bundle:nil];
    [tableCreate registerNib:nibButton2
      forCellReuseIdentifier:@"imageCenter2TableViewCell"];
    
    
    
    
    marginLabel = 30;
    marginTextField = 30;
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
        
        
        //ios8以降の場合
        for(UIView *subview in cell.contentView.subviews){
            [subview removeFromSuperview];
        }
        
        cell.backgroundColor = [UIColor lightGrayColor];
        
        switch ((CreateSection1CellType)indexPath.row) {
            case CreateSection1CellTypeTitle:{
                //NSLog(@"title in cell");
                int marginTop = 20;
                int marginLeft = 10;
                UIView *viewWhite =
                [[UIView alloc]
                 initWithFrame:
                 CGRectMake(marginLeft, marginTop,
                            self.view.bounds.size.width - 2 * marginLeft,
                            HEIGHT_SMALL_ROW - marginTop - marginLeft)];
                viewWhite.backgroundColor = [UIColor whiteColor];
                [cell.contentView addSubview:viewWhite];
                
                UITextField *tfTitle = [[UITextField alloc]init];
                //縦マージンは横マージンの半分
                tfTitle.frame =
                CGRectMake(0, 0,
                           self.view.bounds.size.width - 2 * marginTextField,
                           HEIGHT_SMALL_ROW - marginTextField);
                tfTitle.delegate = self;
                tfTitle.borderStyle = UITextBorderStyleNone;
                tfTitle.tag = CreateSection1CellTypeTitle;
                
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
                
                int marginTop = 0;
                int marginLeft = 10;
                
                //表示位置が右に寄っているので幅を広くとることで開始位置を左位置に微調整
                UIPlaceHolderTextView *textView =
                [[UIPlaceHolderTextView alloc]
                 initWithFrame:
                 CGRectMake(marginLeft, marginTop,
                            self.view.bounds.size.width - 2 * marginLeft,
                            HEIGHT_LARGE_ROW - 2 * marginTop)];//上下のマージンはないものとする（必要だが念のため)
                textView.tag = CreateSection1CellTypeMain;
                textView.placeholder = @"本文を入力";
                textView.placeholderColor = [UIColor lightGrayColor];
                textView.center = CGPointMake(self.view.bounds.size.width/2,
                                              HEIGHT_LARGE_ROW/2);
                textView.delegate = self;
                [cell.contentView addSubview:textView];
                break;
            }
            case CreateSection1CellTypeAddLink:{
                static NSString *CellIdentifierAdd =
                @"addLinkTableViewCell";
                
                
                AddLinkTableViewCell *cellAdd =
                [tableView dequeueReusableCellWithIdentifier:CellIdentifierAdd];
                
                cellAdd.viewBackOfImv.userInteractionEnabled = YES;
                UITapGestureRecognizer *tapGesture =
                [[UITapGestureRecognizer alloc]
                 initWithTarget:self action:@selector(tappedAddLink:)];
                [cellAdd.viewBackOfImv addGestureRecognizer:tapGesture];
                cellAdd.tfLink.tag = (int)indexPath.row;
                cellAdd.tfLink.delegate = self;
                
                cellAdd.selectionStyle =
                UITableViewCellSelectionStyleNone;
                
                cellAdd.backgroundColor = [UIColor lightGrayColor];
                
                
                return cellAdd;
                
                break;
            }
            case CreateSection1CellTypeReserve:{
                
                static NSString *CellIdentifierButton2 =
                @"imageCenter2TableViewCell";
                
                ImageCenterTableViewCell *cellButton =
                [tableView dequeueReusableCellWithIdentifier:CellIdentifierButton2];
                cellButton.backgroundColor = [UIColor lightGrayColor];
                
                [cellButton.lblCenter setText:@"下書き保存"];
                cellButton.lblCenter.backgroundColor = [UIColor grayColor];
                
                cellButton.lblCenter.userInteractionEnabled = YES;
                UITapGestureRecognizer *tapGesture =
                [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedReserve:)];
                [cellButton.lblCenter addGestureRecognizer:tapGesture];
                
                
                return cellButton;
                
                break;
            }
            case CreateSection1CellTypeConfirm:{
                
                static NSString *CellIdentifierButton2 =
                @"imageCenter2TableViewCell";
                
                ImageCenterTableViewCell *cellButton =
                [tableView dequeueReusableCellWithIdentifier:CellIdentifierButton2];
                cellButton.backgroundColor = [UIColor lightGrayColor];
                
                [cellButton.lblCenter setText:@"確定"];
                cellButton.lblCenter.backgroundColor =
                [UIColor redColor];
                
                cellButton.lblCenter.userInteractionEnabled = YES;
                UITapGestureRecognizer *tapGesture =
                [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedConfirm:)];
                [cellButton.lblCenter addGestureRecognizer:tapGesture];
                
                
                return cellButton;
                
                
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

//キーボードでコンテンツサイズが通常よりも長くなっている可能性があるので
//キーボード解除と同時にコンテンツサイズを元に戻す
-(void)setContentSizeMinimum{
    
    //最後のセルを取得
//    UITableViewCell *cellLast = [tableCreate c]
    int lastSection = (int)[tableCreate numberOfSections]-1;
    int lastRow =(int)[tableCreate numberOfRowsInSection:lastSection]-1;
    NSIndexPath *lastIndexPath =
    [NSIndexPath indexPathForRow:lastRow
                       inSection:lastSection];
    
    NSLog(@"lastIndexpath = %@", lastIndexPath);
    
    //最後のセルの位置yLastと高さhLastを取得
    CGRect rectLast = [tableCreate rectForRowAtIndexPath:lastIndexPath];
    int yLast = rectLast.origin.y;
    int hLast = rectLast.size.height;
    
    NSLog(@"ylast = %d, hLast = %d", yLast, hLast);
    
    //必要ないと思うが、念のため解放の用意
    lastIndexPath = nil;
    //minimum:contentsize = yLast+hLast
    [tableCreate setContentSize:CGSizeMake(tableCreate.contentSize.width,
                                           yLast + hLast)];
    
}


#pragma mark - textView and textField delegate methods

//textFieldもしくはtextViewで入力が検知されたら発動(アクティブになったら、、ではないので注意が必要)
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    // ここに入力検知時に実行させたい処理を記述
    NSLog(@"%s", __func__);
    return YES;
}

#pragma mark - textView delegate

//編集される直前に呼ばれるメソッド
-(BOOL)textViewShouldBeginEditing:(UITextView*)textView{
    //編集が開始されたらその行を一番上に持っていく
    NSLog(@"%s : 編集開始", __func__);
//    //textfieldが存在するインデックスパス
//    NSIndexPath *belongIndexPath =
//    [self getIndexPathFromText:textView];
//    
//    
//    [tableCreate scrollToRowAtIndexPath:belongIndexPath
//                       atScrollPosition:UITableViewScrollPositionTop
//                               animated:YES];
//
    [self scrollTopWhenTextActivate:textView];
    
    return YES;
}
//編集が終了する直前に呼ばれるメソッド
-(BOOL)textViewShouldEndEditing:(UITextView*)textView{
    //コンテンツが長くなっている可能性があるので短くする
    [self setContentSizeMinimum];
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
    
    //編集が開始されたらその行を一番上に持っていく
    NSLog(@"%s : 編集開始", __func__);
    [self scrollTopWhenTextActivate:textField];
    
    return YES;
}
//テキストフィールドの編集が終了する直前に呼び出される
-(BOOL)textFieldShouldEndEditing:(UITextField*)textField{
    //コンテンツが長くなっている可能性があるので短くする
    [self setContentSizeMinimum];
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



#pragma mark - text scroll up
-(void)scrollTopWhenTextActivate:(UIView *)text{
    
    //textfieldが存在するインデックスパス
    NSIndexPath *belongIndexPath =
    [self getIndexPathFromText:text];
    
    
//    [tableCreate scrollToRowAtIndexPath:belongIndexPath
//                       atScrollPosition:UITableViewScrollPositionTop
//                               animated:YES];
    
    //アニメーションでcontentoffsetを指定(完了ブロックでトップまで移動できたか判定して再度アニメーションするのは２段階になってしまうのでボツ)
    //contentSizeとindexpathの位置を特定して、トップに移動することができないとわかったらcontentsizeのheightを長くする
    
    int allContentLength = tableCreate.contentSize.height;
    NSLog(@"allContentLength = %d", allContentLength);
    
    CGRect rect0 = [tableCreate rectForRowAtIndexPath:belongIndexPath];
    
    //テキストが所属しているセルの位置が下位置すぎる場合はcontentSizeの関係でトップまで行かない可能性があるので長くしてあげる
    if(rect0.origin.y + self.view.bounds.size.height-64 >= allContentLength){
        NSLog(@"コンテンツサイズが足りないので長くする→%f", rect0.origin.y + self.view.bounds.size.height-64);
        //セル位置にナビバーを考慮した画面長を足すとコンテンツサイズを超過してしまう場合：セル位置が下すぎる場合
        tableCreate.contentSize = CGSizeMake(tableCreate.contentSize.width,
                                             rect0.origin.y + self.view.bounds.size.height-64);
    }
    
    //[tableCreate scrollRectToVisible:rect0 animated:YES];
    [tableCreate setContentOffset:CGPointMake(rect0.origin.x, rect0.origin.y-64) animated:YES];
    
//    NSLog(@"%s height = %d, y0 = %d", __func__, allContentLength, y0);
    
    
}


//textviewやtextfieldがdelegateされた時に所属するセル（自体）もしくはindexpathを取得するためのメソッド
-(NSIndexPath *)getIndexPathFromText:(UIView *)sender{
    if([sender isKindOfClass:[UITextView class]] ||
       [sender isKindOfClass:[UITextField class]]){
        
        
        
        //タグ付けされたtextに基づいて位置を特定する
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag
                                                    inSection:1];
        
        
        NSLog(@"%s, from = %@ , return = %@", __func__,
              [sender class],
              indexPath);
        return indexPath;
        
    }
    
    return nil;
}

//しゅんきさん確認(@20150320):画像選択ピッカー
-(void)tappedAddLink:(UIGestureRecognizer *)gesture{
    NSLog(@"%s", __func__);
    
    
    [SVProgressHUD showSuccessWithStatus:@"写真選択ピッカーを表示します"];
    
}

-(void)tappedReserve:(UIGestureRecognizer *)gesture{
    NSLog(@"%s", __func__);
    
    
    [SVProgressHUD showSuccessWithStatus:@"設定を保存します"];
    
}
-(void)tappedConfirm:(UIGestureRecognizer *)gesture{
    NSLog(@"%s", __func__);
    
    
    [SVProgressHUD showSuccessWithStatus:@"確定ボタンが押されました"];
    
}


@end
