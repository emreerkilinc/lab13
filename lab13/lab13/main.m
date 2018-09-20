//
//  main.m
//  lab13
//
//  Created by emre on 2018-09-19.
//  Copyright © 2018 emre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinization.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *latin = [NSString stringByPigLatinization:@"hello"];
        NSLog(@"%@", latin);

    }
    return 0;
}
