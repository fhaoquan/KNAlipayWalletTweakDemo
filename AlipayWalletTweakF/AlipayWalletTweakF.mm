#line 1 "/Users/devzkn/code/tweak/AlipayWalletTweakF/AlipayWalletTweakF/AlipayWalletTweakF.xm"








#import <substrate.h>
#import <mach-o/dyld.h>
#import <dlfcn.h>

void (*old_sub_bf92)(void);

void new_sub_bf92(void)
{
    
    NSLog(@"KNiOSRE: anti-anti-debugging");
}

static __attribute__((constructor)) void _logosLocalCtor_98f13708(int __unused argc, char __unused **argv, char __unused **envp)
{
    @autoreleasepool
    {
        unsigned long _sub_bf92 = (_dyld_get_image_vmaddr_slide(0) + 0xbf92) | 0x1;
        if (_sub_bf92) NSLog(@"KNiOSRE: Found sub_bf92!");
            MSHookFunction((void *)_sub_bf92, (void *)&new_sub_bf92, (void **)&old_sub_bf92);
    }
}



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class DFClientDelegate; @class TBSDKMTOPServer; 
static BOOL (*_logos_orig$_ungrouped$DFClientDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL DFClientDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static BOOL _logos_method$_ungrouped$DFClientDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL DFClientDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static id (*_logos_meta_orig$_ungrouped$TBSDKMTOPServer$requestWithMethod$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id _logos_meta_method$_ungrouped$TBSDKMTOPServer$requestWithMethod$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$TBSDKMTOPServer$fillWithMtopResponse$)(_LOGOS_SELF_TYPE_NORMAL TBSDKMTOPServer* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$TBSDKMTOPServer$fillWithMtopResponse$(_LOGOS_SELF_TYPE_NORMAL TBSDKMTOPServer* _LOGOS_SELF_CONST, SEL, id); 

#line 32 "/Users/devzkn/code/tweak/AlipayWalletTweakF/AlipayWalletTweakF/AlipayWalletTweakF.xm"

static BOOL _logos_method$_ungrouped$DFClientDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL DFClientDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary * launchOptions) {
    
    HBLogDebug(@"-[<DFClientDelegate: %p> application:%@ didFinishLaunchingWithOptions:%@]", self, application, launchOptions);
    
    
    
    
     [KNHook hookClass:@"PSDView"];
    [KNHook hookClass:@"PSDJsBridge"];
    [KNHook hookClass:@"H5WebView"];

     [KNHook hookClass:@"TBSDKMTOPServer"];
    
    return _logos_orig$_ungrouped$DFClientDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);
}



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

@property(nonatomic) _Bool isLoginCancel; 
@property(retain, nonatomic) NSData *requestBody; 
@property(retain, nonatomic) NSDictionary *requestHeaders; 
@property(retain, nonatomic) NSString *requestMethod; 
@property(retain, nonatomic) NSURL *requestURL; 
@property(nonatomic) _Bool isCacheExpired; 
@property(nonatomic) _Bool isFromCache; 
@property(retain, nonatomic) NSDictionary *json; 
@property(retain, nonatomic) NSString *body; 
@property(retain, nonatomic) NSData *rawbody; 
@property(retain, nonatomic) NSMutableDictionary *headers; 
@property(nonatomic) int httpResponseCode; 
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



static id _logos_meta_method$_ungrouped$TBSDKMTOPServer$requestWithMethod$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    
    HBLogDebug(@"+[<TBSDKMTOPServer: %p> requestWithMethod:%@]", self, arg1);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return _logos_meta_orig$_ungrouped$TBSDKMTOPServer$requestWithMethod$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$TBSDKMTOPServer$fillWithMtopResponse$(_LOGOS_SELF_TYPE_NORMAL TBSDKMTOPServer* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    
    HBLogDebug(@"-[<TBSDKMTOPServer: %p> fillWithMtopResponse:%@]", self, arg1);
    
    MtopExtResponse *tmp =  arg1;
    if ([tmp.requestURL.absoluteString hasPrefix:@"https://guide-acs.m.taobao.com/gw/mtop.taobao.hlservice.feed.list"]){
        
        
        NSString *requestMethod = [[tmp requestURL] description];
        NSLog(@"fillWithMtopResponse  isSucceed:%d     requestMethod :%@", [tmp isSucceed],requestMethod);
        
        
        
        
        if (![tmp isSucceed])
        {
            
        }else{
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
    }
    
    return _logos_orig$_ungrouped$TBSDKMTOPServer$fillWithMtopResponse$(self, _cmd, arg1);
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$DFClientDelegate = objc_getClass("DFClientDelegate"); MSHookMessageEx(_logos_class$_ungrouped$DFClientDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$DFClientDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$DFClientDelegate$application$didFinishLaunchingWithOptions$);Class _logos_class$_ungrouped$TBSDKMTOPServer = objc_getClass("TBSDKMTOPServer"); Class _logos_metaclass$_ungrouped$TBSDKMTOPServer = object_getClass(_logos_class$_ungrouped$TBSDKMTOPServer); MSHookMessageEx(_logos_metaclass$_ungrouped$TBSDKMTOPServer, @selector(requestWithMethod:), (IMP)&_logos_meta_method$_ungrouped$TBSDKMTOPServer$requestWithMethod$, (IMP*)&_logos_meta_orig$_ungrouped$TBSDKMTOPServer$requestWithMethod$);MSHookMessageEx(_logos_class$_ungrouped$TBSDKMTOPServer, @selector(fillWithMtopResponse:), (IMP)&_logos_method$_ungrouped$TBSDKMTOPServer$fillWithMtopResponse$, (IMP*)&_logos_orig$_ungrouped$TBSDKMTOPServer$fillWithMtopResponse$);} }
#line 178 "/Users/devzkn/code/tweak/AlipayWalletTweakF/AlipayWalletTweakF/AlipayWalletTweakF.xm"
