//
//  ViewController.m
//  XLTimw
//
//  Created by 孔凡伍 on 2016/12/5.
//  Copyright © 2016年 kongfanwu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** <##> */
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addTime];
}
- (void)addTime
{
//    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 100)];
    _dateLabel.textAlignment = NSTextAlignmentLeft;
    _dateLabel.font = [UIFont systemFontOfSize:60];
    _dateLabel.textColor = [UIColor redColor];
    [self.view addSubview:_dateLabel];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    self.formatter = formatter;
    [formatter setDateFormat:@"HH:mm:ss.S"];
    [formatter setLocale:[NSLocale currentLocale]];
    
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkClick)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)displayLinkClick
{
    _dateLabel.text = [_formatter stringFromDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
