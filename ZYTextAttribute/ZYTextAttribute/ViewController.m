//
//  ViewController.m
//  ZYTextAttribute
//
//  Created by 郑遥 on 2016/10/25.
//  Copyright © 2016年 wozyao. All rights reserved.
//

#import "ViewController.h"
#import "ZYTextAttribute.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lifeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ZYTextAttribute properView:self.lifeLabel rangeDictArray:@[@{RANGEKEY : [NSValue valueWithRange:[self.lifeLabel.text rangeOfString:@"生命"]], COLORKEY : [UIColor redColor], FONTKEY : [UIFont systemFontOfSize:18.0]}, @{RANGEKEY : [NSValue valueWithRange:[self.lifeLabel.text rangeOfString:@"得到"]], COLORKEY : [UIColor greenColor], UNDERLINESTYLEKEY : [NSNumber numberWithInteger:NSUnderlineStyleSingle]}]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
