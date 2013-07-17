

#import "testpickerviewViewController.h"

@implementation testpickerviewViewController
@synthesize picker;
@synthesize column1;
@synthesize column2;
@synthesize column3;
@synthesize display;
@synthesize button;
@synthesize displayduzhu;
- (void)dealloc
{
    [picker release];
    [column1 release];
    [column2 release];
    [column3 release];
    [display release];
    [super dealloc];
}
-(IBAction)xiazhu:(id)sender
{
    zhu=[sender tag];
    [self.displayduzhu setText:[NSString stringWithFormat:@"$%d",zhu]];
}
-(IBAction)spin
{
   
    button.frame=CGRectMake(196, 271, 94, 126);
    button.transform=CGAffineTransformMakeRotation(M_PI);
    
    money=money-zhu;
    NSString *displaymoney=[NSString stringWithFormat:@"$%d",money];
    [self.display setText:displaymoney];
    times=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(function) userInfo:nil repeats:YES];

        
    
}
-(void)function
{
    j++;
    if(j%100==0)
    {
        [times invalidate];
        times=nil;
         button.frame=CGRectMake(196, 215, 94, 126);
        button.transform=CGAffineTransformMakeRotation(2*M_PI);        //BOOL win=NO;
       // int numInRow=1;
        int firstvalue=random()%1000;
        [picker selectRow:firstvalue inComponent:0 animated:YES];
        [picker reloadComponent:0];
        int secondvalue=random()%1000;
        [picker selectRow:secondvalue inComponent:1 animated:YES];
        [picker reloadComponent:1];
        int thirdvalue=random()%1000;
        [picker selectRow:thirdvalue inComponent:2 animated:YES];
        [picker reloadComponent:2];
        NSLog(@"%d",firstvalue%5);
        if (firstvalue%5==secondvalue%5&&firstvalue%5==thirdvalue%5) {
         money=money+10*zhu;  
            if (firstvalue%5==1) {
                money=money+90*zhu;
            }
        }
        else if(firstvalue%5==secondvalue%5||firstvalue%5==thirdvalue%5||secondvalue%5==thirdvalue%5)
        {
             money=money+2*zhu;
            if (firstvalue%5==1) {
                money=money+8*zhu;
            }
        }
        /*
        for (int i=0; i<3; i++) {
            int newValue=random()%1000;
            if (newValue%5==lastval%5) {
                numInRow++;
            }
            else numInRow=1;
            lastval=newValue;
            [picker selectRow:newValue inComponent:i animated:YES];
            [picker reloadComponent:i];
            if (numInRow==2) {
                money=money+2*zhu;
            }
            else if(numInRow==3)
            {
                money=money+20*zhu;
            }
        }
        
        if (win) {
            [display setText:@"win!"];
        }
        else [display setText:@"lose!"];
        NSLog(@"%d",j);
         */
        NSString *displaymoney=[NSString stringWithFormat:@"$%d",money];
        [self.display setText:displaymoney];
        j=0;
        button.enabled=YES;

    }
    else
    {for (int i=0; i<3; i++) {
              [picker selectRow:j inComponent:i animated:YES];
              [picker reloadComponent:i];  
        button.enabled=NO;
        }
    }
    
   
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    j=0;
    money=500;
    zhu=1;
    NSString *displaymoney=[NSString stringWithFormat:@"$%d",money];
    [self.display setText:displaymoney];
    [self.displayduzhu setText:@"$1"];
    UIImage *happy=[UIImage imageNamed:@"happy.png"];
    UIImage *gold=[UIImage imageNamed:@"redhat_games.png"]; 
    UIImage *santa=[UIImage imageNamed:@"sleeping_santaclaus.png"];
    UIImage *tsitter=[UIImage imageNamed:@"tsitter_square_sleeping.png"];
    UIImage *monkey=[UIImage imageNamed:@"face_monkey.png"];
    for(int i=1;i<=3;i++)
    {
        UIImageView *happyview=[[UIImageView alloc] initWithImage:happy];
        UIImageView *goldview=[[UIImageView alloc] initWithImage:gold];
        UIImageView *santaView=[[UIImageView alloc] initWithImage:santa];
        UIImageView *tsitterview=[[UIImageView alloc] initWithImage:tsitter];
        UIImageView *monkeyview=[[UIImageView alloc] initWithImage:monkey];
        NSArray *imgViewArray=[[NSArray alloc] initWithObjects:happyview,goldview,santaView,tsitterview,monkeyview, nil];
        NSString *columnname=[[NSString alloc] initWithFormat:@"column%d",i];
        [self setValue:imgViewArray forKey:columnname];
        [happyview release];
        [goldview release];
        [santaView release];
        [tsitterview release];
        [monkeyview release];
        [imgViewArray release];
        [columnname release];
        
        
    }
    srandom(time(NULL));
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    //[super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 1000;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *arrayName=[[NSString alloc] initWithFormat:@"column%d",component+1];
    NSArray *array=[self valueForKey:arrayName];
    return [array objectAtIndex:row%5];
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableArray *strings = [NSMutableArray arrayWithCapacity:5];
    [strings addObject:@"Zero"];
    [strings addObject:@"One"];
    [strings addObject:@"Two"];
    [strings addObject:@"Three"];
    [strings addObject:@"Four"];
    return [strings objectAtIndex:(row%5)];

}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 128;
}
@end
