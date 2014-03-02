//
//  CardMatchingGame.m
//  Test_1b
//
//  Created by Samuel Tolkin on 3/1/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "CardMatchingGame.h"
#import "CardMatchingGame.h"
#import "Card.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
        return _cards;
}

-(id)initWithCardCount:(NSUInteger)cardCount
usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i=0; i<cardCount; i++) {
            Card *card = [deck drawRandomCard];
            
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    self.score = 0;
    return self;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2



-(void)flipCardAtIndex:(NSUInteger)index
{

    Card *card = [self cardAtIndex:index];
    

    if (!card.isUnplayable)
	{
        if (!card.isFaceUp)
		{
            self.score--;
			for (Card *otherCard in self.cards)
			{
				if (otherCard.isFaceUp && !otherCard.isUnplayable)
				{
					int matchScore = [card match:@[otherCard]];
					
					if (matchScore)
					{
						otherCard.unplayable = YES;
						card.unplayable = YES;
						self.score += matchScore * MATCH_BONUS;
					}
					else
					{
						otherCard.faceUp = NO;
						self.score -= MISMATCH_PENALTY;
					}
				}
			}
            
        }
    }
	
	
    card.faceUp = !card.isFaceUp;
    
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

@end
