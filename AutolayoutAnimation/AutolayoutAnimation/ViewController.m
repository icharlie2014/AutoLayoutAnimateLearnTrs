//
//  ViewController.m
//  AutolayoutAnimation
//
//  Created by panglong on 16/3/26.
//  Copyright © 2016年 庞龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *originVIew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *originViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *originViewTopCons;

@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resultViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resultViewTopCons;

@property (weak, nonatomic) IBOutlet UIView *upShowView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *upViewHeightCons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultViewTopCons.constant = -self.resultViewHeightCons.constant;
}

- (IBAction)addBtnClicked:(UIButton *)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.originViewTopCons.constant = -self.originViewHeightCons.constant;
        
        self.resultViewTopCons.constant = 0;
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)closeBtnClicked:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.originViewTopCons.constant = 0;
        self.resultViewTopCons.constant = 0;
        self.resultViewTopCons.constant = -self.resultViewHeightCons.constant;
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {

    }];
}

- (IBAction)upBtnClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.upViewHeightCons.constant = 130 + 60;
            self.upShowView.hidden = NO;
            [self.view layoutIfNeeded];
        }];
        
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            self.upViewHeightCons.constant = 60;
            self.upShowView.hidden = YES;
            [self.view layoutIfNeeded];
        }];
    }
    
}

//
- (IBAction)topPanGes:(UIPanGestureRecognizer *)sender {
    
    CGPoint point = [sender translationInView:self.view];
    
    CGPoint speedPoint = [sender velocityInView:self.view];
        
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.resultView.transform = CGAffineTransformTranslate(self.resultView.transform, 0, point.y);
    } completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
