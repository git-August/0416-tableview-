//
//  model_contact.h
//  0416-tableview联系人
//
//  Created by Ibokan on 15/4/16.
//  Copyright (c) 2015年 focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model_contact : NSObject
@property (nonatomic,copy) NSString * contactname;
@property (nonatomic,copy) NSString * contactphone;
+(id)contactWithName:(NSString *)name andPhone:(NSString *)phone;
@end
