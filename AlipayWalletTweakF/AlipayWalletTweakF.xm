// See http://iphonedevwiki.net/index.php/Logos

//http://everettjf.com/2015/12/20/amap-ios-client-kill-anti-debugging-protect/
//https://segmentfault.com/a/1190000006104602
//http://dev.qq.com/topic/5791da152168f2690e72daa4
//https://bbs.pediy.com/thread-185014.htm
//http://www.rainyx.com/archives/category/ios/reverse

#import <substrate.h>
#import <mach-o/dyld.h>
#import <dlfcn.h>

void (*old_sub_bf92)(void);

void new_sub_bf92(void)
{
    // old_sub_bf92();
    NSLog(@"KNiOSRE: anti-anti-debugging");
}
//sub_bf92
%ctor
{
    @autoreleasepool
    {
        unsigned long _sub_bf92 = (_dyld_get_image_vmaddr_slide(0) + 0xbf92) | 0x1;
        if (_sub_bf92) NSLog(@"KNiOSRE: Found sub_bf92!");
            MSHookFunction((void *)_sub_bf92, (void *)&new_sub_bf92, (void **)&old_sub_bf92);
    }
}


%hook DFClientDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    %log();
    
    // 打印某个类的所有方法的，查看所有方法的执行顺序
    
    // [KNHook hookClass:@"H5WebViewController"];//aluLoginViewController H5WebViewController
     [KNHook hookClass:@"PSDView"];//
    [KNHook hookClass:@"PSDJsBridge"];//
    [KNHook hookClass:@"H5WebView"];//getUaPageName    aluMTopService _tokenLoginInvoker

     [KNHook hookClass:@"TBSDKMTOPServer"];//getUaPageName    aluMTopService _tokenLoginInvoker
    
    return %orig;
}
%end


@interface MtopExtResponse : NSObject
{
    _Bool _isFromCache;
    _Bool _isCacheExpired;
    _Bool _isLoginCancel;
    int _httpResponseCode;
    NSMutableDictionary *_headers;
    NSData *_rawbody;
    NSString *_body;
    NSDictionary *_json;
    NSURL *_requestURL;
    NSString *_requestMethod;
    NSDictionary *_requestHeaders;
    NSData *_requestBody;
}

@property(nonatomic) _Bool isLoginCancel; // @synthesize isLoginCancel=_isLoginCancel;
@property(retain, nonatomic) NSData *requestBody; // @synthesize requestBody=_requestBody;
@property(retain, nonatomic) NSDictionary *requestHeaders; // @synthesize requestHeaders=_requestHeaders;
@property(retain, nonatomic) NSString *requestMethod; // @synthesize requestMethod=_requestMethod;
@property(retain, nonatomic) NSURL *requestURL; // @synthesize requestURL=_requestURL;
@property(nonatomic) _Bool isCacheExpired; // @synthesize isCacheExpired=_isCacheExpired;
@property(nonatomic) _Bool isFromCache; // @synthesize isFromCache=_isFromCache;
@property(retain, nonatomic) NSDictionary *json; // @synthesize json=_json;
@property(retain, nonatomic) NSString *body; // @synthesize body=_body;
@property(retain, nonatomic) NSData *rawbody; // @synthesize rawbody=_rawbody;
@property(retain, nonatomic) NSMutableDictionary *headers; // @synthesize headers=_headers;
@property(nonatomic) int httpResponseCode; // @synthesize httpResponseCode=_httpResponseCode;
- (id)resolveError:(id)arg1;
- (id)description;
- (void)removeHeader:(id)arg1;
- (_Bool)validateResponse;
- (_Bool)isSucceed;
- (void)fillWithOther:(id)arg1;
- (id)initWithCacheObject:(id)arg1 request:(id)arg2;
- (id)initWithError:(id)arg1 request:(id)arg2;
- (id)initWithRequest:(id)arg1 erequest:(id)arg2;
- (id)initWithHttp:(int)arg1 headers:(id)arg2 rawbody:(id)arg3 isFromCache:(_Bool)arg4 request:(id)arg5;

@end


@interface TBSDKMTOPServer
@property (nonatomic, strong) NSString *responseString;
+ (id)requestWithMethod:(id)arg1;
- (void)cacheResponseString;
- (void)fillWithMtopResponse:(id)arg1;
@end

NSString *gDetailUrl = nil;
NSString *gCommission = nil;
NSString *gAmount = nil;
NSString *gPrice = nil;
NSString *gCouponPrice = nil;
NSString *gTitle = nil;

NSInteger gS2Cnt = 0;


%hook TBSDKMTOPServer
+ (id)requestWithMethod:(id)arg1{
    
    %log();
    //             NSError *error;
    //                 // NSLog(@"mtopRequest mtopRequest:%@", %orig);
    //                 TBSDKMTOPServer *res =  %orig;
    //     NSData* jsonData = [[res responseString] dataUsingEncoding:NSUTF8StringEncoding];
    //     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    // if ( [arg1 isEqualToString:@"mtop.taobao.sharepassword.querypassword"])
    
    // {
    //      code   mtop.taobao.sharepassword.querypassword
    //             NSLog(@" mtop.taobao.sharepassword.querypassword TBSDKMTOPServer:%@", json);//        api = "mtop.alimama.moon.provider.search.auction.get";
    
    // }
    
    //         NSLog(@"TBSDKMTOPServer:%@", json);//        api = "mtop.alimama.moon.provider.search.auction.get";
    
    //             // if ([[json objectForKey:@"api"] isEqualToString:@"mtop.alimama.moon.provider.edetail.iteminfo.get"])
    //    //          }
    
    return %orig;
}

- (void)fillWithMtopResponse:(id)arg1{
    
    %log();
    
    MtopExtResponse *tmp =  arg1;
    if ([tmp.requestURL.absoluteString hasPrefix:@"https://guide-acs.m.taobao.com/gw/mtop.taobao.hlservice.feed.list"]){
        // %log();
        
        NSString *requestMethod = [[tmp requestURL] description];
        NSLog(@"fillWithMtopResponse  isSucceed:%d     requestMethod :%@", [tmp isSucceed],requestMethod);//
        
        
        
        
        if (![tmp isSucceed])
        {
            
        }else{
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
    }
    
    return %orig;
}


%end
