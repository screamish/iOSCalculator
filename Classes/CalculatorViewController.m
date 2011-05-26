//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Simon Fenton on 24/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()
@property (readonly) CalculatorBrain *brain;
@end


@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
	if (!brain) {
		brain = [[CalculatorBrain alloc] init];
	}
	return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
	// NSString *digit = [[sender titleLabel] text];
	// redo the above using dot notation
	NSString *digit = sender.titleLabel.text;
	if (userIsInTheMiddleOfTypingANumber) {
		[display setText:[[display text] stringByAppendingString:digit]];
	} else {
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;
	}

}

- (IBAction)operationPressed:(UIButton *)sender
{
	if (userIsInTheMiddleOfTypingANumber) {
		// [[self brain] setOperand:[[display text] doubleValue]];
		// redo the above with dot notation
		self.brain.operand = [display.text doubleValue];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText:[NSString stringWithFormat:@"%g", result]];
}

- (IBAction)clear
{
	userIsInTheMiddleOfTypingANumber = NO;
	// [[self brain] setOperand:(double)0];
	// redo the above with dot notation
	self.brain.operand = (double)0;
	[display setText:@"0"];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
