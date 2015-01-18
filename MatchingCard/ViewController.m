//
//  ViewController.m
//  MatchingCard
//
//  Created by MengDan Zhu on 1/17/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "MatchingCardGame.h"

@interface ViewController ()

- (IBAction)flipCard:(id)sender;

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) MatchingCardGame *game;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (MatchingCardGame *)game
{
    if (!_game) _game = [[MatchingCardGame alloc] initWithCards:[self.cardButtons count] usingDeck:self.createDeck];
    return _game;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)flipCard:(id)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *button in self.cardButtons) {
        NSInteger cardIndex = [self.cardButtons indexOfObject:button];
        Card *card = [self.game cardAtIndex:cardIndex];
        [button setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        [button setEnabled:!card.isMatched];
    }
    
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? nil : @"Card_back_mayday"];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.content : @"";
}

@end
