//
//  InputCollector.m
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString{
    
    NSLog(@"%@", promptString);
    
    char option[255];
    fgets(option, 255, stdin);
    
    NSString *text = [NSString stringWithUTF8String:option];
    NSString *finalText = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return finalText;
}

- (void) printToPrompt:(NSString *)promptString{
    NSLog(@"%@\n", promptString);
}

@end
