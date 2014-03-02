//
//  Deck.h
//  Test_1b
//
//  Created by Samuel Tolkin on 2/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(Card *)drawRandomCard;

@end