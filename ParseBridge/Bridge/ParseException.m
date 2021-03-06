/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "ParseException.h"
#import <BridgeKit/JavaNumbers.h>
#import <BridgeKit/JavaClass.h>
#import <BridgeKit/JavaThrowable.h>

@implementation ParseException


+(void)initializeJava
{
    [super initializeJava];
	//Constructors
	//*- Java: ParseException(int theCode, String theMessage)
	//*- Objective C: 	-(id)initParseExceptionWithCode:(int)errorcode message:(NSString*)message;
	//Construct a new ParseException with a particular error code.
	[ParseException registerConstructorWithSelector:@selector(initParseExceptionWithCode:message:)
													arguments:[JavaClass intPrimitive], [NSString className], nil];
	
	//*- Java:ParseException(String message, Throwable cause)
	//*- Objective C:  -(id)initParseExceptionWithMessageandCause:(NSString*)message throwable:(JavaThrowable*)throwable;

	[ParseException registerConstructorWithSelector:@selector(initParseExceptionWithMessageandCause:throwable:)
													arguments:[NSString className], [JavaThrowable className], nil];
	//*- Objective C:

	//Construct a new ParseException with an external cause.
	
	//*- Java:ParseException(Throwable cause)
	//*- Objective C:  -(id)initParseExceptionWithCause:(JavaThrowable*)throwable;
	[ParseException registerConstructorWithSelector:@selector(initParseExceptionWithCause:)
													arguments:[JavaThrowable className], nil];
	//Construct a new ParseException with an external cause.
	
	//Methods
	//*- Java:int getCode()
	//*- Objective C:  -(int)getCode;
	//Access the code for this error.
	[ParseException registerInstanceMethod:@"getCode"
							 selector:@selector(getCode)
						  returnValue:[JavaClass intPrimitive]
							arguments:nil];
		
	
	
	

	
 
}

+(NSString *)className
{
    return @"com.parse.ParseException";
}

 
@end
