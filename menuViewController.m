//
//  menuViewController.m
//  
//
//  Created by DetroitLabsUser on 7/14/14.
//
//

#import "menuViewController.h"
#import "ALSearchScheduleViewController.h"
#import "ALKrakenPhotoController.h"

@interface menuViewController ()

@end

NSString* const cellReuseIdentifier = @"cellIdentifier";
@implementation menuViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
[self.menuTable registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];

    
    self.menuTable.backgroundColor = [UIColor colorWithRed:1 green:0.937 blue:0.78 alpha:1];

    self.loadingLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:16];
    [self.loadingLabel setText:@"Loading..."];
    self.loadingLabel.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    }
   
    
    if (indexPath.section == 0 && indexPath.row == 0){
        
        cell.textLabel.text = @"About Lakes of Fire";
    }
    
    if (indexPath.section == 0 && indexPath.row == 1){
        
        cell.textLabel.text = @"How to Get Here";
    }
    
    if (indexPath.section == 0 && indexPath.row == 2){
        
        cell.textLabel.text = @"Ten Principles";
    }
     
    if (indexPath.section == 0 && indexPath.row == 3){
        cell.textLabel.text = @"Search Schedule";
    }
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        cell.textLabel.text = @"Photo Gallery";
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    
    cell.textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:16];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ALSearchScheduleViewController *searchViewController = [[ALSearchScheduleViewController alloc]init];
    ALKrakenPhotoController *photoController = [[ALKrakenPhotoController alloc]init];
    
    if (indexPath.section == 0 && indexPath.row == 3){
    return [self.navigationController pushViewController:searchViewController animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        self.loadingLabel.hidden = NO;
        
        [self.navigationController pushViewController:photoController animated:YES];
    }

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
