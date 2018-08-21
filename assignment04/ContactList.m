//
//  ContactList.m
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

@synthesize list = _list;

- (id) init{
    self.list = [NSMutableArray new];
    return self;
}

- (void) addContact:(Contact *)contact{
    [_list addObject:contact];
    NSLog(@"Added: %@ %@",[contact name], [contact email]);
}

- (void) listContacts: (InputCollector *)input{
    int count = 1;
    for (Contact *contact in self.list) {
        NSLog(@"%d: <%@> (%@)",count, contact.name, contact.email);
        count++;
    }
}


@end
