//
//  main.m
//  String
//
//  Created by java_russel on 14年12月26日.
//  Copyright (c) 2014年 java_russel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "String.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        char* s1 = "hello russel";
        
        char* s2 = "hel"; 
        
        //char* s3 = "jb";
        
        String* str1 = [String stringWithCharSequence:s1];
        
        NSLog(@"%@",[str1 subStringFromBegin:2 toEnd:8]);
        
        //NSLog(@"修改前%@",str1);
        
       // String* str2 = [String stringWithCharSequence:s2];
        
       // NSLog(@"%d",[str1 startsWithPrefix:str2]);
        
//        NSArray* array = [str1 splitFirstWithPattern:str2];
//        
//        for (String* str in array) {
//            
//            NSLog(@"%@",str);
//            
//        }
        
        //String* str3 = [String stringWithCharSequence:s3];
        
//        NSArray* array = [str1 splitWithPattern:str2];
//        
//        for (String* str in array) {
//            
//            NSLog(@"%@",str);
//            
//        }
        
        //NSLog(@"%@",[str1 replaceAll:str2 WithNewStr:str3]);
        
        //NSLog(@"%i",[str1 lastIndexOfString:str2]);
        
//        NSLog(@"%@",[str1 replaceOldStr:str2 WithNewStr:str3]);
//        
//        NSLog(@"%@",str1);
//        
//        NSLog(@"%@",str2);
//        
//        NSLog(@"%@",str3);
//        
//        NSLog(@"%@",[str1 replaceOldStr:str2 WithNewStr:str3]);
        
       // NSLog(@"%i",[str1 indexOfFirstAppear:str2]);
        
       // NSLog(@"%i",[str1 isEmpty]);
        
        //NSLog(@"%d",[str1 isEqualsIgnoreCaseWithStr:str2]);
        
        
       // NSLog(@"toLower修改后%@",[str1 toLowerCase]);
        
       // NSLog(@"toUpper修改后%@",[str1 toUpperCase]);
        
       // NSLog(@"%d",[str1 isEndsWithStr:str2]);
        
       // NSLog(@"%d",[str1 isEqualsWithStr:str2]);
        
       // NSLog(@"%d", [str1 isEqualsIgnoreCaseWithStr:str2]);
        
        //NSLog(@"%@",str1);
        
        //NSLog(@"%@",str2);

        
       // NSInteger result = [str1 compareToAnother:str2];
        
        //NSLog(@"%i",result);
        
        //char c = [str chatAtIndex:13];
        
        //NSLog(@"%c",c);
           
        //NSLog(@"%@",[str1 trim]);
        
    }
    return 0;
}

