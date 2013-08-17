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

#import <BridgeKit/JavaObject.h>

@class JavaClass;
@class ParseObject;
@class JavaList;

@class FindCallback;
@class GetCallback;
@class CountCallback;

@interface ParseQuery : JavaObject

//*- Java:  public ParseQuery(Class<T> subclass)
-(id)initWithParseObject:(ParseObject*)object;

//*- Java:  public ParseQuery(String theClassName)
-(id)initWithClassName:(NSString*)theClassName;

//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(String className)
-(ParseQuery*)queryWithClassName:(NSString*)theClassName;

//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(Class<T> subclass)
-(ParseQuery*)queryWithObject:(JavaClass*)object;

//*- Java: public T get(String theObjectId)throws ParseException
-(ParseObject*)get:(NSString*)objectID;
//Constructs a ParseObject whose id is already known by fetching data from the server. This mutates the ParseQuery.

//*- Java: public void getInBackground(String objectId,GetCallback<T> callback)
-(void)getInBackground:(NSString*)objectID callback:(GetCallback*)callback;


//*- Java:  public static <T extends ParseObject> ParseQuery<T> or(List<ParseQuery<T>> queries)
//*- ObjC
//+(ParseQuery*)

//*- Java: public void cancel()
//*- ObjC
-(void)cancel;
//Cancels the current network request (if one is running).

//*- Java: public List<T> find()
-(JavaList*)find;
//Retrieves a list of ParseObjects that satisfy this query. Uses the network and/or the cache, depending on the cache policy.

//*- Java: public T getFirst()
-(ParseObject*)getFirst;
//Retrieves at most one ParseObject that satisfies this query. Uses the network and/or the cache, depending on the cache policy. This mutates the ParseQuery.


//*- Java: public void setCachePolicy(ParseQuery.CachePolicy newCachePolicy)
//-(void)setCachePolicy:(ParseQueryCachePolicy*)newCachePolicy;
//Change the caching policy of this query.

//*- Java: public ParseQuery.CachePolicy getCachePolicy()
//-(ParseQueryCachePolicy*)getCachePolicy;
//Accessor for the caching policy.

//*- Java: public void setMaxCacheAge(long maxAgeInMilliseconds)
//-(void)setMaxCacheAge:(long)maxAgeInMilliseconds;
//Sets the maximum age of cached data that will be considered in this query.


//*- Java: public long getMaxCacheAge()
//-(long)getMaxCacheAge;
//Gets the maximum age of cached data that will be considered in this query. The returned value is in milliseconds


//*- Java: public void findInBackground(FindCallback<T> callback)
-(void)findInBackground:(FindCallback*) callback;
//Retrieves a list of ParseObjects that satisfy this query from the server in a background thread. This is preferable to using find(), unless your code is already running in a background thread.


//*- Java: public void getFirstInBackground(GetCallback<T> callback)
-(void)getFirstInBackground:(GetCallback*) callback;
//Retrieves at most one ParseObject that satisfies this query from the server in a background thread. This is preferable to using getFirst(), unless your code is already running in a background thread. This mutates the ParseQuery.


//*- Java: public int count()throws ParseException
-(int)count;
//Counts the number of objects that match this query. This does not use caching.


//*- Java: protected int count(boolean needsLock)throws ParseException
-(int)count:(bool)needsLock;

//*- Java: public void countInBackground(CountCallback callback)
-(void)countInBackground:(CountCallback*)callback;
//Counts the number of objects that match this query in a background thread. This does not use caching.

//*- Java: public boolean hasCachedResult()
-(BOOL)hasCachedResult;
//Returns whether or not this query has a cached result.


//*- Java: public void clearCachedResult()
-(void)clearCachedResult;
//Removes the previously cached result for this query, forcing the next find() to hit the network. If there is no cached result for this query, then this is a no-op.


//*- Java: public static void clearAllCachedResults()
-(void)clearAllCachedResults;
//Clears the cached result for all queries.


//*- Java: public ParseQuery<T> whereEqualTo(String key,Object value)
-(ParseQuery*)whereEqualTo:(NSString*)key value:(JavaObject*)value;
//Add a constraint to the query that requires a particular key's value to be equal to the provided value.


//*- Java: public ParseQuery<T> whereLessThan(String key,Object value)
-(ParseQuery*)whereLessThan:(NSString*)key value:(JavaObject*)value;
//Add a constraint to the query that requires a particular key's value to be less than the provided value.


//*- Java: public ParseQuery<T> whereNotEqualTo(String key,Object value)
-(ParseQuery*)whereNotEqualTo:(NSString*)key value:(JavaObject*)value;
//Add a constraint to the query that requires a particular key's value to be not equal to the provided value.

//*- Java: public ParseQuery<T> whereGreaterThan(String key,Object value)
-(ParseQuery*)whereGreaterThan:(NSString*)key value:(JavaObject*)value;
//Add a constraint to the query that requires a particular key's value to be greater than the provided value.


//*- Java: public ParseQuery<T> whereLessThanOrEqualTo(String key,Object value)
-(ParseQuery*)whereLessThanOrEqualTo:(NSString*)key value:(JavaObject*)value;
//Add a constraint to the query that requires a particular key's value to be less than or equal to the provided value.


//*- Java: public ParseQuery<T> whereGreaterThanOrEqualTo(String key,Object value)
-(ParseQuery*)whereGreaterThanOrEqualTo:(NSString*)key value:(JavaObject*)value;
//Add a constraint to the query that requires a particular key's value to be greater than or equal to the provided value.


//*- Java: public ParseQuery<T> whereContainedIn(String key,Collection<? extends Object> values)
-(ParseQuery*)whereContainedIn:(NSString*)key value:(JavaList*)values;
//Add a constraint to the query that requires a particular key's value to be contained in the provided list of values.


//*- Java: public ParseQuery<T> whereContainsAll(String key,Collection<?> values)
-(ParseQuery*)whereContainsAll:(NSString*)key value:(JavaList*)values;
//Add a constraint to the query that requires a particular key's value match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects. Add a constraint to the query that requires a particular key's value to contain every one of the provided list of values.


//*- Java: public ParseQuery<T> whereMatchesQuery(String key,ParseQuery<?> query)
-(ParseQuery*)whereMatchesQuery:(NSString*)key query:(ParseQuery*)query;
//Add a constraint to the query that requires a particular key's value match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects.


//*- Java: public ParseQuery<T> whereDoesNotMatchQuery(String key,ParseQuery<?> query)
-(ParseQuery*)whereDoesNotMatchQuery:(NSString*)key query:(ParseQuery*)query;
//Add a constraint to the query that requires a particular key's value does not match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects.


//*- Java: public ParseQuery<T> whereMatchesKeyInQuery(String key,String keyInQuery,ParseQuery<?> query)
-(ParseQuery*)whereMatchesKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery query:(ParseQuery*)query;
//Add a constraint to the query that requires a particular key's value matches a value for a key in the results of another ParseQuery


//*- Java: public ParseQuery<T> whereDoesNotMatchKeyInQuery(String key,String keyInQuery,ParseQuery<?> query)]
-(ParseQuery*)whereDoesNotMatchKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery query:(ParseQuery*)query;
//Add a constraint to the query that requires a particular key's value does not match any value for a key in the results of another ParseQuery.


//*- Java: public ParseQuery<T> whereNotContainedIn(String key,Collection<? extends Object> values)
-(ParseQuery*)whereNotContainedIn:(NSString*)key values:(JavaList*)values;
//Add a constraint to the query that requires a particular key's value not be contained in the provided list of values.


//*- Java: public ParseQuery<T> whereNear(String key,ParseGeoPoint point)
//dd a proximity based constraint for finding objects with key point values near the point given.

//*- Java: public ParseQuery<T> whereWithinMiles(String key,ParseGeoPoint point,double maxDistance)
//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given. Radius of earth used is 3958.8 miles.


//*- Java: public ParseQuery<T> whereWithinKilometers(String key,ParseGeoPoint point,double maxDistance)
//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given. Radius of earth used is 6371.0 kilometers.


//*- Java: public ParseQuery<T> whereWithinRadians(String key,ParseGeoPoint point,double maxDistance)
//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given.


//*- Java: public ParseQuery<T> whereWithinGeoBox(String key,ParseGeoPoint southwest,ParseGeoPoint northeast)
//Add a constraint to the query that requires a particular key's coordinates be contained within a given rectangular geographic bounding box.

//*- Java: public ParseQuery<T> whereMatches(String key,String regex)
//Add a regular expression constraint for finding string values that match the provided regular expression. This may be slow for large datasets.

//*- Java: public ParseQuery<T> whereMatches(String key,String regex,String modifiers)
//Add a regular expression constraint for finding string values that match the provided regular expression. This may be slow for large datasets.

//*- Java: public ParseQuery<T> whereContains(String key,String substring)
//Add a constraint for finding string values that contain a provided string. This will be slow for large datasets.


//*- Java: public ParseQuery<T> whereStartsWith(String key,String prefix)
//Add a constraint for finding string values that start with a provided string. This query will use the backend index, so it will be fast even for large datasets.

//*- Java: public ParseQuery<T> whereEndsWith(String key,String suffix)
//Add a constraint for finding string values that end with a provided string. This will be slow for large datasets.


//*- Java: public void include(String key)
//Include nested ParseObjects for the provided key. You can use dot notation to specify which fields in the included object that are also fetched.

//*- Java: public void selectKeys(Collection<String> keys)
//Restrict the fields of returned ParseObjects to only include the provided keys. If this is called multiple times, then all of the keys specified in each of the calls will be included.


//*- Java: public ParseQuery<T> whereExists(String key)
//Add a constraint for finding objects that contain the given key.

//*- Java: public ParseQuery<T> whereDoesNotExist(String key)
//Add a constraint for finding objects that do not contain a given key.


//*- Java: public ParseQuery<T> orderByAscending(String key)
//Sorts the results in ascending order by the given key.


//*- Java: public ParseQuery<T> addAscendingOrder(String key)
//Also sorts the results in ascending order by the given key. The previous sort keys have precedence over this key.


//*- Java: public ParseQuery<T> orderByDescending(String key)
//Sorts the results in descending order by the given key.
-(ParseQuery*)orderByDescending:(NSString*)key;

//*- Java: public ParseQuery<T> addDescendingOrder(String key)
-(ParseQuery*)addDescendingOrder:(NSString*)key;
//Also sorts the results in descending order by the given key. The previous sort keys have precedence over this key.

//*- Java: public void setLimit(int newLimit)
-(void)setLimit:(int)newLimit;
//Controls the maximum number of results that are returned. Setting a negative limit denotes retrieval without a limit. The default limit is 100, with a maximum of 1000 results being returned at a time.


//*- Java: public void setTrace(boolean shouldTrace)
//Turn on performance tracing of finds. If performance tracing is already turned on this does nothing. In general you don't need to call trace.

//*- Java: public int getLimit()
-(int)getLimit;
//Accessor for the limit.


//*- Java: public void setSkip(int newSkip)
//Controls the number of results to skip before returning any results. This is useful for pagination. Default is to skip zero results.

//*- Java: public int getSkip()
//Accessor for the skip value.


//*- Java: public String getClassName()
//Accessor for the class name.
@end
