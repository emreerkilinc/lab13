//
//  NSString+PigLatinization.m
//  lab13
//
//  Created by emre on 2018-09-19.
//  Copyright © 2018 emre. All rights reserved.
//

#import "NSString+PigLatinization.h"

@implementation NSString PigLatinization

+ (NSString *)stringByPigLatinization:(NSString *)englishString {
    
    NSMutableString *latin = [NSMutableString new];
    NSArray *components = [englishString componentsSeparatedByString:@" "];
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    NSString *firstCharacter = [NSString stringWithFormat:@"%hu", [englishString characterAtIndex:0]];
    NSRange vowelSearch = [firstCharacter rangeOfCharacterFromSet:vowels options:1];
    
    for (NSString *word in components) {
        if (vowelSearch.location > 0) {
            NSRange firstVowel = [word rangeOfCharacterFromSet:vowels options:1];
            
            if (firstVowel.location == NSNotFound) {
                firstVowel.location = 1;
            }
            
            NSString *consonants = [word substringToIndex:firstVowel.location];
            NSString *wordWithoutConsonants = [word substringFromIndex:firstVowel.location];
            NSString *reorderedWord = [wordWithoutConsonants stringByAppendingString:consonants];
            NSString *compoundWord = [reorderedWord stringByAppendingString:@"ay "];
            
            [latin appendString:compoundWord];
        }
        
        if (vowelSearch.location <= 0) {
            NSString *appendAy = [englishString stringByAppendingString:@"ay "];
            
            [latin appendString:appendAy];
        }
    }
    
    return latin;
}

@end
