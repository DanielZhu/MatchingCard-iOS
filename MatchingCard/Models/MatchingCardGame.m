//
//  MatchingCardGame.m
//  MatchingCard
//
//  Created by MengDan Zhu on 1/18/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import "MatchingCardGame.h"

@interface MatchingCardGame()

@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation MatchingCardGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BOUNS = 4;
static const int COST_TO_FLIP = 1;

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCards:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    for (int i = 0; i < count; i++) {
        Card *card = [deck drawRandomCard];
        if (card) {
            [self.cards addObject:card];
        } else {
            self = nil;
            break;
        }
    }
    
    return self;
}

- (void)flipCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        card.matched = YES;
                        otherCard.matched = YES;
                        // Plus the score if the cards matched
                        self.score += matchScore * MATCH_BOUNS;
                    } else {
                        card.chosen = NO;
                        otherCard.chosen = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= COST_TO_FLIP;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSInteger)index
{
    return index < [self.cards count] ? [self.cards objectAtIndex:index] : nil;
}

@end
