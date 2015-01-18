//
//  MatchingCardGame.h
//  MatchingCard
//
//  Created by MengDan Zhu on 1/18/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface MatchingCardGame : NSObject

- (instancetype)initWithCards:(NSUInteger)count
            usingDeck:(Deck *)deck;
- (void)flipCardAtIndex:(NSInteger)index;

- (Card *)cardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
