//
//  ViewController.m
//  MatchingCard
//
//  Created by MengDan Zhu on 1/17/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flippedLabel;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (nonatomic) NSUInteger count;
- (IBAction)FlipCard:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.count = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)FlipCard:(id)sender {
    
    if ([[sender currentTitle] length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"Apple_logo"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:nil forState:UIControlStateNormal];
        [sender setTitle:@"A♦︎" forState:UIControlStateNormal];
    }
    
    self.count++;
    [self.flippedLabel setText:[NSString stringWithFormat:@"Flipped: %d", self.count]];
    
}

@end
