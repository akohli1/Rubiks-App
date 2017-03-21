//
//  TagsQuestionsViewController.h
//  tabbarviewcontroller
//  Created by Ayush Kohli on 7/13/15.
//  Copyright (c) 2015 Pro-tek. All rights reserved.


#import <UIKit/UIKit.h>

@interface TagsQuestionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>{
    
    UITableView *table;
    
}
@property (nonatomic, strong) NSArray *optionsArray;

@end
