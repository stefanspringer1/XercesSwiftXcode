//
//  XercesWrapper.m
//  XercesFromSwift
//
//  Created by Stefan Springer on 06.04.21.
//


#import "XercesWrapper.h"
#import "XercesSwift.hpp"

#include <iostream>

@implementation XercesWrapper
- (int) parse:(NSString*)path {
    XercesSwift xerces;
    const char* cpath = [path UTF8String];
    int message = xerces.parse((char*)cpath, _parseConsumer, _startElement);
    return message;
}
@end
