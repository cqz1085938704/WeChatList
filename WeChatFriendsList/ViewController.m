//
//  ViewController.m
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/7.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import "ViewController.h"

#define WIN_SIZE [UIScreen mainScreen].bounds.size

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *texts;
    UIActivityIndicatorView *indicator;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.tableView];
    
    texts = [NSMutableArray arrayWithCapacity:1];
    
    [self requestDataAtIndex:0 length:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, WIN_SIZE.width, WIN_SIZE.height - 20) style:UITableViewStylePlain];
        //_tableView.backgroundColor = [UIColor lightGrayColor];
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
        indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, WIN_SIZE.width, 40)];
        [indicator stopAnimating];
        //indicator.backgroundColor = [UIColor lightGrayColor];
        indicator.layer.borderColor = [UIColor lightGrayColor].CGColor;
        indicator.layer.borderWidth = 0.5;
        indicator.hidesWhenStopped = YES;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _tableView.tableFooterView = indicator;
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell)
    {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.cellStyle = arc4random()%2;
    //NSDictionary *dic = texts[indexPath.row];
    cell.textLabel.text = texts[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"Contact_SyncPhoneContacts_avatar@2x"];
    
    NSLog(@"row:%ld", (long)indexPath.row);
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSDictionary *dic = texts[indexPath.row];
    NSString *str = texts[indexPath.row];
    CGFloat rowHeight = [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(WIN_SIZE.width - 90, CGFLOAT_MAX)].height;
    
    if (rowHeight < 60)
    {
        return 80;
    }
    
    return rowHeight + 20;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return texts.count;
}

- (void)requestDataAtIndex:(NSInteger)index length:(NSInteger)length
{
    [indicator startAnimating];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:1];
    
//    [Util requestDataFromUrl:@"https://www1.qualityassurance.fileupload.asiapacific.hsbc.com/imageAttach/forMobileTeam/CoreTestEnv/config/config_json_Mob_at_O68.txt" completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//        [indicator stopAnimating];
//        if (data)
//        {
//            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//            
//            if (json[@"webresources"][0][@"1.5.3"][0][@"localtemplate"])
//            {
//                [texts addObjectsFromArray:json[@"webresources"][0][@"1.5.3"][0][@"localtemplate"]];
//                [self.tableView reloadData];
//            }
//        }
//        
//        
//    }];
}

- (void)reloadData
{
    [indicator stopAnimating];
    
    NSArray *resultsArr = @[@"9 月 30 日凌晨，苹果正式在中国大陆推出 iTunes Store，这标志着中国大陆的 iOS 用户可以享用包括音乐、电影以及图书在内的服务。小编在激动之余，赶紧去体验了一下，下面就让我们一起来看看大陆的 iTunes 服务到底是什么样的。", @"Apple Music 终于得以跟我们见面。它具有良好的用户体验以及还算丰富的版权库（国语方面有时候不尽如人意）。而更令人惊讶的是，三个月的免费试用期之外，Apple Music 在大陆的个人版月费竟然只有10元（美国 9.99 美元），家庭版只有15元，不得不让人大呼良心（美国 14.99 美元）。", @"同意 Apple Music 的条款之后，它会引导你设置自己偏好的音乐风格和歌手，并且会在“contact”里面自动关注你所喜爱的歌手。然后，进入“为您甄选”页面，你就可以看到苹果为你推荐的歌单和专辑了。整个过程体验下来非常方便，也很有逼格。", @"iTunes 电影服务有购买和租借两种方式，购买电影则可以将电影储存到自己的 iCloud 云空间，多设备之间可以共享观看，而租借服务则代表电影只能在线观看。", @"价格如何呢？看上去还算良心，虽然不像 Apple Music 那么良心。像限时1元的50部影片中，不乏《泰囧》《让子弹飞》这样的华语精品影片，就非常划算了。正常的华语影片价格适中，如《后会无期》的购买价格为10元，租借价格为3元，还是能够达到一般人心理价位的。一些较新的外国大片可能相对贵一些，但也不算离谱。如 HD 版的《侏罗纪世界》，购买价格为22元。", @"就影片库而言，可以基本满足用户需求，但一些刚刚上映的影片，如《像素大战》，就不能在这里看啦。", @"打开 iBooks，最先映入眼帘的是什么呢？没错，是《大头儿子与小头爸爸》……中文书库的收录数量一般，像雨果奖作品《三体》、历史穿越经典《新宋》，都是搜索不到的。一些经典的文学书目也未曾收录，如博尔赫斯的《百年孤独》、卡尔维诺的《寒冬夜行人》等，这些都是搜索不到的。当然啦，像《三国演义》这样绝对的经典作品则不会有什么问题。价格方面，基本是电子书的正常价格。比如卡夫卡的《城堡》售价10元，东野圭吾的《白夜行》售价15元。而且苹果为大家提供了试读功能，可以让我们仔细斟酌后再决定是否购买。以上便是小编的初步体验。"];
    
    [texts addObjectsFromArray:resultsArr];
    [self.tableView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (indicator.isAnimating)
    {
        return;
    }
    
    if (scrollView.contentSize.height - scrollView.contentOffset.y <= scrollView.bounds.size.height)
    {
        [self requestDataAtIndex:texts.count - 1 length:10];
    }
}









@end
