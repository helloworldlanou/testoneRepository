//
//  ViewController.m
//  Poping
//
//  Created by lanou on 16/7/11.
//  Copyright © 2016年 tongwei. All rights reserved.
//

#import "ViewController.h"
#import "PoppingTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *lists;

@end

@implementation ViewController

-(NSMutableArray *)lists{
    if (!_lists) {
        _lists = [[NSMutableArray alloc] init];
    }
    return _lists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSInteger i = 0; i < 20; i ++) {
        [self.lists addObject:@"这种重中之重,我操咧"];
    }
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[PoppingTableViewCell class] forCellReuseIdentifier:@"poppingCell"];
    _tableView.rowHeight = self.view.frame.size.height/10.0;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -- tableViewDataSources

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PoppingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"poppingCell"];
    cell.textLabel.text = self.lists[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
