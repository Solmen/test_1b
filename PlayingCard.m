//
//  PlayingCard.m
//  Test_1b
//
//  Created by Samuel Tolkin on 2/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit; // because we provide both a setter AND a getter

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    int suitMatchCount = 0;
    int rankMatchCount = 0;
    
	
    if (otherCards.count <= 1)
	{
        PlayingCard *otherCard = [otherCards lastObject];
		if ([otherCard isKindOfClass:[PlayingCard class]])
		{
			if ([otherCard.suit isEqualToString:self.suit])
			{
				score = 1;
			}
			else if (otherCard.rank == self.rank)
			{
				score = 4;
			}
		}
    }
	else
	{
        for (PlayingCard *otherCard in otherCards)
		{
            if ([otherCard.suit isEqualToString:self.suit])
			{
                suitMatchCount++;
            }
			else if (otherCard.rank == self.rank)
			{
                rankMatchCount ++;
            }
        }
        
        if (suitMatchCount == otherCards.count)
		{
            score = 3;
        }
		else if (rankMatchCount == otherCards.count)
		{
            score = 12;
        }
    }
    
    return score;
}

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits
{
    return @[@"♠",@"♣",@"♥",@"♦"];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?"; // return "?" if _suit is nil
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
