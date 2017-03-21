//
//  SeventhViewController.h
//  TabbarViewController
//

//

#import <UIKit/UIKit.h>

@interface SeventhViewController : UIViewController <UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate, UISearchDisplayDelegate, UIActionSheetDelegate>
{
    UITableView *table;
    
    NSMutableArray *dataArray;
}
@property (strong, nonatomic) NSArray *optionsArray;

@end
