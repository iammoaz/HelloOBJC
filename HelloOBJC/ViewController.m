//
//  ViewController.m
//  HelloOBJC
//
//  Created by Muhammad Moaz on 05/02/2016.
//  Copyright © 2016 Moaz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *askAQuestion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _askAQuestion.layer.cornerRadius = 6.0;
}

- (void) checkAnswer:(NSString*) givenAnswer {
    
    NSString *title = [[NSString alloc] init];
    NSString *message = [[NSString alloc] init];
    NSString *buttonText = [[NSString alloc] init];
    
    if ([givenAnswer isEqualToString: @"Yes"]) {
        title = @"That's Right!";
        message = @"You are super cool too.";
        buttonText = @"Thanks";
        
    } else {
        title = @"What a bummer!";
        message = @"Neither are you.";
        buttonText = @"Okay :(";
    }
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:title
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:buttonText
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
    
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (IBAction)askAQuestionButton:(UIButton *)sender {
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"What do you think?"
                                message:@"Is Moaz super cool?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction
                                actionWithTitle:@"Yes"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * _Nonnull action) {
                                    [self checkAnswer:@"Yes"];
                                }];
    
    UIAlertAction *noAction = [UIAlertAction
                               actionWithTitle:@"No"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [self checkAnswer:@"No"];
                               }];
    
    [alert addAction:yesAction];
    [alert addAction:noAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
