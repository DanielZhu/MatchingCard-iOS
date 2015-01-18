//
//  Deck.m
//  MatchingCard
//
//  Created by MengDan Zhu on 1/17/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *newCard = nil;

    if ([self.cards count]) {
        NSUInteger index = arc4random() % [self.cards count];
        
        newCard = [self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return newCard;
}

@end
