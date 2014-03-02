//
//  CardMatchingGame.h
//  Test_1b
//
//  Created by Samuel Tolkin on 3/1/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;


-(void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end