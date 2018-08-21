//
//  Contact.h
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;

- (NSString *)name;

- (NSString *)email;


- (void)setName:(NSString *)name;

- (void)setEmail:(NSString *)email;

- (void) fillContact:(InputCollector *)input;


@end
