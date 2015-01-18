//
//  Deck.h
//  MatchingCard
//
//  Created by MengDan Zhu on 1/17/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
