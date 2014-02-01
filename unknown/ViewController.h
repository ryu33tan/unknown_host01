//
//  ViewController.h
//  unknown
//
//  Created by Ryusen Sasa on 2014/02/01.
//  Copyright (c) 2014年 Ryusen Sasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
     NSString *message;
}

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

//テキスト入力のメソッド定義
- (IBAction)inputText:(id)sender;

@end
