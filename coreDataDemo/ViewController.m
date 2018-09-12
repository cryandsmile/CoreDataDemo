//
//  ViewController.m
//  coreDataDemo
//
//  Created by gaobin on 2018/9/11.
//  Copyright © 2018年 CXZ. All rights reserved.
//

#import "ViewController.h"
#import "Student+CoreDataClass.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //点击手势
//    UITapGestureRecognizer *r5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange)];
//    r5.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:r5];

    
}

- (IBAction)saveData:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:appDelegate.context];

    student.studentName = @"小明";
    student.studentId = arc4random_uniform(20) + 100;
    student.studentAge = arc4random_uniform(10) + 20;

    [appDelegate.context save:nil];
}

- (IBAction)fetchData:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    NSFetchRequest *fetchRequest = [Student fetchRequest]; // 自动创建的 NSManagedObject 子类里会生成相应的 fetchRequest 方法
    // 也可以使用这种方式：[NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"studentAge > %@", @(1)];
    
    NSArray<NSSortDescriptor *> *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"studentAge" ascending:NO], [NSSortDescriptor sortDescriptorWithKey:@"studentId" ascending:YES]];
//
    fetchRequest.sortDescriptors = sortDescriptors;
    //
    NSError *error = nil;
    NSArray *students = [appDelegate.context executeFetchRequest:fetchRequest error:&error];
    for (Student *stu in students) {
        
//        NSLog(@"%@",stu);
        NSLog(@"studentName = %@  studentAge = %hd studentId = %hd", stu.studentName, stu.studentAge, stu.studentId);
    }
}

- (IBAction)deleteData:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSFetchRequest *fetchRequest = [Student fetchRequest];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"studentAge = %@", @(25)];
    NSError *error = nil;
    NSArray *students = [appDelegate.context executeFetchRequest:fetchRequest error:&error];
    
    for (Student *student in students) {
        NSLog(@"studentName = %@  studentAge = %hd, studentId = %hd", student.studentName, student.studentAge, student.studentId);
        [appDelegate.context deleteObject:student];
    }
    [appDelegate.context save:nil]; // 最后不要忘了调用 save 使操作生效。
}

- (IBAction)upData:(UIButton *)sender {
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSFetchRequest *fetchRequest = [Student fetchRequest];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"studentAge = %@", @(25)];
    
    NSArray *students = [appdelegate.context executeFetchRequest:fetchRequest error:nil];
    
    for (Student *student in students) {
        NSLog(@"studentName = %@  studentAge = %hd, studentId = %hd", student.studentName, student.studentAge, student.studentId);

        student.studentAge = 128;
    }
    
    [appdelegate.context save:nil];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
