//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Simon Fenton on 24/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

@synthesize operand;

- (void)performWaitingOperation
{
	if ([@"+" isEqual:waitingOperation]) {
		operand = waitingOperand + operand;
	} else if ([@"-" isEqual:waitingOperation]) {
		operand = waitingOperand - operand;
	} else if ([@"*" isEqual:waitingOperation]) {
		operand = waitingOperand * operand;
	} else if ([@"/" isEqual:waitingOperation]) {
		if (operand) {
			operand = waitingOperand / operand;
		}
	}
}

- (double)performOperation:(NSString *)operation
{
	if ([operation isEqual:@"sqrt"]) {
		operand = sqrt(operand);
	} else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
	}
		 
	return operand;
}

@end
