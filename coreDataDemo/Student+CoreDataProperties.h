//
//  Student+CoreDataProperties.h
//  coreDataDemo
//
//  Created by gaobin on 2018/9/12.
//  Copyright © 2018年 CXZ. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *studentName;
@property (nonatomic) int16_t studentAge;
@property (nonatomic) int16_t studentId;

@end

NS_ASSUME_NONNULL_END
