//
//  PlayingCardDeck.m
//  MatchingCard
//
//  Created by MengDan Zhu on 1/18/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card atTop:NO];
            }
        }
    }
    
    return self;
}

@end
