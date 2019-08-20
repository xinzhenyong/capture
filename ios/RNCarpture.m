
#import "RNCarpture.h"
#import "QRCodePicker.h"

NSString *const kCaptureName = @"code";

@interface RNCarpture ()
@property(strong,nonatomic)QRCodePicker *qrCodePicker;
@end
@implementation RNCarpture
    RCT_EXPORT_MODULE(CaptureMoudle);
+ (id)allocWithZone:(struct _NSZone *)zone {
    static RNCarpture *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter removeObserver:self];
        [defaultCenter addObserver:self
                          selector:@selector(sendCustomEvent:)
                              name:@"sendCustomEventNotification"
                            object:nil];
    }
    return self;
}

#pragma mark --销毁通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sendCustomEventNotification" object:nil];
}

// 接收通知的方法，接收到通知后发送事件到RN端。RN端接收到事件后可以进行相应的逻辑处理或界面跳转
- (void)sendCustomEvent:(NSNotification *)noti {
    NSString *qrCodeValue = [NSString stringWithFormat:@"%@",noti.userInfo[@"qrCodeValue"]];
    NSLog(@"发给RN的条形码字符串为%@",qrCodeValue);
    [self sendEventWithName:kCaptureName body:qrCodeValue];
}

// 重写方法，定义支持的事件集合
- (NSArray<NSString *> *)supportedEvents {
    return @[kCaptureName];
}

// 接收传过来的 selectTag
RCT_EXPORT_METHOD(openNative:(NSInteger)selectTag){
    NSLog(@"传过来的selectTag为%ld", selectTag);
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (root.presentedViewController != nil) {
        root = root.presentedViewController;
    }
    [[self _qrCodePicker:root] selectQRCodeMethod];
}

-(QRCodePicker*)_qrCodePicker:(UIViewController*)vc{
    if(self.qrCodePicker == nil){
        self.qrCodePicker = [[QRCodePicker alloc]initWithViewController:vc];
    }
    return self.qrCodePicker;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


@end

