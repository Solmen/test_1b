//
//  Card.h
//  Test_1b
//
//  Created by Samuel Tolkin on 2/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

-(int)match:(NSArray *)otherCards;

@end
