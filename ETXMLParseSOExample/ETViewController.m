//
//  ETViewController.m
//  ETXMLParseSOExample
//
//  Created by Erik Tjernlund on 2012-11-06.
//  Copyright (c) 2012 Erik Tjernlund. All rights reserved.
//

#import "ETViewController.h"
#import "ETLoginInfoXMLParser.h"
#import "ETLoginInfo.h"

@interface ETViewController ()
@property (copy,nonatomic) NSString *xmlResponse;
@end

@interface ETViewController ()

@end

@implementation ETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"login_response" ofType:@"xml"];
    
    if (filePath) {
        self.xmlResponse = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }
}

- (IBAction)parseXML:(id)sender {
    if (self.xmlResponse) {
        ETLoginInfo *loginInfo = [ETLoginInfoXMLParser parseXMLLoginResponse:self.xmlResponse];
        self.usernameLabel.text = loginInfo.username;
        self.countryLabel.text = loginInfo.country;
    }
}


@end
