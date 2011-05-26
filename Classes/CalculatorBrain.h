//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Simon Fenton on 24/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
@private
	double operand;
	NSString *waitingOperation;
	double waitingOperand;
}

@property double operand;

- (double)performOperation:(NSString *)operation;

@end
