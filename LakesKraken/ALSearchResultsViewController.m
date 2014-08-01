//
//  ALSearchResultsViewController.m
//  LakesKraken
//
//  Created by DetroitLabsUser on 7/21/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALSearchResultsViewController.h"



@interface ALSearchResultsViewController ()

@end

@implementation ALSearchResultsViewController

-(void)setEvents:(NSArray *)events {
    _events = events;
    [self.tableResults reloadData];
     
}

-(IBAction)whatever:(id)sender {
   //   NSLog(@"%@ this", [self.event.resultsArray description]);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALScheduleTableViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:@"thumbCell"];
    if (eventCell) {
        [tableView registerNib:[UINib nibWithNibName:@"ALScheduleTableViewCell" bundle:nil] forCellReuseIdentifier:@"thumbCell"];
        eventCell = [tableView dequeueReusableCellWithIdentifier:@"thumbCell"];
    }
    if (indexPath.section == 0) {
       ALEvent *event = self.events[indexPath.row];
       // cell.textLabel.text = event.eventDescription;
      //  cell.eventDescriptionText.text = event.eventDescription;
        [eventCell.eventDescriptionText setText:event.eventDescription];
        [eventCell.eventNameLabel setText:event.eventName];
        [eventCell.siteLabel setText:event.siteLocation];
        [eventCell.timeLabel setText:[NSString stringWithFormat:@"%@ %@", event.startTime, event.endTime]];
        [eventCell.dayLabel setText:event.days];
        if (event.freeFood == YES) {
            [eventCell.yummyImage setImage:[UIImage imageNamed:@"forkknife.png"]];
            [eventCell.yummyImage2 setImage:[UIImage imageNamed:@"forkknife.png"]];
             };
    }
    
    
    return eventCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableResults registerClass: [UITableViewCell class]forCellReuseIdentifier:@"thumbCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
