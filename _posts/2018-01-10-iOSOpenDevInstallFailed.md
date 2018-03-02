---
layout: post
title: iOSOpenDevInstallFailed
date: 2018-01-10
tag: iOSre
site: https://zhangkn.github.io
---


###  iOSOpenDevInstallFailed（iOSOpenDev-1.6-2）


>* iOSOpenDevInstallFailed info （使用快捷键Command + L 查看）
```
Jan 10 11:33:54 devzkndeMacBook-Pro Installer[21643]: install:didFailWithError:Error Domain=PKInstallErrorDomain Code=112 "An error occurred while running scripts from the package “iOSOpenDev-1.6-2.pkg”." UserInfo={NSFilePath=./postinstall, NSURL=file://localhost/Users/devzkn/Downloads/iOSOpenDev-1.6-2.pkg#iodsetup.pkg, PKInstallPackageIdentifier=com.iosopendev.iosopendev162.iod-setup.pkg, NSLocalizedDescription=An error occurred while running scripts from the package “iOSOpenDev-1.6-2.pkg”.}
```

>* [解决安装问题](https://github.com/zhangkn/iosOpenDev)
```
# copy  iPhoneOS 开头的文件
devzkndeMacBook-Pro:zhangkn.github.io devzkn$ cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Specifications 
# 拷贝 iPhone Simulator ProductTypes 开头的文件
devzkndeMacBook-Pro:Xcode devzkn$ /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Xcode/Specifications 
# sudo  mkdir usr 创建bin 目录
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin
```

### [错误2 :PrivateFrameworks apple已经将私有framework全部移走](https://github.com/zhangkn/knPrivateFrameworks)

>*  mkdir PrivateFrameworks
```
Jan 10 11:55:18 devzkndeMacBook-Pro installd[496]: ./postinstall: PrivateFramework directory not found: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS11.1.sdk/System/Library/PrivateFrameworks
devzkndeMacBook-Pro:Library devzkn$ sudo  mkdir PrivateFramework
```

>*   Failed to download 错误3 
```
404:https://codeload.github.com/kokoabim/iOSOpenDev-Xcode-Templates/tar.gz/master%20to%20/var/folders/zz/zyxvpxvq6csfxvn_n0000000000000/T/iod-setup.cDoMQ34f/file.tar.gz
```

###  今天下载Xcode7.2 专门用于调用PrivateFramework和安装iOSOpenDev

```
devzkndeMacBook-Pro: devzkn$ xcodebuild -version
Xcode 7.2
Build version 7C68
```

>*  File not found iPhoneOSPackageTypes.xcspec
```
devzkndeMacBook-Pro:PrivateFrameworks devzkn$ mkdir  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Specifications/
devzkndeMacBook-Pro:PrivateFrameworks devzkn$ cp -R  /Applications/Xcode9.1.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Specifications/*  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Specifications/
```

>* File not found: iPhone Simulator PackageTypes.xcspec
```
devzkndeMacBook-Pro:PrivateFrameworks devzkn$ cp -R  /Applications/Xcode9.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Xcode/Specifications/*  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Xcode/Specifications/
```
>*  usr -> ../../../usr

```
devzkndeMacBook-Pro:PrivateFrameworks devzkn$ cp -R /Applications/Xcode9.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/
```

### Q&A

>*  如果Xcode总是莫名其妙闪退 就删除xcodeproj/xcuserdata

>* Mac Xcode的首选项,偏好设置(Userdefault)文件地址 ~/Library/Preferences/com.apple.dt.Xcode.plist

>* [Alcatraz](https://github.com/alcatraz/Alcatraz)


>*  target specifies product type 'com.apple.product-type.tool'

```
# 具体的解决方案：
#1、重新安装Xcode； xcode-select
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
# 2、xcodebuild
sudo xcodebuild -license
# 3、# 大部分是因为Xcode升级引起的 重新安装iOSopendev
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Specifications/iPhoneOSProductType.xcspec里面没有类型为tool的配置。
devzkndeMacBook-Pro:Library devzkn$ cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk/System/Library/PrivateFrameworks
devzkndeMacBook-Pro:Library devzkn$ git clone https://github.com/zhangkn/knPrivateFrameworks.git
# 备用方案：可以采用theos 创建新的工程
```

>*  PrivateFrameworks的使用最好不要放置在/opt/iOSOpenDev/frameworks,否则Xcode 会找不到。
```
# 找不到通常是由于/opt/iOSOpenDev/frameworks权限 和frameworks search paths 配置有关。
drwx------  3 root  wheel     96 Jan 10 14:04 oncrpc.framework
```

>* Xcode won't start, stuck on 'Verifying “Xcode”…'
```
#“Xcode.app” is damaged and can’t be opened. You should move it to the Trash.
xattr -d com.apple.quarantine '/Applications/Xcode.app'
# 拷贝其他机器的Xcode app 之后，记得执行上述命令，以及一下命令
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license
```

>* 设置默认的Xcode版本
```
sudo xcode-select -switch /Applications/Xcode.app
```

>* /opt/theos/vendor/include

```
# 这里路径包含一些重要的私有的库 比如SpringBoardServices.h
```

>*  xcodebuild[84329:6787073] [MT] PluginLoading: Required plug-in compatibility UUID ACA8656B-FEA8-4B6D-8E4A-93F4C95C362C for plug-in at path

```
#  rm -rf ZXPUnicodeDecodePlugsForXcode.xcplugin 删除第三方插件
cd ~/Library/Application*Support/Developer/Shared/Xcode/Plug-ins/
# 方式二，或者直接查询DVTPlugInCompatibilityUUID；对应的插件找到info.plist,找到DVTPlugInCompatibilityUUIDs，新增一项UUID
devzkndeMacBook-Pro:taoke devzkn$ defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
```


### 参考

>* 官方参考

```
Follow — https://twitter.com/kokoabim
Download — http://iOSOpenDev.com
Wiki — https://github.com/kokoabim/iOSOpenDev/wiki

• The `iosod` command-line tool was placed in /opt/iOSOpenDev/bin. This is used by Xcode during Build Phases of projects created from iOSOpenDev templates. It also provides other various functions. To see all of its usages: Open Terminal and type `iosod --help`.

• The `iod-setup` command-line tool was placed in /opt/iOSOpenDev/bin. It provides ability to set up different Xcode and iOS SDK versions. To see all of its usages: Open Terminal and type `iod-setup`.

• The `iod-uninstall` command-line tool was placed in /opt/iOSOpenDev/bin. It provides ability to uninstall iOSOpenDev. To see all of its usages: Open Terminal and type `iod-uninstall`.
```
- [PrivateFrameworks](https://github.com/theos/sdks/tree/master/iPhoneOS9.3.sdk/System/Library/PrivateFrameworks)
- [iOS安全–使用iOSOpenDev进行越狱开发](http://www.blogfshare.com/iosopendev.html)
- [iOSOpenDev Installer Failures](https://github.com/kokoabim/iOSOpenDev/wiki/Troubleshoot)
- [iOSOpenDev](https://github.com/iFindTA/iOSOpenDev)
- [在xcode7下安装iOSOpendev，并使用iOSOpendev模板编译iOS9钩子](http://iosre.com/t/xcode7-iosopendev-iosopendev-ios9/1963)
- [Xcode 9 iOSOpenDev 安装及编译](http://bbs.iosre.com/t/xcode-9-iosopendev/10019/1)
- [https://developer.apple.com/download/more/ 下载Xcode7.2](https://developer.apple.com/download/more/) 
- [Inter-process communication](http://iphonedevwiki.net/index.php/Updating_extensions_for_iOS_7)
- [https://hr.163.com/position/list.do?postType=0104&currentPage=1](https://hr.163.com/position/list.do?postType=0104&currentPage=1)
- [升级Xcode插件失效解决方法](https://www.jianshu.com/p/bf48ab908bba)
- [Technical Note TN2339](https://developer.apple.com/library/content/technotes/tn2339/_index.html)
- [mac-headers](https://github.com/zhangkn/mac-headers)
- [theos.github.io](https://github.com/theos/theos.github.io)
- [pensource.apple.com](https://opensource.apple.com/)
