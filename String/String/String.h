//
//  String.h
//  String
//
//  Created by java_russel on 14年12月26日.
//  Copyright (c) 2014年 java_russel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface String : NSObject

@property (assign,nonatomic)char* charSequence;

+(id)stringWithCharSequence:(char*)charSequence;


#pragma mark -返回此字符串的长度

-(NSInteger)length;

#pragma mark -返回指定索引处的 char 值
 
-(char)chatAtIndex:(int)index;

#pragma mark -按字典顺序比较两个字符串

-(NSInteger) compareToAnother:(String*)str;

#pragma mark -将指定字符串连接到此字符串的结尾

-(String*)concat:(String*)str;

#pragma mark -当且仅当此字符串包含指定的 char 值序列时，返回 true

-(bool)isContains:(String*)str;

#pragma mark -测试此字符串是否以指定的后缀结束

-(bool)isEndsWithStr:(String*)str;

 #pragma mark -将此字符串与指定的对象比较
 
-(bool)isEqualsWithStr:(String*)str;

#pragma mark -将此 String 与另一个 String 比较，不考虑大小写

-(bool)isEqualsIgnoreCaseWithStr:(String*)str;

#pragma mark -返回指定字符在此字符串中第一次出现处的索引
-(NSInteger)indexOfFirstAppear:(String*)str;

#pragma mark -当且仅当 length() 为 0 时返回 true

-(bool) isEmpty;

#pragma mark -返回指定子字符串在此字符串中最右边出现处的索引
 
-(NSInteger) lastIndexOfString:(String*) str;

#pragma mark -返回一个新的字符串，它是通过用 newChar 替换此字符串中出现的所有 oldChar 得到的

-(String*) replaceOldStr:(String*)oldStr WithNewStr:(String*)newStr;

#pragma mark -使用给定的 replacement 替换此字符串所有匹配给定的正则表达式的子字符串

-(String*) replaceAll:(String*)oldStr WithNewStr:(String*)newStr;

#pragma mark -切割首次出现

-(NSArray*) splitFirstWithPattern:(String*)str;

#pragma mark -根据匹配给定的正则表达式来拆分此字符串
 
-(String*) splitWithPattern:(String*)str;

#pragma mark -测试此字符串是否以指定的前缀开始

-(bool) startsWithPrefix:(String*)prefix;

#pragma mark -返回一个新字符串，它是此字符串的一个子字符串

-(String*)subStringFromBegin:(NSInteger)begin toEnd:(NSInteger)end;

#pragma mark -使用默认语言环境的规则将此 String 中的所有字符都转换为小写

-(String*)toLowerCase;

#pragma mark -使用默认语言环境的规则将此 String 中的所有字符都转换为大写

-(String*)toUpperCase;

#pragma mark -去除字符串空格
-(String*)trim;

@end
