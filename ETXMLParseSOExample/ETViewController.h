//
//  ETViewController.h
//  ETXMLParseSOExample
//
//  Created by Erik Tjernlund on 2012-11-06.
//  Copyright (c) 2012 Erik Tjernlund. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETViewController : UIViewController

@property (weak,nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak,nonatomic) IBOutlet UILabel *countryLabel;

- (IBAction)parseXML:(id)sender;

@end
