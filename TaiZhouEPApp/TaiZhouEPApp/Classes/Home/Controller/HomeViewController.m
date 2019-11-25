//
//  HomeViewController.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/5/11.
//  Copyright © 2019 snew. All rights reserved.
//

#import "HomeViewController.h"
#import <GCDAsyncSocket.h>

@interface HomeViewController () <GCDAsyncSocketDelegate>
@property (nonatomic,strong) GCDAsyncSocket *socket;
@property (nonatomic,strong) UIButton *socketBtn;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)setupUI {
    UIButton *socketBtn = [[UIButton alloc] init];
    socketBtn.center = CGPointMake(self.view.centerX, 100);
    socketBtn.bounds = CGRectMake(0, 0, 200, 100);
    [socketBtn setBackgroundColor:[UIColor greenColor]];
    [socketBtn setTitle:@"连接" forState:UIControlStateNormal];
    [self.view addSubview:socketBtn];
    [socketBtn addTarget:self action:@selector(connectToServer:) forControlEvents:UIControlEventTouchUpInside];
    self.socketBtn = socketBtn;
    
    UIButton *sendBtn = [[UIButton alloc] init];
    sendBtn.frame = CGRectMake(socketBtn.origin.x, socketBtn.bottom + 50, 200, 100);
    [sendBtn setTitle:@"发送数据" forState:UIControlStateNormal];
    [sendBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:sendBtn];
    [sendBtn addTarget:self action:@selector(sendData) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *reviceBtn = [[UIButton alloc] init];
    reviceBtn.frame = CGRectMake(socketBtn.origin.x, socketBtn.bottom + 200, 200, 100);
    [reviceBtn setTitle:@"接收数据" forState:UIControlStateNormal];
    [reviceBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:reviceBtn];
    [reviceBtn addTarget:self action:@selector(sendData) forControlEvents:UIControlEventTouchUpInside];

    
}

- (void)sendData {
    [self socket:self.socket didWriteDataWithTag:1];
}

- (void)reviceData {
//    [self socket:self.socket didReadData:<#(nonnull NSData *)#> withTag:<#(long)#>]
}



- (void)connectToServer:(id)sender {
    
    // 1.与服务器通过三次握手建立连接
    NSString *host = @"61.174.246.67";
    int port = 860;
    
    //创建一个socket对象
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self
                                         delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    
    NSError *error = nil;
    
    // 开始连接
    [_socket connectToHost:host
                    onPort:port
                     error:&error];
    
    
    if (error) {
        NSLog(@"%@",error);
    }
}


#pragma mark - Socket代理方法
// 连接成功
- (void)socket:(GCDAsyncSocket *)sock
didConnectToHost:(NSString *)host
          port:(uint16_t)port {
    
    NSLog(@"%s",__func__);
    NSLog(@"连接成功");
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.socketBtn setTitle:@"连接中" forState:UIControlStateNormal];
    });
}


// 断开连接
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock
                  withError:(NSError *)err {
    if (err) {
        NSLog(@"连接失败");
    } else {
        NSLog(@"正常断开");
    }
}


// 发送数据
- (void)socket:(GCDAsyncSocket *)sock
didWriteDataWithTag:(long)tag {
    
    NSLog(@"%s",__func__);
    
    //发送完数据手动读取，-1不设置超时
    [sock readDataWithTimeout:-1
                          tag:tag];
}

// 读取数据
-(void)socket:(GCDAsyncSocket *)sock
  didReadData:(NSData *)data
      withTag:(long)tag {
    
    NSString *receiverStr = [[NSString alloc] initWithData:data
                                                  encoding:NSUTF8StringEncoding];
    
    NSLog(@"%s %@",__func__,receiverStr);
}


 

@end
