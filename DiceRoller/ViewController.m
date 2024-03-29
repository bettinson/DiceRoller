//
//  ViewController.m
//  DiceRoller
//
//  Created by Matt Bettinson on 12-02-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize diceTwo;
@synthesize diceOne;
@synthesize diceNumber;
@synthesize numberState;
@synthesize modifier;
@synthesize diList;
@synthesize segmentLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)setSegmentIndexToLabel:(id)sender{

}

- (void)viewDidLoad
{
    self.segmentLabel.text = nil;
    self.diceOne.text = nil;
    self.diceTwo.text = nil;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)changeModifier:(id)sender{
    NSString *title = [(UIButton *)sender currentTitle];
    title = [NSString stringWithString:title];
    
    if ([title isEqualToString:@"+"])
        [(UIButton *)sender setTitle:@"-" forState:UIControlStateNormal];
    else
        [(UIButton *)sender setTitle:@"+" forState:UIControlStateNormal];
}

- (IBAction)rollButton:(id)sender{  
    NSString *title = [numberState currentTitle];
    
    NSString *modString = self.modifier.text; 
    NSNumber *d4 = [NSNumber numberWithInt:0];
    NSNumber *d6 = [NSNumber numberWithInt:1];
    NSNumber *d8 = [NSNumber numberWithInt:2];
    NSNumber *d10 = [NSNumber numberWithInt:3];
    NSNumber *d12 = [NSNumber numberWithInt:4];
    NSNumber *d20 = [NSNumber numberWithInt:5];
    
    // Checks what the UISegment index is and then returns the value of the roll to the label.
    NSInteger segment = [diceNumber selectedSegmentIndex];
    diceNo = segment;
    if (diceNo == 0){
    if (modString > 0){
        diceOne.text = nil;
        diceTwo.text = nil;
        switch (self.diList.selectedSegmentIndex) {
            case 0:
                self.segmentLabel.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d4]];
                    break;
            case 1:
                self.segmentLabel.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d6]];                break;
            case 2:
                self.segmentLabel.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d8]];                break;
            case 3:
                self.segmentLabel.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d10]];                break;
            case 4:
                self.segmentLabel.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d12]];                break;
            case 5:
                self.segmentLabel.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d20]];                break;
            default:
                break;
        }        
        }
    } else{
        self.segmentLabel.text = nil;
        switch (self.diList.selectedSegmentIndex) {
            case 0:
                self.diceOne.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d4]];
                self.diceTwo.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d4]];
                break;
            case 1:
                self.diceOne.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d6]];
                self.diceTwo.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d6]];
                break;
            case 2:
                self.diceOne.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d8]];
                self.diceTwo.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d8]];
                break;
            case 3:
                self.diceOne.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d10]];
                self.diceTwo.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d10]];
                break;
            case 4:
                self.diceOne.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d12]];
                self.diceTwo.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d12]];
                break;
            case 5:
                self.diceOne.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d20]];
                self.diceTwo.text = [NSString stringWithFormat:@"Roll: %i", [self addInteger:modString withInteger:title andInteger:d20]];
                break;
            default:
                break;
        }        
    }
    }
//Function for adding the integer
- (int)addInteger:(NSString *)modInt_ withInteger:(NSString*)title_ andInteger:(NSNumber *)dice_{           
    NSNumber *d4 = [NSNumber numberWithInt:(arc4random() % 4) + 1];
    NSNumber *d6 = [NSNumber numberWithInt:(arc4random() % 6) + 1];
    NSNumber *d8 = [NSNumber numberWithInt:(arc4random() % 8) + 1];
    NSNumber *d10 = [NSNumber numberWithInt:(arc4random() % 10) + 1];
    NSNumber *d12 = [NSNumber numberWithInt:(arc4random() % 12) + 1];
    NSNumber *d20 = [NSNumber numberWithInt:(arc4random() % 20) + 1];
    switch ([dice_ integerValue]) {
        case 0:
            dice_ = d4;
            break;
        case 1:
            dice_ = d6;
            break;
        case 2:
            dice_ = d8;
            break;
        case 3:
            dice_= d10;
            break;
        case 4:
            dice_ = d12;
            break;
        case 5:
            dice_ = d20;
            break;
        default:
            
            break;
    }
    if ([title_ isEqualToString:@"+"])
        return modInt_.intValue + dice_.intValue;
    else
        return dice_.intValue - modInt_.intValue;
}


- (void)viewDidUnload
{
    [self setModifier:nil];
    modifier = nil;
    diList = nil;
    [self setDiList:nil];
    modifier = nil;
    [self setSegmentLabel:nil];
    [self setNumberState:nil];
    diceNumber = nil;
    [self setDiceNumber:nil];
    [self setDiceNumber:nil];
    [self setDiceNumber:nil];
    [self setDiceOne:nil];
    [self setDiceTwo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
	return YES;
    } else {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
}

@end
