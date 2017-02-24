//
//  ViewController.m
//  AndyDropDownList
//
//  Created by 纵昂 on 2017/2/24.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ViewController.h"
#import "AndyDropDownList.h"
@interface ViewController ()<AndyDropDownDelegate>
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *msakImg;
@property (nonatomic, strong) AndyDropDownList *list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = [NSArray arrayWithObjects:@"纵昂",@"IT男",@"阳光男孩",@"呵呵哒~",@"林俊杰",@"滨崎步",@"艹",nil];
    [self.view addSubview:self.button];
    [self.button addSubview:self.msakImg];
    [self.view addSubview:self.list];
    [self.view bringSubviewToFront:_button];

}
-(UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button.backgroundColor = [UIColor colorWithRed:50/255.0 green:85/255.0 blue:135/255.0 alpha:1];
        [_button setTitle:@"请选择明星" forState:UIControlStateNormal];
    }
    return _button;
}
-(UIImageView *)msakImg
{
    if (!_msakImg)
    {
        _msakImg = [[UIImageView alloc]initWithFrame:CGRectMake(self.button.frame.size.width/2 - 10, self.button.frame.size.height - 17, 20, 15)];
        _msakImg.image = [UIImage imageNamed:@"zhaoyun-71"];
    }
    return _msakImg;
}
-(AndyDropDownList *)list
{
    if (!_list)
    {
        _list = [[AndyDropDownList alloc]initWithListDataSource:self.array rowHeight:44 view:self.button];
        _list.delegate = self;
    }
    return _list;
}
-(void)dropDownListParame:(NSString *)aStr
{
    _button.selected = NO;
    _msakImg.transform = CGAffineTransformRotate(_msakImg.transform, -M_PI);
    [_button setTitle:[NSString stringWithFormat:@"%@",aStr] forState:UIControlStateNormal];
}
-(void)buttonClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected == YES)
    {
        [_list showList];
        _msakImg.transform = CGAffineTransformRotate(_msakImg.transform, M_PI);
    }else
    {
        [_list hiddenList];
        _msakImg.transform = CGAffineTransformRotate(_msakImg.transform, -M_PI);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
