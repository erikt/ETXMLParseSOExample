//
//  ETLoginInfoXMLParser.m
//  ETXMLParseSOExample
//
//  Created by Erik Tjernlund on 2012-11-06.
//  Copyright (c) 2012 Erik Tjernlund. All rights reserved.
//

#import "ETLoginInfoXMLParser.h"
#import "ETLoginInfo.h"

@interface ETLoginInfoXMLParser ()
@property (strong,nonatomic) NSMutableString *currentElementValue;
@property (strong,nonatomic) ETLoginInfo *loginInfo;
@end

@implementation ETLoginInfoXMLParser

+(ETLoginInfo *)parseXMLLoginResponse:(NSString *)xml {
    ETLoginInfoXMLParser *loginInfoParser = [[ETLoginInfoXMLParser alloc] init];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
    [xmlParser setDelegate:loginInfoParser];
    BOOL success = [xmlParser parse];
    
    if (success) {
        return loginInfoParser.loginInfo;
    } else {
		NSLog(@"Error parsing login information");
        return nil;
    }
}

/**
 * Example of XML document to be parsed:
 *  <login>
 *    <response status="success" result="correct"/>
 *    <data>
 *      <username>testusername</username>
 *      <country>Germany</country>
 *    </data>
 *  </login>
 */
 
#pragma mark - NSXMLParserDelegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"login"]) {
        if (!self.loginInfo) {
            self.loginInfo = [[ETLoginInfo alloc] init];
        }
        return;
    }
    
    if ([elementName isEqualToString:@"response"]) {
        self.loginInfo.responseStatus = [attributeDict objectForKey:@"status"];
        self.loginInfo.responseResult = [attributeDict objectForKey:@"result"];
    }

}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (!self.currentElementValue) {
		self.currentElementValue = [[NSMutableString alloc] initWithString:string];
	} else {
		[self.currentElementValue appendString:string];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"username"]) {
        NSString *trimmedValue = [self.currentElementValue stringByTrimmingCharactersInSet:
								  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.loginInfo.username = trimmedValue;
    }
    
    if ([elementName isEqualToString:@"country"]) {
        NSString *trimmedValue = [self.currentElementValue stringByTrimmingCharactersInSet:
								  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.loginInfo.country = trimmedValue;
    }
    
	self.currentElementValue = nil;
}


@end
