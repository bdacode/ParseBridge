/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron & Matt Hudson
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

#import "ParseAnalytics.h"
#import <BridgeKit/AndroidIntent.h>

@implementation ParseAnalytics

+ (void)initializeJava
{
    [super initializeJava];

    //Constructor
    //*- Java:  public ParseAnalytics()
    [ParseAnalytics registerConstructor];

    //*- Java:  public static void trackAppOpened(Intent intent)
    //*- Objective C:  +(void)trackAppOpenedWithLaunchOptions:(NSDictionary *)launchOptions
    /*-- Tracks this application being launched (and if this happened as the result of the user opening a push notification, this method sends along information to correlate this open with that push).  Parameters: intent - The Intent that started an Activity, if any. Can be null.*/
    [ParseAnalytics registerStaticMethod:@"trackAppOpened"
                   selector:@selector(trackAppOpened:)
                returnValue:nil
                  arguments:[AndroidIntent className], nil];

    [ParseAnalytics registerStaticMethod:@"trackEvent"
                            selector:@selector(trackEvent:)
                         returnValue:nil
                           arguments:[NSString className], nil];

    [ParseAnalytics registerStaticMethod:@"trackEvent"
                            selector:@selector(trackEvent:dimensions:)
                         returnValue:nil
                           arguments:[NSString className], @"java.util.Map", nil]; 
}

+ (NSString *)className
{
    return @"com.parse.ParseAnalytics";
}


@end
