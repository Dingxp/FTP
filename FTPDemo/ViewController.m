//
//  ViewController.m
//  FTPDemo
//
//  Created by Magicsky on 2017/2/9.
//  Copyright © 2017年 Magic Sky. All rights reserved.
//

#import "ViewController.h"
#import "FTPManager.h"

@interface ViewController ()
{
    FMServer* server;
    FTPManager* man;
    NSString* filePath;
    BOOL succeeded;
    NSTimer* progTimer;
    BOOL ifUploadSuccess;
}

@property (weak, nonatomic) IBOutlet UITextField *ipText;

@property (weak, nonatomic) IBOutlet UITextField *portText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    server = [[FMServer alloc] init];
//    server.destination = @"192.168.3.182";
//    server.port = 21;
//    server.username = @"11111";
//    server.password = @"11111";
    
    
    server = [[FMServer alloc] init];
    server.destination = @"192.168.3.182";
    server.port = 21;
    server.username = @"11111";
    server.password = @"11111";
    
    FTPManager * mgr = [[FTPManager alloc] init];
    if ([mgr checkLogin:server]) {
        NSLog(@"Login Success!====%@",server.destination);
    }
    
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"20170718192909938" withExtension:@"png"];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    //BOOL createSuccess=[mgr createNewFolder:@"IMG_03344" atServer:server];
//    if (createSuccess) {
//        //        [MBProgressHUD showMessage:@"上传成功" toView:self.view afterDelay:2];
//        NSLog(@"createSuccess");
//        
//    }

    ifUploadSuccess = [mgr uploadData:data withFileName:@"20170718192909938.PNG" toServer:server];
    
//    ifUploadSuccess = [mgr uploadData:data withFileName:@"20170718192909938.png" Folder:@"IMG_03344" toServer:server];

    if (ifUploadSuccess) {
//        [MBProgressHUD showMessage:@"上传成功" toView:self.view afterDelay:2];
        NSLog(@"Upload Success!");

    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
