//
//  unAnsweredViewController.h
//  TabbarViewController
//  Created by Ayush Kohli on 7/9/15.
//  Copyright (c) 2015 Pro-tek. All rights reserved.


#import <UIKit/UIKit.h>

@interface unAnsweredViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate >
{
    UITableView *table;
}
@property (nonatomic,strong) NSArray *options;

@end
