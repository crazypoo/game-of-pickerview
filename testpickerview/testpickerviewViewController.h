
#import <UIKit/UIKit.h>

@interface testpickerviewViewController : UIViewController 
<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *picker; 
    NSArray *column1;
    NSArray *column2;
    NSArray *column3;
    UILabel *display;
    UIButton *button;
    NSTimer *times;
    UILabel *displayduzhu;
    int j;
    int money;
    int zhu;
}
-(IBAction)spin;
-(IBAction)xiazhu:(id)sender;

@property(retain,nonatomic)IBOutlet UIPickerView *picker;
@property(retain,nonatomic)IBOutlet UILabel *display;
@property(retain,nonatomic)IBOutlet UIButton *button;
@property(retain,nonatomic)IBOutlet UILabel *displayduzhu;
@property(retain,nonatomic)NSArray *column1;
@property(retain,nonatomic)NSArray *column2;
@property(retain,nonatomic)NSArray *column3;

@end
