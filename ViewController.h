//
//  ViewController.h
//  TabbarViewController
//

//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate,UISearchBarDelegate, UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    
    NSMutableArray *alphabetsArray;
    NSMutableArray *dataArray;
    
}
@property (nonatomic,strong) NSArray *optionsArray;

@end

