//
//  Student+CoreDataProperties.m
//  coreDataDemo
//
//  Created by gaobin on 2018/9/12.
//  Copyright © 2018年 CXZ. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Student"];
}

@dynamic studentName;
@dynamic studentAge;
@dynamic studentId;

@end
