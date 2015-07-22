//
//  ViewController.m
//  StarFields
//
//  Created by Nguyen Minh Khue on 7/22/15.
//  Copyright (c) 2015 Nguyen Minh Khue. All rights reserved.
//

#import "ViewController.h"

static const CGFloat deltaX = 100;
static const CGFloat deltaY = 100;

@interface ViewController ()
{
    UIImageView *red;
    UIImageView *violet;
    UIImageView *brown;
    UIImageView *green;
    CGPoint center;
    CGSize size;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout =  UIRectEdgeAll;
    size =  self.view.bounds.size;
    center = CGPointMake(size.width * 0.5, (size.height - 60) * 0.5);
    
    red =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    violet =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    brown =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown"]];
    green =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    
    [self vitri];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    
    [self Animate];
}

- (void) Animate{
    [UIView animateWithDuration:1.0 animations:^{
        brown.center = CGPointMake(center.x - deltaX, center.y - deltaY);
        
        red.center = CGPointMake(center.x + deltaX, center.y + deltaY);
        
        green.center= CGPointMake(center.x + deltaX, center.y - deltaY);

        violet.center= CGPointMake(center.x - deltaX, center.y + deltaY);

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            brown.center = CGPointMake(center.x - deltaX, center.y);
            
            red.center = CGPointMake(center.x, center.y - deltaY);
            
            green.center= CGPointMake(center.x + deltaX, center.y);
            
            violet.center= CGPointMake(center.x, center.y + deltaY);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3.0 animations:^{
                [self vitri];
            }completion:^(BOOL finished){
                [self Animate];
            }];
        }];
        
    }];
}

- (void) vitri{
    red.center =center;
    violet.center=center;
    brown.center = center;
    green.center = center;
}

@end
