//
//  ViewController.m
//  0416-tableview联系人
//
//  Created by Ibokan on 15/4/16.
//  Copyright (c) 2015年 focus. All rights reserved.
//

#import "ViewController.h"
#import "model_contact.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{

    __weak IBOutlet UITableView *_tableview;
    NSMutableArray * _contactarr;
    NSMutableArray * _deletearr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _contactarr = [NSMutableArray array];//you need alloc array space
    for (int i = 0; i < 100; i++) {
        NSString * name = [NSString stringWithFormat:@"august-%d",i];
        NSString * phone = [NSString stringWithFormat:@"1501014%d",arc4random()%9000 + 1000];
        model_contact * contact = [model_contact contactWithName:name andPhone:phone];
        [_contactarr addObject:contact];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contactarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"hehe";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    model_contact * contact = _contactarr[indexPath.row];
    cell.textLabel.text = contact.contactname;
    cell.detailTextLabel.text = contact.contactphone;
    return cell;
}

- (IBAction)Trash:(UIBarButtonItem *)sender {
    BOOL isEditing = !_tableview.isEditing;
    [_tableview setEditing:isEditing animated:YES];
}
//when you tap cell delete button,tableview ask datasource to use the method
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"-----");
    if  (editingStyle != UITableViewCellEditingStyleDelete) return;//remember add return
    [_contactarr removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    NSLog(@"from %ld to %ld",sourceIndexPath.row,);
//    [_contactarr exchangeObjectAtIndex:destinationIndexPath.row withObjectAtIndex:sourceIndexPath.row];
    model_contact * contact = [_contactarr objectAtIndex:sourceIndexPath.row];
    [_contactarr removeObjectAtIndex:sourceIndexPath.row];
    [_contactarr insertObject:contact atIndex:destinationIndexPath.row];
}
//datasource invoke tableview delete method
//tableview and controller is not is-a/has-a relation,so controller uses protocol to get tableview's property,
//  tableview uses protocol to get controller's implementation
//this method return custom actions array
//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return nil;
//}

//default delete method
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"--editstyle--");
//    return UITableViewCellEditingStyleNone;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
