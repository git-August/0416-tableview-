//
//  model_contact.m
//  0416-tableview联系人
//
//  Created by Ibokan on 15/4/16.
//  Copyright (c) 2015年 focus. All rights reserved.
//

#import "model_contact.h"

@implementation model_contact
+(id)contactWithName:(NSString *)name andPhone:(NSString *)phone{
    model_contact * contact = [[self alloc] init];
    contact.contactname = name;
    contact.contactphone = phone;
    return contact;
}
@end
