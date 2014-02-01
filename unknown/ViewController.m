//
//  ViewController.m
//  unknown
//
//  Created by Ryusen Sasa on 2014/02/01.
//  Copyright (c) 2014年 Ryusen Sasa. All rights reserved.
//

#import "ViewController.h"
#import "Random.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"USERID"] == nil) {
        
        NSLog(@"randam ascii string: %@", [Random randAsciiString:32]);
        
        
        
        [defaults setObject:[Random randAsciiString:32] forKey:@"USERID"];
        // 送信するリクエストを生成する。
              //Mutableを使うのがポイントです
        NSURL *url = [NSURL URLWithString:@"http://example.com"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        //パラメータを作成
        
        NSString *body = [Random randAsciiString:32];
        NSLog(@"request body:%@",body);
        //したためたものを使って接続を行う
        request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
        NSURLConnection *connection;
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if (connection) {
            NSLog(@"main : NSURLConnection create success");
        } else {
            NSLog(@"main : connection is nil");
        }
       
        
        if ( ![defaults synchronize] ) {
            NSLog( @"failed ..." );
        }
        
    }else{
        
        NSLog(@"ok");
        
    }
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
