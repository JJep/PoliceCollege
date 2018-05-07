#import <UIKit/UIKit.h>

@interface User : NSObject

@property (nonatomic, strong) NSString * headimg;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * pos;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
