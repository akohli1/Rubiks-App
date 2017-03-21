//
//  ThirdViewController.h
//  TabBarController
//

//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController  <UIActionSheetDelegate,UISearchBarDelegate, UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    
    NSMutableArray *alphabetsArray;
    NSMutableArray *dataArray;
    
}
@property (nonatomic,strong) NSArray *optionsArray;



@end
