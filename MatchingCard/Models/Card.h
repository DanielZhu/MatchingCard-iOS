//
//  Card.h
//  MatchingCard
//
//  Created by MengDan Zhu on 1/17/15.
//  Copyright (c) 2015 Staydan.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *content;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)isMatch:(NSArray *)otherCards;

@end
