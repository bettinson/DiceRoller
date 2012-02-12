//
//  ViewController.h
//  DiceRoller
//
//  Created by Matt Bettinson on 12-02-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
   IBOutlet UILabel *segmentLabel;
   IBOutlet UITextField *modifier;

}

@property (weak, nonatomic) IBOutlet UIButton *numberState;
@property (strong, nonatomic) IBOutlet UITextField *modifier;
@property (weak, nonatomic) IBOutlet UISegmentedControl *diList;
@property (strong, nonatomic) IBOutlet UILabel *segmentLabel;
-(IBAction)changeModifier:(id)sender;

- (int)addInteger:(NSString *)modInt_ withInteger:(NSString*)title_ andInteger:(NSNumber *)dice_;
    
@end
