//
//  ETLoginInfoXMLParser.h
//  ETXMLParseSOExample
//
//  Created by Erik Tjernlund on 2012-11-06.
//  Copyright (c) 2012 Erik Tjernlund. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ETLoginInfo;
@interface ETLoginInfoXMLParser : NSObject<NSXMLParserDelegate>

+(ETLoginInfo *)parseXMLLoginResponse:(NSString *)xml;


@end
