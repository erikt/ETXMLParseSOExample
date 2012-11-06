//
//  ETLoginInfo.h
//  ETXMLParseSOExample
//
//  Created by Erik Tjernlund on 2012-11-06.
//  Copyright (c) 2012 Erik Tjernlund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETLoginInfo : NSObject

@property (copy,nonatomic) NSString *username;
@property (copy,nonatomic) NSString *country;
@property (copy,nonatomic) NSString *responseStatus;
@property (copy,nonatomic) NSString *responseResult;

@end
