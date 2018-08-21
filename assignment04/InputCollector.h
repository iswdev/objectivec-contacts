//
//  InputCollector.h
//  assignment04
//
//  Created by Francisco on 2018-08-17.
//  Copyright © 2018 project. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

- (NSString *)inputForPrompt:(NSString *)promptString;

- (void) printToPrompt:(NSString *)promptString;

@end
