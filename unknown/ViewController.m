//
//  ViewController.m
//  unknown
//
//  Created by Ryusen Sasa on 2014/02/01.
//  Copyright (c) 2014年 Ryusen Sasa. All rights reserved.
//

#import "ViewController.h"
#import "Random.h"

@interface ViewController ()  <NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString *Uid = [defaults objectForKey:@"USERID"] ;
    if (Uid == nil) {
     NSLog(@"okkk");
       
        Uid = [Random randAsciiString:32];
        
        [defaults setObject:Uid forKey:@"USERID"];
        // 送信するリクエストを生成する。
        NSLog(@"UserID: %@", Uid);
        NSLog(@"UserID: %@", Uid);
        NSLog(@"okk");
        
        if ( ![defaults synchronize] ) {
            NSLog( @"failed ..." );
        }
        
    }else{
        
        NSLog(@"ok");
        NSLog(@"UserID: %@", Uid);
        NSLog(@"UserID: %@", Uid);
        

        
    }
   
    //Mutableを使うのがポイントです
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    //パラメータを作成
    
    NSString *body = [NSString stringWithFormat:@"user[uid]=%@", Uid];
    NSLog(@"request body:%@",body);
    //したためたものを使って接続を行う
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *connection;
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        NSLog(@"main : NSURLConnection create success");
    
    } else {
        NSLog(@"main : connection is nil");
    }

   
}

- (IBAction)inputText:(id)sender {
    //入力されたテキストをラベルに表示
    message =  self.myTextField.text;
    
    NSLog(@"%@", message);
    //Mutableを使うのがポイントです
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/chats"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    //パラメータを作成
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString *Uid = [defaults objectForKey:@"USERID"] ;
    NSString *body = [NSString stringWithFormat:@"message=%@&uid=%@", message, Uid];
    NSLog(@"request body:%@",body);
    //したためたものを使って接続を行う
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *connection;
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        NSLog(@"main : NSURLConnection create success");
        
    } else {
        NSLog(@"main : connection is nil");
    }

}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@", response);
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    
}
- (void)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request{
    
}

- (void)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
