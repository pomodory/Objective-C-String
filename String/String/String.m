//
//  String.m
//  String
//
//  Created by java_russel on 14年12月26日.
//  Copyright (c) 2014年 java_russel. All rights reserved.
//

#import "String.h"
@implementation String

+(id)stringWithCharSequence:(char*)charSequence{

    String* str = [[String alloc] init];
    
    str.charSequence = charSequence;
    
    return str;

}

/*
 返回此字符串的长度
 */
-(NSInteger)length{

    NSInteger length = 0;
    
    char* str = self.charSequence;
    
    while(*str++){
    
        length ++;
    
    }
    
    return length;

}
/*
 返回指定索引处的 char 值
 */
-(char)chatAtIndex:(int)index{

    NSInteger size = [self length];

    if(index<0||index>=size) return '\0';
    
    return *(self.charSequence+index);
    
}

/*
 按字典顺序比较两个字符串
 */
-(NSInteger) compareToAnother:(String*)anotherStr{

    /*
     思路:
     1.如果想同,则返回0
     2.如果大于另外一个，则返回1
     3.否则返回0
     
    （1）从头开始比较字符的Anscii码,如果一直相同，则看谁先读到'\0',谁先停谁输
     (2)如果读到大于另一个的，则停止返回
     */

    char* str = [self trim].charSequence;
    
    char* another = [anotherStr trim].charSequence;
    
    NSInteger length = [[self trim] length]>[[anotherStr trim]length ]?[[self trim] length]: [[anotherStr trim] length];
    
    for(NSInteger i=0;i<length;i++,str++,another++){
    
        if(*str>*another){
        
            return 1;

            
        }else if(*str<*another){
        
            return -1;
        
        }    
    }
    
    return 0;
    
}

/*
 将指定字符串连接到此字符串的结尾
 */
-(String*)concat:(String*)str{

    NSInteger length = [self length];
    
    char* charSequence = self.charSequence;
    
    char* s = str.charSequence;
    
    char* newSequence = (char*)malloc(sizeof(char)*([self length]+[str length]+1));
    
    char* tempNewSequence = newSequence;
    
    for(NSInteger i=0;i<length;i++,tempNewSequence++,charSequence++){
    
        *tempNewSequence = *charSequence;
    
    }
    
    for(NSInteger i=0;i<[str length];i++,tempNewSequence++,s++){
    
        *tempNewSequence = *s;
    
    }
    
    *tempNewSequence='\0';
    
    self.charSequence = newSequence;
    
    return self;
}
/*
 当且仅当此字符串包含指定的 char 值序列时，返回 true
 */
-(bool)isContains:(String*)str{

    bool contains = NO;
    
    char* selfSequence = [self charSequence];
    
    char* strSequence = [str charSequence];
    
    NSInteger strLength = [str length];
    
    if([self length]<strLength) contains = NO;
    
    NSInteger count;
    
    while(*selfSequence){
    
        count = 0;
        
        char* tempSelfSequence = selfSequence;
        
        char* tempStrSequence = strSequence;
        
        for(NSInteger i=0;i<strLength;i++,tempStrSequence++,tempSelfSequence++){
            
            if(*tempSelfSequence == *tempStrSequence){
            
                count++;
                
            }
            
        }
        
        if(count==strLength) contains=YES;
        
        selfSequence++;
    
    
    }
    
    return contains;
    
    
}
/*
 测试此字符串是否以指定的后缀结束
 */
-(bool)isEndsWithStr:(String*)str{

    NSInteger strLength = [str length];
    
    NSInteger selfLength = [self length];
    
    if(strLength>selfLength) return NO;
    
    char* selfSequence = self.charSequence;
    
    char* strSequence = str.charSequence;
    
    char* tempSelfSequence = selfSequence +selfLength-strLength;
    
    NSInteger count = 0;
    
    while(*tempSelfSequence){
    
        if(*tempSelfSequence==*strSequence){
        
            count++;
        
        }
    
        tempSelfSequence++;
        
        strSequence++;
    
    }
    
    if(count==strLength) return YES;
    
    else return NO;
    
}
/*
 将此字符串与指定的对象比较
 */
-(bool)isEqualsWithStr:(String*)str{

    char* selfSequence = self.charSequence;
    
    char* strSequence = str.charSequence;
    
    NSInteger selfLength = [self length];
    
    NSInteger strLength = [str length];
    
    if(selfLength!=strLength) return NO;
    
    while(*selfSequence){
    
        if(*selfSequence!=*strSequence){
        
            return NO;
        
        }
    
        selfSequence++;
        
        strSequence++;
    
    }
    
    return YES;

}
/*
 将此 String 与另一个 String 比较，不考虑大小写
 */
-(bool)isEqualsIgnoreCaseWithStr:(String*)str{

    /*
     思路:（1）先比较长度，如果长度不相同直接返回No;
     1.声明一个变量tempSelfCharSeq将self.charSequence和tempStrCharSeq将str.charSequence保存起来
     2.声明一个变量selfCharSequence指向self.charSequence,另一个变量strCharSequence指向str.charSequence
     再声明各自指向头部的指针
     3.遍历两个指针，如果范围在65~97的时候，都自加32
     4.调用isEqualsWithStr方法比较
     */
    bool flag = NO;
    
    NSInteger selfSequenceLength = [self length];
    
    NSInteger strSequenceLength = [str length];
    
    if(selfSequenceLength!=strSequenceLength) return flag;
    
    char* tempSelfCharSeq = (char*)malloc(sizeof(char)*(selfSequenceLength+1));
    
    strcpy(tempSelfCharSeq, self.charSequence);
    
    char* tempStrCharSeq = (char*)malloc(sizeof(char)*(strSequenceLength+1));
    
    strcpy(tempStrCharSeq, str.charSequence);
    
    flag = [[self toLowerCase]isEqualsWithStr:[str toLowerCase]];
    
    self.charSequence = tempSelfCharSeq;
    
    str.charSequence = tempStrCharSeq;
        
    return flag;
}
/*
 返回指定字符在此字符串中第一次出现处的索引
 */
-(NSInteger)indexOfFirstAppear:(String*)str{

    NSInteger location = -1;
    
    NSInteger strLength = [str length];
    
    NSInteger count;
    
    NSInteger index = -1;
    
    char* sequence = self.charSequence;
    
    while(*sequence){
        
        count=0;
        
        char* s = sequence;
        
        char* strSeq = str.charSequence;
        
        for(NSInteger i=0;i<strLength;i++){
        
            if(*s==*strSeq){
            
                count++;
                
            }
            
            s++;
            
            strSeq++;
            
        }
    
        sequence++;
        
        location++;
        
        if(count==strLength) {
        
            index = location;
            
            break;
            
        }
    
    }
    
    return index;

}
/*
 当且仅当 length() 为 0 时返回 true
 */
-(bool) isEmpty{

    if([self length]<=0) return YES;
    
    return NO;

}
/*
 返回指定子字符串在此字符串中最右边出现处的索引
 */
-(NSInteger) lastIndexOfString:(String*) str{

    NSInteger strLength = [str length];
    
    NSInteger selfLength = [self length];
    
    if(strLength>[self length]||strLength<=0) return -1;
    
    char* selfSeq = self.charSequence+selfLength-strLength;
    
    char* strSeq = str.charSequence;
    
    NSInteger count;
    
    NSInteger index = -1;
    
    for (NSInteger i=(selfLength-strLength); i>=0; i--) {
        
        count = 0;
        
        char* selfTemp = selfSeq;
        
        char* strTemp = strSeq;
        
        for(int j=0;j<strLength;j++){
        
            if(*selfTemp==*strTemp) count++;
            
            selfTemp++;
            
            strTemp++;
        
        }
        
        if(count==strLength){
        
            index = i;
            
            break;
            
        }
        
        selfSeq--;
        
    }
    
    return index;

}
/*
 返回一个新的字符串，它是通过用 newChar 替换此字符串中出现的所有 oldChar 得到的
 */
-(String*) replaceOldStr:(String*)oldStr WithNewStr:(String*)newStr{
    
    NSInteger oldStrLength = [oldStr length];
    
    NSInteger newStrLength = [newStr length];
    
    NSInteger selfStrLength = [self length];
    
    NSInteger index = [self indexOfFirstAppear:oldStr];
    
    if(index==-1||newStrLength<=0) return self;
    
    NSInteger size = selfStrLength-oldStrLength+newStrLength;
    
    char* selfSequence = (char*)malloc(sizeof(char)*(size+1));
    
    char* headSelfSequence = selfSequence;
    
    char* tempSequence = self.charSequence;
    
    char* newStrSequence = newStr.charSequence;
    
    NSInteger location = 0;
    
    for(NSInteger i=0;i<=(selfStrLength-oldStrLength);i++){
        
        if(i == index){
        
            for(NSInteger j=0;j<newStrLength;j++,selfSequence++,newStrSequence++){
            
                *selfSequence = *newStrSequence;
        
                
            }
            
            location = oldStrLength;
        }
        
        *selfSequence = *(tempSequence+location);
        
        selfSequence++;
    
        tempSequence++;
    
    }
    
    *selfSequence = '\0';
    
    self.charSequence = headSelfSequence;
    
    return self;
    

}
/*
 使用给定的 replacement 替换此字符串所有匹配给定的正则表达式的子字符串
 */
-(String*) replaceAll:(String*)oldStr WithNewStr:(String*)newStr{
    
    String* temp = [String stringWithCharSequence:self.charSequence];
    
    for(NSInteger i=0;i<=[self length];i++){
    
        [self replaceOldStr:oldStr WithNewStr:newStr];
        
        if(![temp isEqualsWithStr:self]) temp.charSequence = self.charSequence;
        
        else break;
        
    }
    return self;
    
}

/*
 切割首次出现
 */

-(NSArray*) splitFirstWithPattern:(String*)str{

    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:2];
    
    NSArray *array = [NSArray array];
    
    if(([str length]>[self length])||([str length]<=0)||([self indexOfFirstAppear:str]==-1)){
    
        [arrayM addObject:self];
        
        array = arrayM;
        
        return array;
    
    }
    
    NSInteger size = [self length];
    
    NSInteger strLength = [str length];
    
    NSInteger firstSectionLength = [self indexOfFirstAppear:str]+1;
    
    NSInteger secondeSectionLength = size - strLength - firstSectionLength+2;
    
    char* firstSectionSequence = (char*)malloc(sizeof(char)*firstSectionLength);
    
    char* tempfirstSectionSequence = firstSectionSequence;
    
    char* secondeSectionSequence = (char*)malloc(sizeof(char)*secondeSectionLength);
    
    char* tempsecondeSectionSequence = secondeSectionSequence;
    
    char* tempSequence = self.charSequence;
    
    for(NSInteger i=0;i<firstSectionLength-1;i++,tempSequence++,firstSectionSequence++){
    
        *firstSectionSequence = *tempSequence;
    
    }
    
    tempSequence+=strLength;
    
    *firstSectionSequence = '\0';
    
    String* str1 = [String stringWithCharSequence:tempfirstSectionSequence];
    
    [arrayM addObject:str1];
    
    for (NSInteger i=0; i<secondeSectionLength-1; i++,tempSequence++,secondeSectionSequence++) {
        
        *secondeSectionSequence = *tempSequence;
        
    }
    
    *secondeSectionSequence = '\0';
    
    if(*tempsecondeSectionSequence!='\0'){
    
        String* str2 = [String stringWithCharSequence:tempsecondeSectionSequence];
    
        [arrayM addObject:str2];
    
    }
    array = arrayM;
    
    return array;
    
}

/*
 根据匹配给定的正则表达式来拆分此字符串
 */

-(NSArray*) splitWithPattern:(String*)str{

    NSMutableArray* arrayM1 = [NSMutableArray arrayWithArray:[self splitFirstWithPattern:str]];
    
    NSMutableArray* arrayM2 = [NSMutableArray array];
    
    [arrayM2 addObjectsFromArray:arrayM1];
    
    NSArray* array = arrayM1;
    
    NSArray* tempArray = [NSArray array];
    
    String* string = nil;
    
    for (NSInteger i = 0; i< [self length]; i++) {
            
        string = [array lastObject];
            
        [arrayM1 removeLastObject];
        
        tempArray = [string splitFirstWithPattern:str];
        
        [arrayM1 addObjectsFromArray:tempArray];
            
        if(arrayM1.count==arrayM2.count) break;
        
        else {
        
            [arrayM2 removeLastObject];
            
            [arrayM2 addObjectsFromArray:tempArray];
        }
    }
    
    if([[array lastObject] charSequence]=='\0') [arrayM1 removeLastObject];
    
    return array;

}
/*
 测试此字符串是否以指定的前缀开始
 */
-(bool) startsWithPrefix:(String*)prefix{

    if([self indexOfFirstAppear:prefix]==0) return YES;
    
    return NO;
}
/*
 返回一个新字符串，它是此字符串的一个子字符串
 */
-(String*)subStringFromBegin:(NSInteger)begin toEnd:(NSInteger)end{

    NSInteger length = [self length];
    
    if(begin<0||begin>=length||end<0||end<begin||end>=length) {
    
        NSLog(@"index out of bounds Exception!");
        
        return self;
    
    }
    
    char* sequence = (char*)malloc(sizeof(char)*(end-begin+2));
    
    char* tempSequence = sequence;
    
    char* tempSelfSequence = self.charSequence+begin;
    
    NSInteger size = end - begin + 1;
    
    for(NSInteger i=0;i<size;i++,tempSelfSequence++,tempSequence++){
    
        *tempSequence = *tempSelfSequence;
    
    }
    
    *tempSequence = '\0';
    
    String *str = [String stringWithCharSequence:sequence];
    
    return str;
    
}
/*
 使用默认语言环境的规则将此 String 中的所有字符都转换为小写
 */
-(String*)toLowerCase{
    
    char* tempSequence = (char*)malloc(sizeof(char)*([self length]+1));
    
    char* headTempSequence = tempSequence;
    
    while (*self.charSequence){
    
        *tempSequence = tolower(*self.charSequence);
        
        tempSequence++;
        
        self.charSequence++;
    
    }
    
    *tempSequence='\0';
    
    self.charSequence = headTempSequence;
    
    return self;

}
/*
 使用默认语言环境的规则将此 String 中的所有字符都转换为大写
 */
-(String*)toUpperCase{
    
    char* tempSequence = (char*)malloc(sizeof(char)*([self length]+1));
    
    char* headTempSequence = tempSequence;
    
    while (*self.charSequence){
        
        *tempSequence = toupper(*self.charSequence);
        
        tempSequence++;
        
        self.charSequence++;
        
    }
    
    *tempSequence='\0';
    
    self.charSequence = headTempSequence;
    
    return self;
    

}

-(String*)trim{
    
    NSInteger size = [self length];
    
    char* head = self.charSequence;
    
    char* tail = self.charSequence+size-1;
    
    NSInteger count = size;
    //记住:一定要在堆中开放，否则会被自动销毁
    char* str = (char*)malloc(sizeof(char)*(size+1));
    
    char* s = str;
    
    while(*head==' '){

        head++;
        
        count--;
    
    }
    
    while(*tail==' '){
    
        tail--;
        
        count--;
        
    }
    
    for (NSInteger i=0; i<count; i++) {
        
        *s = *head;
        
        s++;
        
        head++;
        
    }
    
    self.charSequence = str;
    
    return self;
    
}

-(NSString*)description{

    NSString* str = [NSString stringWithFormat:@"%s,%p",self.charSequence,self];
    
    return str;

}

@end
