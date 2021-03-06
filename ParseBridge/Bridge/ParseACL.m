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

#import "ParseACL.h"
#import "ParseRole.h"
#import "ParseUser.h"

@implementation ParseACL


+ (void)initializeJava
{
    [super initializeJava];
    
    //Constructors
    //*- Java:  ParseACL()
    //Creates an ACL with no permissions granted.
    [ParseACL registerConstructor];
        
    //*- Java:  ParseACL(ParseUser owner)
    //*- ObjC:  -(id)initWithUser:(ParseUser*)owner;
    //Creates an ACL where only the provided user has access.
    [ParseACL registerConstructorWithSelector:@selector(initWithUser:)
                                                arguments:[ParseUser className], nil];
    
    
    //Methods
    
    //*- Java:  public void setPublicReadAccess(boolean allowed)
    //*- ObjC:  -(void)setPublicReadAccess:(bool)allowed;
    //Set whether the public is allowed to read this object.
    [ParseACL registerInstanceMethod:@"setPublicReadAccess"
                                        selector:@selector(setPublicReadAccess:)
                                     returnValue:nil
                                       arguments:[JavaClass boolPrimitive],nil];
    
    
    //*- Java:  public boolean getPublicReadAccess()
    //*- ObjC:  -(bool)getPublicReadAccess;
    //Get whether the public is allowed to read this object.
    [ParseACL registerInstanceMethod:@"getPublicReadAccess"
                                        selector:@selector(getPublicReadAccess)
                                     returnValue:[JavaClass boolPrimitive]
                                       arguments:nil];
    
    
    //*- Java:  public void setPublicWriteAccess(boolean allowed)
    //*- ObjC: -(void)setPublicWriteAccess:(bool)allowed;
    //Set whether the public is allowed to write this object.
    [ParseACL registerInstanceMethod:@"setPublicWriteAccess"
                                        selector:@selector(setPublicWriteAccess:)
                                     returnValue:nil
                                       arguments:[JavaClass boolPrimitive],nil];
    
    
    //*- Java:  public boolean getPublicWriteAccess()
    //*- ObjC: -(bool)getPublicWriteAccess;
    //Set whether the public is allowed to write this object.
    [ParseACL registerInstanceMethod:@"getPublicWriteAccess"
                                     selector:@selector(getPublicWriteAccess)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:nil];
    
    
    //*- Java:  public void setReadAccess(String userId,boolean allowed)
    //*- ObjC: -(void)setReadAccessForUserId:(NSString*)userId allowed:(bool)allowed;
    //Set whether the given user id is allowed to read this object.
    [ParseACL registerInstanceMethod:@"setReadAccess"
                                     selector:@selector(setReadAccessForUserId:allowed:)
                                  returnValue:nil
                                    arguments:[NSString className], [JavaClass boolPrimitive], nil];
    
    
    //*- Java:  public boolean getReadAccess(String userId)
    //*- ObjC: -(bool)getReadAccessForUserId:(NSString*)userId;
    //Get whether the given user id is *explicitly* allowed to read this object. Even if this returns false, the user may still be able to access it if getPublicReadAccess returns true or a role that the user belongs to has read access.
    [ParseACL registerInstanceMethod:@"getReadAccess"
                                     selector:@selector(getReadAccessForUserId:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[NSString className], nil];
    
    
    //*- Java:  public void setWriteAccess(String userId,boolean allowed)
    //*- ObjC:  -(void)setWriteAccessForUserId:(NSString*)userId allowed:(bool)allowed;
    //Set whether the given user id is allowed to write this object.
    [ParseACL registerInstanceMethod:@"setWriteAccess"
                                     selector:@selector(setWriteAccessForUserId:allowed:)
                                  returnValue:nil
                                    arguments:[NSString className], [JavaClass boolPrimitive], nil];
    
    
    //*- Java:  public boolean getWriteAccess(String userId)
    //*- ObjC: -(bool)getWriteAccessForUserId:(NSString*)userId;
    //Get whether the given user id is *explicitly* allowed to write this object. Even if this returns false, the user may still be able to write it if getPublicWriteAccess returns true or a role that the user belongs to has write access.
    [ParseACL registerInstanceMethod:@"getWriteAccess"
                                     selector:@selector(getWriteAccessForUserId:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[NSString className], nil];
    
    
    //*- Java:  public void setReadAccess(ParseUser user,boolean allowed)
    //*- ObjC: -(void)setReadAccessForUser:(ParseUser*)user allowed:(bool)allowed;
    //Set whether the given user is allowed to read this object.
    [ParseACL registerInstanceMethod:@"setReadAccess"
                                     selector:@selector(setReadAccessForUser:allowed:)
                                  returnValue:nil
                                    arguments:[ParseUser className], [JavaClass boolPrimitive], nil];
    
    
    //*- Java:  public boolean getReadAccess(ParseUser user)
    //*- ObjC: -(bool)getReadAccessForUser:(ParseUser*)user;
    //Get whether the given user id is *explicitly* allowed to read this object. Even if this returns false, the user may still be able to access it if getPublicReadAccess returns true or a role that the user belongs to has read access.
    [ParseACL registerInstanceMethod:@"getReadAccess"
                                     selector:@selector(getReadAccessForUser:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[ParseUser className], nil];
    
    
    //*- Java:  public void setWriteAccess(ParseUser user,boolean allowed)
    //*- ObjC: -(void)setWriteAccessForUser:(ParseUser*)user allowed:(bool)allowed;
    //Set whether the given user is allowed to write this object.
    [ParseACL registerInstanceMethod:@"setWriteAccess"
                                     selector:@selector(setWriteAccessForUser:allowed:)
                                  returnValue:nil
                                    arguments:[ParseUser className],[JavaClass boolPrimitive], nil];
    
    //*- Java:  public boolean getWriteAccess(ParseUser user)
    //*- ObjC: -(bool)getWriteAccessForUser:(ParseUser*)user;
    //Get whether the given user id is *explicitly* allowed to write this object. Even if this returns false, the user may still be able to write it if getPublicWriteAccess returns true or a role that the user belongs to has write access.
    [ParseACL registerInstanceMethod:@"getWriteAccess"
                                     selector:@selector(getWriteAccessForUser:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[ParseUser className], nil];
    
    
    //*- Java:  public boolean getRoleReadAccess(String roleName)
    //*- ObjC: -(bool)getRoleReadAccess:(NSString*)roleName;
    //Get whether users belonging to the role with the given roleName are allowed to read this object. Even if this returns false, the role may still be able to read it if a parent role has read access.
    [ParseACL registerInstanceMethod:@"getRoleReadAccess"
                                     selector:@selector(getRoleReadAccess:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[NSString className], nil];
    
    
    //*- Java:  public void setRoleReadAccess(String roleName,boolean allowed)
    //*- ObjC: -(void)setRoleReadAccessWithRoleName:(NSString*)roleName allowed:(bool)allowed;
    //Set whether users belonging to the role with the given roleName are allowed to read this object.
    [ParseACL registerInstanceMethod:@"setRoleReadAccess"
                                     selector:@selector(setRoleReadAccessWithRoleName:allowed:)
                                  returnValue:nil
                                    arguments:[NSString className], [JavaClass boolPrimitive], nil];
    
    
    //*- Java:  public boolean getRoleWriteAccess(String roleName)
    //*- ObjC: -(bool)getRoleWriteAccessWithRoleName:(NSString*)roleName;
    //Get whether users belonging to the role with the given roleName are allowed to write this object. Even if this returns false, the role may still be able to write it if a parent role has write access.
    [ParseACL registerInstanceMethod:@"getRoleWriteAccess"
                                     selector:@selector(getRoleWriteAccessWithRoleName:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[NSString className], nil];
    
    
    //*- Java:  public void setRoleWriteAccess(String roleName,boolean allowed)
    //*- ObjC: -(void)setRoleWriteAccessWithRoleName:(NSString*)roleName allowed:(bool)allowed;
    //Set whether users belonging to the role with the given roleName are allowed to write this object.
    [ParseACL registerInstanceMethod:@"setRoleWriteAccess"
                                     selector:@selector(setRoleWriteAccessWithRoleName:allowed:)
                                  returnValue:nil
                                    arguments:[NSString className],[JavaClass boolPrimitive], nil];
    
    
    //*- Java:  public boolean getRoleReadAccess(ParseRole role)
    //*- ObjC: -(bool)getRoleReadAccessWithRole:(ParseRole*) role;
    //Get whether users belonging to the given role are allowed to read this object. Even if this returns false, the role may still be able to read it if a parent role has read access. The role must already be saved on the server and its data must have been fetched in order to use this method.
    [ParseACL registerInstanceMethod:@"getRoleReadAccess"
                                     selector:@selector(getRoleReadAccessWithRole:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[ParseRole className], nil];
    
    
    //*- Java: public void setRoleReadAccess(ParseRole role,boolean allowed)
    //*- ObjC: -(void)setRoleReadAccessWithRole:(ParseRole*)role allowed:(bool)allowed;
    //Set whether users belonging to the given role are allowed to read this object. The role must already be saved on the server and its data must have been fetched in order to use this method.
    [ParseACL registerInstanceMethod:@"setRoleReadAccess"
                                     selector:@selector(setRoleReadAccessWithRole:allowed:)
                                  returnValue:nil
                                    arguments:[ParseRole className],[JavaClass boolPrimitive], nil];
    
    
    
    //*- Java:  public boolean getRoleWriteAccess(ParseRole role)
    //*- ObjC: -(bool)getRoleWriteAccessWithRole:(ParseRole*)role;
    //Get whether users belonging to the given role are allowed to write this object. Even if this returns false, the role may still be able to write it if a parent role has write access. The role must already be saved on the server and its data must have been fetched in order to use this method.
    [ParseACL registerInstanceMethod:@"getRoleWriteAccess"
                                     selector:@selector(getRoleWriteAccessWithRole:)
                                  returnValue:[JavaClass boolPrimitive]
                                    arguments:[ParseRole className], nil];
    
    //*- Java:  public void setRoleWriteAccess(ParseRole role,boolean allowed)
    //*- ObjC: -(void)setRoleWriteAccessWithRole:(ParseRole*)role allowed:(bool)allowed;
    //Set whether users belonging to the given role are allowed to write this object. The role must already be saved on the server and its data must have been fetched in order to use this method.
    [ParseACL registerInstanceMethod:@"setRoleWriteAccess"
                                     selector:@selector(setRoleWriteAccessWithRole:allowed:)
                                  returnValue:nil
                                    arguments:[ParseRole className],[JavaClass boolPrimitive], nil];
    
    
    //*- Java:  public static void setDefaultACL(ParseACL acl,boolean withAccessForCurrentUser)
    //*- ObjC: +(void)setDefaultACL:(ParseACL*)acl currentUserAccess:(bool)currentUserAccess;
    //Sets a default ACL that will be applied to all ParseObjects when they are created.
    [ParseACL registerStaticMethod:@"setDefaultACL"
                                      selector:@selector(setDefaultACL:currentUserAccess:)
                                   returnValue:nil
                                     arguments:[ParseACL className],[JavaClass boolPrimitive], nil];
}

 
+ (NSString *)className
{
    return @"com.parse.ParseACL";
}

 
@end
