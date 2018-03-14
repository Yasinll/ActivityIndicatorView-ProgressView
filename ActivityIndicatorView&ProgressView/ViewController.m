//
//  ViewController.m
//  ActivityIndicatorView&ProgressView
//
//  Created by PatrickY on 2018/3/14.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView                *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIProgressView                         *progressView;

@property (strong, nonatomic) UIActivityIndicatorView                       *activityIndicatorViewB;
@property (strong, nonatomic) NSTimer                                       *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    
    self.activityIndicatorViewB = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = self.activityIndicatorViewB.frame;
    frame.origin = CGPointMake(169, 80);
    self.activityIndicatorViewB.frame = frame;
    
    self.activityIndicatorViewB.hidesWhenStopped = false;
    [self.view addSubview:self.activityIndicatorViewB];
    
    
}


- (IBAction)uploadBtnClick:(id)sender {
    
    if ([self.activityIndicatorView isAnimating]|| [self.activityIndicatorViewB isAnimating]) {
        [self.activityIndicatorView stopAnimating
         ];
        [self.activityIndicatorViewB stopAnimating];
    }else {
        [self.activityIndicatorView startAnimating];
        [self.activityIndicatorViewB startAnimating];
    }
    
}


- (IBAction)downloadBtnClick:(id)sender {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(downloadTask) userInfo:nil repeats:YES];
    
}

-(void)downloadTask {
    
    self.progressView.progress = self.progressView.progress + 0.1;
    if (self.progressView.progress == 1.0) {
       //定时器结束要停止
        [self.timer invalidate];
        self.progressView.progress = 0;
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"download competed" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alertViewController addAction:action];
    
    [self presentViewController:alertViewController animated:YES completion:nil];
        
    }
    
}

@end
