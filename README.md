# FJFKeyboardHelper

### 简书链接:[iOS 键盘管理器:FJFKeyboardHelper](https://www.jianshu.com/p/34b50c7a111f)

# 一. 前言
我们项目中很经常会碰到`输入框`和`键盘`的遮挡问题，写多了我们会发现，`不同视图和场景下`的`处理逻辑大同小异`，都是先注册`监听`键盘的`弹起`和`隐藏`事件，然后在`弹起`和`隐藏`的时候做处理，之后再`移除键盘`的`相关监听`，因此你会发现，`重复性代码`挺多；虽然现在已经有了`IQKeyboardManager`这样优秀的第三方来管理，但有时候又会觉得`IQKeyboardManager`过于`重量级`，功能过于`庞大`，你可能不想引入这么`庞大`的`第三方`，出于这个原因我自己写了一个`键盘管理`的`辅助类`，来处理`键盘`和`输入框`的`遮挡`事件，`核心代码`就`一百多行`，`处理`只需要`一句话`就可以解决。

# 二.使用介绍
- **使用方法**
```
/**
处理 containerView 键盘 遮挡

@param containerView 需要移动的视图
*/
+ (void)handleKeyboardWithContainerView:(UIView *)containerView;


/**
处理 scrollView 键盘 遮挡(列表型)

@param scrollView scrollView
*/
+ (void)handleKeyboardWithScrollView:(UIScrollView *)scrollView;


/**
处理 键盘

@param showBlock 显示 回调
@param hideBlock 隐藏 回调
*/
+ (void)handleKeyboardWithShowBlock:(MOAKeyboardManagerBlock)showBlock hideBlock:(MOAKeyboardManagerBlock)hideBlock;
```
- **集成方法:**

```
静态：手动将FJFKeyboardHelper文件夹拖入到工程中。
动态：CocoaPods：pod 'FJFKeyboardHelper'
```

- **`github 链接`**
> **Demo地址: https://github.com/fangjinfeng/FJFKeyboardHelper**

- **效果展示:**

![FJFKeyboardHelper.gif](https://upload-images.jianshu.io/upload_images/2252551-c21929961c9f0199.gif?imageMogr2/auto-orient/strip)

# 三. 原理分析
### 1. 原理简介
**`FJFKeyboardHelper`有`2种`可供选择的`处理方法`:**
**第一种:`FJFKeyboardHelper`来处理`键盘遮挡`**
`使用者`提供`键盘遮挡`时需要移动的`视图containerView`,`FJFKeyboardHelper`通过`注册键盘通知`，在`键盘弹起`时，通过获取`当前响应者`相对于`UIWindow`的位置，来移动`containerView`的`frame`以此来解决`键盘遮挡`，在`键盘隐藏`时，将`containerView`的`frame还原`。

**第二种:`使用者`通过`回调`自己处理`键盘遮挡`**
`FJFKeyboardHelper`的`注册键盘通知`，在`键盘弹起`时，通过`showBlock`回调，在`键盘隐藏`时，通过`hideBlock`的回调，由`使用者`自己来处理`键盘遮挡`问题。

### 2. 代码分析:
**`FJFKeyboardHelper`的`3`个类方法:**

**第一种:处理普通视图输入框的键盘遮挡**
```
/**
处理 containerView 键盘 遮挡

@param containerView 需要移动的视图
*/
+ (void)handleKeyboardWithContainerView:(UIView *)containerView;
```

- 方法调用 ` [FJFKeyboardHelper handleKeyboardWithContainerView:self.view];`

-  `FJFKeyboardHelper`的类方法`+ (void)handleKeyboardWithContainerView:(UIView *)containerView  `实现如下:

```  
FJFKeyboardHelper *helper = [[FJFKeyboardHelper alloc] init];
[helper handleKeyboardWithContainerView:containerView];
[[UIViewController fjf_keyboardCurrentViewController].view fjf_setkeyboardHelper:helper];
```
这里的`helper`是个`局部变量`，为了延长`局部变量`的`生命周期`，通过函数`fjf_setkeyboardHelper`将让当前`UIViewController`的`View`强引用`helper`，防止`helper`出了`作用域`就`释放`。

`UIViewController`的类方法`fjf_keyboardCurrentViewController`用来获取`当前界面`的`UIViewController`。

`UIView`的实例方法`fjf_setkeyboardHelper`用来设置当前`view`和`keyboardHelper`的关联。

- 接着看`FJFKeyboardHelper`的初始化方法`init`,
```
- (instancetype)init {
    if (self = [super init]) {

        _oldContainerViewFrame = CGRectZero;

        [self addKeyboardNotiObserver];
    }
return self;
}
```
在`init`方法这里将`oldContainerViewFrame`初始化为`CGRectZero`，同时注册`键盘弹起`和`隐藏`的`通知事件`。
```
- (void)addKeyboardNotiObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

```

- 接着看`helper`调用的实例方法`handleKeyboardWithContainerView`
```
- (void)handleKeyboardWithContainerView:(UIView *)containerView {
    if ([containerView isKindOfClass:[UIView class]]) {
        _containerView = containerView;
    }

    NSAssert([containerView isKindOfClass:[UIView class]], @"containerView 必现是 UIView类型");
}
```
这里只是进行`简单的赋值`和`断言操作`，判断当前`containerView`是否为`UIView`类型。

- 最后来看下`键盘弹起`的回调函数`keyBoardWillShow`和`键盘隐藏`的`keyBoardWillHide`函数:
```
//  键盘 显示
- (void)keyBoardWillShow:(NSNotification *)noti {
    if ([noti.name isEqualToString:UIKeyboardWillShowNotification]) {

        NSDictionary *keyBordInfo = [noti userInfo];

        NSValue *value = [keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey];

        CGRect keyBoardRect = [value CGRectValue];

        CGRect beginRect = [[keyBordInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];

        CGRect endRect = [[keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

        if (CGRectEqualToRect(_oldContainerViewFrame, CGRectZero)) {
            _oldContainerViewFrame = _containerView.frame;
        }

            // 第三方键盘回调三次问题，监听仅执行最后一次
            if(beginRect.size.height > 0 && (beginRect.origin.y - endRect.origin.y > 0)){

                // 有回调
                if (self.keyboardShowBlock) {
                    self.keyboardShowBlock(noti.name, noti.userInfo, keyBoardRect);
                }
                // 无回调
                else {
                    UIView *tmpView = [UIResponder fjf_keyboardCurrentFirstResponder];
                    if ([tmpView isKindOfClass:[UIView class]]) {
                        UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
                        CGRect rect = [tmpView convertRect:tmpView.bounds toView:window];
                        CGFloat viewBottomHeight =  [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(rect);
                        if (viewBottomHeight < 0) {
                            viewBottomHeight = 0;
                        }
                        CGFloat viewBottomOffset = keyBoardRect.size.height - viewBottomHeight;
                        NSString *durationValue = [keyBordInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
                        if (viewBottomOffset > 0 ) {

                        // 列表
                            if (_scrollView) {
                                CGFloat contentOffsetY = self.scrollView.contentOffset.y +  viewBottomOffset;
                                [UIView animateWithDuration:durationValue.floatValue animations:^{
                                self.scrollView.contentOffset = CGPointMake(0, contentOffsetY);
                                }];
                            }
                        // 非列表
                        else if(_containerView){
                            CGFloat contentOffsetY = _oldContainerViewFrame.origin.y - viewBottomOffset;
                            [UIView animateWithDuration:durationValue.floatValue animations:^{
                                self.containerView.frame  = CGRectMake(self.oldContainerViewFrame.origin.x, contentOffsetY, self.oldContainerViewFrame.size.width, self.oldContainerViewFrame.size.height);
                            }];
                        }
                    
                    }
                }
            }
        }
    }
}
```
**在键盘即将显示的回调函数里面:**

a. 我们先判断`_oldContainerViewFrame`是否为`CGRectZero`，如果是将`_containerView.frame`赋值给`_oldContainerViewFrame`

b. 依据键盘的`beginRect`和`endRect`判断出`键盘`的`最后一次`回调，因为这里`第三方键盘`会`回调三次`，这里只需要执行`最后一次`即可。

c. 然后判断`使用者`是否要自己处理`键盘遮挡`，如果是，则直接通过`block`回调给`使用者`，如果不是，先去获取`当前响应者`，依据`响应者`算出相对`UIWindow`的`位置`，然后算出需要`偏移`的`偏移量`。

该函数` [UIResponder fjf_keyboardCurrentFirstResponder];`主要用来获取`当前`的`第一响应者`。

d. 接着判断`当前需要移动的视图`是否为`scrollView`类型，如果是`scrollView`类型就通过设置`contentOffset`来偏移，如果不是，就通过设置`frame`来偏移。


```
// 键盘 隐藏
- (void)keyBoardWillHide:(NSNotification *)noti {
    if ([noti.name isEqualToString:UIKeyboardWillHideNotification]) {
        NSDictionary *keyBordInfo = [noti userInfo];

        NSValue *value = [keyBordInfo objectForKey:UIKeyboardFrameEndUserInfoKey];

        CGRect keyBoardRect = [value CGRectValue];
        // 有回调
        if (self.keyboardHideBlock) {
            self.keyboardHideBlock(noti.name, noti.userInfo, keyBoardRect);
        }
        // 无回调
        else {
            // 非列表
            NSString *durationValue = [keyBordInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
            if(_containerView){
                [UIView animateWithDuration:durationValue.floatValue animations:^{
                    self.containerView.frame  = self.oldContainerViewFrame;
                    self.oldContainerViewFrame = CGRectZero;
                }];
            }
        }
    }
}
```


**在键盘即将隐藏的回调函数里面:**
- 我们首先判断`使用者`是否设置回调来自己处理`键盘隐藏`事件，如果`有回调`，则直接通过`block`回调给`使用者`，`如果没有`,再判断`当前需要移动视图`是否为`非scrollView类型`，如果是`非scrollView类型`，就将之前存储的`oldContainerViewFrame`赋值给`self.containerView的frame`,并将`self.oldContainerViewFrame`置为`CGRectZero`。

这里之所以在键盘隐藏时候将`self.oldContainerViewFrame`置为`CGRectZero`，是为了保证获取到`需要移动视图`的最新的`frame`，以防止`中间过程`中可能`需要移动的视图`的`frame会被修改`，而`FJFKeyboardHelper`的实例里面却不是`最新的`。

**第二种:处理列表输入框的键盘遮挡**
```
/**
处理 scrollView 键盘 遮挡(列表型)

@param scrollView scrollView
*/
+ (void)handleKeyboardWithScrollView:(UIScrollView *)scrollView;
```


这个方法跟`第一个处理普通视图输入框的键盘遮挡`方法差不多，`唯一的区`别就是`键盘即将显示`的时候，`列表`是通过设置`contentOffset`来进行`偏移`，`普通视图`是通过设置`frame`来进行`偏移`。

**第三种:使用者自己处理键盘回调**
```
/**
处理 键盘

@param showBlock 显示 回调
@param hideBlock 隐藏 回调
*/
+ (void)handleKeyboardWithShowBlock:(MOAKeyboardManagerBlock)showBlock hideBlock:(MOAKeyboardManagerBlock)hideBlock;

```
这个方法的处理是相对比较简单的，就是在`键盘即将显示`和`键盘即将隐藏`的`回调函数`里面，通过`block`回调给`使用者`自己处理。

# 四. 总结
综上所述就是`FJFKeyboardHelper`这个`键盘管理器`的一个`设计思路`，`核心代码量`也就`一百来行`，能处理大部分的`键盘遮挡场景`，而且只需要一句代码。

![image.png](https://upload-images.jianshu.io/upload_images/2252551-c4deb97c7b183f19.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**如果你觉得你觉得这思路或是代码有什么问题，欢迎留言大家讨论下！**
