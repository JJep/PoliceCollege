//
//	User.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "User.h"

NSString *const kUserHeadimg = @"headimg";
NSString *const kUserName = @"name";
NSString *const kUserNickname = @"nickname";
NSString *const kUserPos = @"pos";

@interface User ()
@end
@implementation User

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserHeadimg] isKindOfClass:[NSNull class]]){
		self.headimg = dictionary[kUserHeadimg];
	}	
	if(![dictionary[kUserName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kUserName];
	}	
	if(![dictionary[kUserNickname] isKindOfClass:[NSNull class]]){
		self.nickname = dictionary[kUserNickname];
	}	
	if(![dictionary[kUserPos] isKindOfClass:[NSNull class]]){
		self.pos = dictionary[kUserPos];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.headimg != nil){
		dictionary[kUserHeadimg] = self.headimg;
	}
	if(self.name != nil){
		dictionary[kUserName] = self.name;
	}
	if(self.nickname != nil){
		dictionary[kUserNickname] = self.nickname;
	}
	if(self.pos != nil){
		dictionary[kUserPos] = self.pos;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.headimg != nil){
		[aCoder encodeObject:self.headimg forKey:kUserHeadimg];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kUserName];
	}
	if(self.nickname != nil){
		[aCoder encodeObject:self.nickname forKey:kUserNickname];
	}
	if(self.pos != nil){
		[aCoder encodeObject:self.pos forKey:kUserPos];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.headimg = [aDecoder decodeObjectForKey:kUserHeadimg];
	self.name = [aDecoder decodeObjectForKey:kUserName];
	self.nickname = [aDecoder decodeObjectForKey:kUserNickname];
	self.pos = [aDecoder decodeObjectForKey:kUserPos];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	User *copy = [User new];

	copy.headimg = [self.headimg copy];
	copy.name = [self.name copy];
	copy.nickname = [self.nickname copy];
	copy.pos = [self.pos copy];

	return copy;
}
@end
