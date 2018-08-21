//
//  main.m
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ContactList.h"
#import "InputCollector.h"


const int ADD = 1;
const int LIST = 2;
const int EXIT = 3;
const int INVALID = 4;

int menu(InputCollector *input){
    
    
    [input printToPrompt:@"Contacts Menu"];
    [input printToPrompt:@"====================="];
    [input printToPrompt:@"new   - Add Contact"];
    [input printToPrompt:@"list  - List Contacts"];
    [input printToPrompt:@"quit  - Exit"];
    [input printToPrompt:@"====================="];
    
    NSString *option = [input inputForPrompt:@"Enter an option: "];
    
    if ([option isEqualToString:@"new"]){
        return ADD;
    }
    if ([option isEqualToString:@"list"]){
        return LIST;
    }
    if ([option isEqualToString:@"quit"]){
        return EXIT;
    }
    
    return INVALID;
}


void fillContacts(ContactList *list){
    NSLog(@"Creating example contacts...");
    Contact *contact;
    contact = [Contact new];
    [contact setName: @"Francisco Igor"];
    [contact setEmail: @"franciscoigor@gmail.com"];
    [list addContact:contact];
    
    contact = [Contact new];
    [contact setName: @"Rodrigo Moura"];
    [contact setEmail: @"rodmoura82@gmail.com"];
    [list addContact:contact];
    NSLog(@"");
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ContactList *contacts = [ContactList new];
        InputCollector *input = [InputCollector new];
        int option;
        Contact *contact;
        
        fillContacts(contacts);
        
        while ( (option = menu(input)) != EXIT ){
            
            switch( option ){
                case ADD:
                    [input printToPrompt:@"Add contact"];
                    contact = [Contact new];
                    [contact fillContact: input];
                    [contacts addContact:contact];
                    break;
                case LIST:
                    [input printToPrompt:@"Contact list"];
                    [contacts listContacts:input];
                    break;
                case INVALID:
                    [input printToPrompt:@"Invalid option"];
                    break;
                    
            }
        }
        [input printToPrompt:@"Good bye!"];
        
    }
    return 0;
}
