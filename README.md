# ZYTextAttribute
一行代码搞定某段文字的常见富文本显示

![](http://upload-images.jianshu.io/upload_images/355579-2a2f34858bfef55a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##Usage
###Initialize
```objective-c
[ZYTextAttribute properView:self.lifeLabel rangeDictArray:@[@{RANGEKEY : [NSValue valueWithRange:[self.lifeLabel.text rangeOfString:@"生命"]], COLORKEY : [UIColor redColor], FONTKEY : [UIFont systemFontOfSize:18.0]}, @{RANGEKEY : [NSValue valueWithRange:[self.lifeLabel.text rangeOfString:@"得到"]], COLORKEY : [UIColor greenColor], UNDERLINESTYLEKEY : [NSNumber numberWithInteger:NSUnderlineStyleSingle]}]];
```

##*That's it!*    *Enjoy!*
