//
//  PlayingCard.h
//  MatchingCard
//
//  Created by MengDan Zhu on 1/17/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

// The type of the card
@property (strong, nonatomic) NSString *suit;

// The number of the card
@property (nonatomic) NSUInteger rank;

@end
