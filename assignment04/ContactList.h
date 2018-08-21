//
//  ContactList.h
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *list;

- (id) init;

- (void) addContact:(Contact *)contact;

- (void) listContacts: (InputCollector *)input;

@end
