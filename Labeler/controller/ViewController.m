//
//  ViewController.m
//  Labeler
//
//  Created by EndoTsuyoshi on 2015/03/19.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "ViewController.h"
#import "ETCollectionViewCell.h"
#import "CreateLabelViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UICollectionView *mainCollectionView;
    
    NSMutableArray *arrItems;
    
    int cell_size;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%s", __func__);
    
    [self setupLeftMenuButton];
    [self setupRightMenuButton];
    
    cell_size = self.view.bounds.size.width/3;
    UICollectionViewFlowLayout *collectionViewFlowLayout =
    [[UICollectionViewFlowLayout alloc]init];
    collectionViewFlowLayout.itemSize = CGSizeMake(cell_size, cell_size);
    //    collectionViewFlowLayout.itemSize = CGSizeMake(CELL_SIZE, CELL_SIZE+CELL_LABEL_HEIGHT);  //表示するアイテムのサイズ
    collectionViewFlowLayout.minimumLineSpacing = 0.f;  //セクションとアイテムの間隔(縦空白幅)
    collectionViewFlowLayout.minimumInteritemSpacing = 0.f;//
    float intervalOfSide = 0;
    collectionViewFlowLayout.sectionInset =
    UIEdgeInsetsMake(intervalOfSide, //top
                     intervalOfSide, //left
                     intervalOfSide, //bottom
                     intervalOfSide); //right
//    //??
//    collectionViewFlowLayout.headerReferenceSize =
//    CGSizeMake(self.view.bounds.size.width, HEIGHT_HEADER);
    
    
    
    mainCollectionView =
    [[UICollectionView alloc]initWithFrame:self.view.bounds
                      collectionViewLayout:collectionViewFlowLayout];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    mainCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainCollectionView];
    
    
    //カスタムセルを登録する
    UINib *nib = [UINib nibWithNibName:@"ETCollectionViewCell"
                                bundle:nil];
    [mainCollectionView
     registerNib:nib
     forCellWithReuseIdentifier:@"collectionViewCell"];
    [mainCollectionView
     registerNib:[UINib nibWithNibName:@"ETTopHeader"//name of xib
                                bundle:nil]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
     withReuseIdentifier:@"ETTopHeader"];//identifier of xib

    NSLog(@"maincollection = %@", mainCollectionView);
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
    
    [mainCollectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
    mainCollectionView = nil;
}



#pragma collection-delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSLog(@"number of sections in collection view");
    return 1;
}

//セクション毎のセル数を指定
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section{
    
    NSLog(@"number of ItemsInSection");
    if(section == 0){
        //        return 2500;
        NSLog(@"return %d", 100);//(int)arrItems.count);
        return 100;//arrItems.count;
    }else{
        NSLog(@"error!");
        return 0;//
    }
}



//ヘッダーとフッターの設定
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"viewForSupplementaryElementOfKind : collectionview = %@", collectionView);
    return nil;
    
    //ヘッダーもしくはフッターがある場合
//    if (kind == UICollectionElementKindSectionHeader) {
//        
//        
//        //create header (sub)class instance
//        ETTopHeaderView *
//        headerView =
//        (ETTopHeaderView *)[collectionView
//                            dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//                            withReuseIdentifier:@"ETTopHeader"
//                            forIndexPath:indexPath];
//        
//        // スクロールViewにコンテンツViewを追加する。
//        return headerView;
//    }
//    
//    
//    if (kind == UICollectionElementKindSectionFooter) {
//        return nil;
//    }
}


//セルの高さ
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s, %@", __func__, indexPath);
    if(indexPath.section == 0){
        NSLog(@"cell_size= %d", cell_size);
        //アイテムのサイズ
        return CGSizeMake(cell_size, cell_size);
        //        return CGSizeMake(CELL_SIZE, CELL_SIZE+CELL_LABEL_HEIGHT);
    }else{
        NSLog(@"error!");
        return CGSizeZero;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s, section = %d, row=%d", __func__, (int)indexPath.section ,(int)indexPath.row);
    //    NSLog(@"cellForItemAtIndexPath");
    ETCollectionViewCell *cell = nil;
    
    if(indexPath.section == 0){
        
        
        cell =
        [collectionView
         dequeueReusableCellWithReuseIdentifier:@"collectionViewCell"//viewDidLoadでnibに定義
         forIndexPath:indexPath];
        
        
        NSString *strImage = [NSString stringWithFormat:@"a%d.jpg",
                              arc4random() % 30];
        [cell.mainImage setImage:[UIImage imageNamed:strImage]];
        
        return cell;
        
    }
    return nil;
}

-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%s", __func__);
    
    
    CreateLabelViewController *vc = [[CreateLabelViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    

}


#pragma mark - setupButton
-(void)setupLeftMenuButton{
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    
}

-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}





@end
