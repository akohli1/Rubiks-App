//
//  MenuViewController.h
//  TabbarViewController


#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface MenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,SWRevealViewControllerDelegate>
@property (nonatomic,strong) UITableView *optionsTableVW;
@property (nonatomic,strong) NSArray *optionsArray;
@end
