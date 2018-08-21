//
//  Contact.m
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import "Contact.h"
#import "InputCollector.h"

@implementation Contact

@synthesize name = _name;
@synthesize email = _email;

- (NSString *)name{
    return _name;
}

- (NSString *)email{
    return _email;
}

- (instancetype) init{
    [self setName:@""];
    [self setEmail:@""];
    return self;
}

- (void)setName:(NSString *)name{
    _name = name;
}

- (void)setEmail:(NSString *)email{
    _email = email;
}


- (void) fillContact:(InputCollector *)input{
    NSString *name = [input inputForPrompt:@"Name: "];
    [self setName:name];
    
    NSString *email = [input inputForPrompt:@"Email: "];
    [self setEmail:email];
    
}

- (void) print: (int) position{
    NSLog(@"%d: <%@> (%@)",position, self.name, self.email);
}


@end
