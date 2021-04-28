//
//  XercesWrapper.h
//  XercesFromSwift
//
//  Created by Stefan Springer on 06.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XercesWrapper : NSObject
@property (nonatomic) void* parseConsumer;
@property (nonatomic) void(*startElement)(void*,void*,int);
-(int) parse:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
