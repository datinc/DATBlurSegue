//
//  ViewController.m
//  DATBlurSegue
//
//  Created by Peter Gulyas on 2/12/2014.
//  Copyright (c) 2014 DATInc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationController.navigationBarHidden = YES;
}
- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
    //This does not work if the presenting controlle is contained in a navigation controller
}
@end
