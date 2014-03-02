//
//  Test_1bViewController.m
//  Test_1b
//
//  Created by Samuel Tolkin on 2/28/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "Test_1bViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface Test_1bViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@end

@implementation Test_1bViewController


-(CardMatchingGame *)game
{
    if (!_game) {
		_game = [self newGame];
    }
    
    return _game;
}


- (CardMatchingGame *)newGame
{
	
	CardMatchingGame *game;
    
    game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                             usingDeck:[[PlayingCardDeck alloc] init]];
	
	return game;
}


-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
}


-(void)updateUI
{
	UIImage *cardBackImage = [UIImage imageNamed:@"muhback.png"];
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
		[cardButton setImage:card.isFaceUp ? nil : cardBackImage forState:UIControlStateNormal];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

-(IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

@end