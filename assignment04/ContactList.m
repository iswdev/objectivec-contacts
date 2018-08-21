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

- (int) count{
    return (int)[self.list count];
}


- (void) addContact:(Contact *)contact{
    [_list addObject:contact];
    NSLog(@"Added: %@ %@",[contact name], [contact email]);
}

- (void) listContacts: (InputCollector *)input{
    int count = 0;
    for (Contact *contact in self.list) {
        [contact print: count];
        count++;
    }
}

- (Contact *) get:(int) position{
    return [self.list objectAtIndex:position];
}

- (int) find: (InputCollector *)input{
    NSString *find = [[input inputForPrompt:@"Enter a search word:"] lowercaseString];
    int count=0;
    for (Contact *contact in self.list) {
        if ([[contact.name lowercaseString] rangeOfString:find].location != NSNotFound){
            return count;
        }
        if ([[contact.email lowercaseString] rangeOfString:find].location != NSNotFound){
            return count;
        }
        count++;
    }
    return -1;
}

@end
