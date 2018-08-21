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
const int SHOW = 5;
const int EXIT = 3;
const int FINDC = 6;
const int INVALID = 4;


int menu(InputCollector *input);
void fillContacts(ContactList *list);
void showContact(ContactList *contacts, InputCollector *input);
void findContact(ContactList *contacts, InputCollector *input);


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
                case SHOW:
                    showContact(contacts, input);
                    break;
                case FINDC:
                    findContact(contacts, input);
                    break;
                case INVALID:
                    [input printToPrompt:@"Invalid option"];
                    break;
            }
            [input printToPrompt:@"\n\n"];
        }
        [input printToPrompt:@"Good bye!"];
        
    }
    return 0;
}


/**
 * Draws the menu and ask for an option
 */
int menu(InputCollector *input){
    
    [input printToPrompt:@"Contacts Menu"];
    [input printToPrompt:@"====================="];
    [input printToPrompt:@"new   - Add Contact"];
    [input printToPrompt:@"list  - List Contacts"];
    [input printToPrompt:@"show  - Show Contact info"];
    [input printToPrompt:@"find  - Find Contact by name or email"];
    [input printToPrompt:@"quit  - Exit"];
    [input printToPrompt:@"====================="];
    
    NSString *option = [input inputForPrompt:@"Enter an option: "];
    
    if ([option isEqualToString:@"new"]){
        return ADD;
    }
    if ([option isEqualToString:@"list"]){
        return LIST;
    }
    if ([option isEqualToString:@"show"]){
        return SHOW;
    }
    if ([option isEqualToString:@"find"]){
        return FINDC;
    }
    if ([option isEqualToString:@"quit"]){
        return EXIT;
    }
    
    return INVALID;
}

/**
 * Fills some initial contacts
 */
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

/**
 * Asks for a contact number and shows contact info
 */
void showContact(ContactList *contacts, InputCollector *input){
    int cnt = [contacts count];
    NSString *pos = [input inputForPrompt:[NSString stringWithFormat:@"Enter contact number [0 - %d]", cnt - 1]];
    NSInteger number = [pos integerValue];
    if (number<0 || number>= cnt){
        NSLog(@"Invalid value %d", (int)number);
        return;
    }
    Contact *contact = [contacts get:(int)number];
    [contact print: (int)number];
}

/**
 * Find a contact by any part of the name or email */
void findContact(ContactList *contacts, InputCollector *input){
    int position = [contacts find: input];
    if ( position == -1){
        [input printToPrompt:@"Not found\n"];
    }else{
        Contact *contact = [contacts get:position];
        [input printToPrompt:@"Contact found!"];
        [contact print: (int)position];
    }
    
}

