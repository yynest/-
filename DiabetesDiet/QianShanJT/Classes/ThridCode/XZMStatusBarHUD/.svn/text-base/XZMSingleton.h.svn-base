
#import <Foundation/Foundation.h>

#define XZMSingletonH(name) + (instancetype)shared##name;

#define XZMSingletonM(name)\
static id _instance;\
/** 重写alloc方法让其只会分配一次内存 */\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    \
    return _instance;\
}\
\
/** 提供创建单例的类方法 */\
+ (instancetype)shared##name\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc] init];\
    });\
    return _instance;\
}\
\
/** copy也返回一个对象 */\
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com