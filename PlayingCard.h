//
//  PlayingCard.h
//  Test_1b
//
//  Created by Samuel Tolkin on 2/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end