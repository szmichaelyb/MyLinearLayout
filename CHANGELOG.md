# 版本变更日志
**MyLayout**的所有版本的变更日志都将会在这里记录.

## [V1.9.8](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.9.1)(2020/08/04)
### Update
1. 重写布局库的内部实现，代码更具可读性，计算性能得到进一步的提升，重写了相对布局的内部实现。
2. 将布局的属性leftPadding,rightPadding,topPadding,bottomPadding,leadingPadding,trailingPadding改名为paddingLeft,paddingRight,paddingTop,paddingBottom,paddingLeading,paddingTrailing。原来的属性名保留但是会提示过期。
3. 修复布局套布局时进行尺寸评估可能会不准确的BUG。[issue#116](https://github.com/youngsoft/MyLinearLayout/issues/116)
4. 修复弹性布局MyFlexLayout在单行时子视图不被拉伸的BUG。
5. 修复相对布局子视图整体水平居中时又设置了padding时的BUG。[issue#120](https://github.com/youngsoft/MyLinearLayout/issues/120)
6. 优化横竖屏不同布局展示的支持能力，由原先的设备方向变为优先考虑接口方向。[issue#123](https://github.com/youngsoft/MyLinearLayout/issues/123)
7. 修复相对布局中子视图的高度等于布局高度，宽度等于自身高度的BUG。[issue#129](https://github.com/youngsoft/MyLinearLayout/issues/129)

## [V1.9.1](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.9.1)(2019/12/23)
### Added
1. 流式布局和线性布局添加对停靠属性`gravity`的两个新枚举值： `MyGravity_Vert_Among、MyGravity_Horz_Among`的支持。这两个枚举值可以实现间距的等分拉伸功能。between、around、among这三个拉伸的区别在于和父视图之间的间距上。
2. 流式布局添加最后一行的停靠策略属性`lastlineGravityPolicy`，用来指定流式布局最后行的停靠策略。
3. 流式布局、浮动布局、线性布局添加对行内浮动间距的支持。我们可使用`setSubviewsSize`函数中的centered参数来指定每一行的头尾视图和父布局视图之间的间距也是浮动的。


---
## [V1.9.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.9.0)(2019/11/30)

### Added

1. 添加新的布局:**MyFlexLayout**。 MyFlexLayout布局是从MyFlowLayout派生的布局,它兼容flexbox的所有特性,以及提供了和flexbox相同的设置语法。您可以通过MyFlexLayout中提供的flex属性并用链式语法的形式来设置布局特性，同时还可以通过视图提供的扩展分类flexItem属性来设置布局内子视图的布局特性。具体可以参考:[FLXTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FLXTest1ViewController.m) 中的介绍和使用方法

2. 添加尺寸对象MyLayoutSize和位置对象MyLayoutPos的最值约束的设置。您可以将视图的尺寸设置为某一个尺寸集合中的最大值或者最小值。在相对布局中您也可以将视图的位置设置为某一个位置集合中的最大值和最小值。比如A的宽度是B,C,D三个视图宽度中的最大值，则可以设置为：`A.widthSize.equalTo(@[B.widthSize,C.widthSize,D.widthSize].myMaxSize)` 具体实例请参考：[RLTest6ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/RLTest6ViewController.m)

3. 添加对视图尺寸和位置进行压缩的设置。在线性布局和流式布局以及框架布局中当子视图的尺寸和间距总和大于布局视图的尺寸时，您可以通过MyLayoutSize以及MyLayoutPos中提供的新属性**shrink**来设置压缩的比重，默认情况下压缩比重的值是0表示不压缩，比重越大压缩度越大。具体的使用方法可以参考：[AllTest7ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/AllTest7ViewController.m) 中的第12个demo。


4. 针对线性布局、流式布局中的gravity属性添加了Around和Stretch两种停靠和对齐能力，其中的Around和Between的区别是前者的首行和尾行的拉伸间距是其他行之间间距的一半，而后者则首行和尾行的间距不会被拉伸。Stretch和Fill的区别是前者对明确设置了尺寸的视图不进行尺寸拉伸，而后者则是对所有视图都进行尺寸拉伸


5. 添加和抽象对拖动的支持，系统提供了一个新的类**MyLayoutDragger**，你可以用这个类中提供的方法就可以很轻易的实现对布局视图中的子视图进行拖放操作。具体使用方法可以参考：[FLLTest3ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FLLTest3ViewController.m)

6. 添加对iOS13的黑白模式适配的支持，解决了边界线的黑白模式适配的问题。

7. 流式布局MyFlowLayout中添加单独设置行内停靠对齐的支持属性：**lineGravity**，这个属性是一个block类型的对象，我们可以借助这个属性来实现对布局内每行的停靠对齐操作。具体实例可以参考：[FLLTest4ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FLLTest4ViewController.m)



8. 流式布局MyFlowLayout添加属性**isFlex**，这个属性默认是NO，当设置为YES时则表明让流式布局来兼容flexbox的特性。具体兼容可以参考属性中的注释。


9. 流式布局和浮动布局添加了行内的基线对齐的功能。您可以将gravity或者arrangedGravity的值设置为MyGravity_Baseline。

10. 浮动布局添加对尺寸自适应的支持。您可以在垂直浮动布局中将布局视图的宽度设置为自适应，同时可以在水平浮动布局中将布局视图的高度设置为自适应。

11. 在线性布局、流式布局、浮动布局中实现了可以在尺寸自适应的模式下gravity的停靠属性生效的能力。解决了[issue#102](https://github.com/youngsoft/MyLinearLayout/issues/102)
12. 在线性布局、流式布局、浮动布局中实现了设置尺寸自适应并且设置了最大最小值约束的情况下子视图被正确布局的功能。
13. 扩充的流式布局中的pagedCount的能力，由原先的必须是在滚动视图的子视图下生效改为可以在任意时刻生效。
14. 改变对布局动画方法:`layoutAnimationWithDuration:`的实现逻辑，并新增加了动画的选项以及动画完成后的处理block机制，具体使用请参见方法：`layoutAnimationWithDuration:options:completion:`

### Update
1. 更新了对尺寸自适应属性的设置方式。不再建议使用wrapContentWidth进行宽度自适应设置，而是改为`myWidth = MyLayoutSize.wrap`或者`widthSize.equalTo(@(MyLayoutSize.wrap))`进行宽度自适应设置。不再建议使用wrapContentHeight进行高度尺寸自适应设置，而是改为`myHeight= MyLayoutSize.wrap`或者`heightSize.equalTo(@(MyLayoutSize.wrap))`进行高度自适应设置。 对于宽度是否自适应的判断则可以用`myWidth == MyLayoutSize.wrap`或widthSize.iswrap进行判断，高度也是一样的。
2. 在框架布局、线性布局、相对布局中子视图如果同时设置了上下边距或者左右边距，并且同时设置了高度或者宽度约束时则子视图的高度或者宽度不再是由布局视图决定而是由自身设置的高度或者宽度约束决定。解决了[issue#100](https://github.com/youngsoft/MyLinearLayout/issues/100)

2. 将浮动布局的noBoundaryLimit属性设置为过期，这个属性将不再生效，而是直接将布局的宽度或者高度设置为自适应即可实现相同的功能。

3. 线性布局中的shrinkType属性用于控制所有子视图的压缩特性，如果子视图的尺寸设置shrink属性值则以子视图的设置优先,布局视图的shrinkType将不再起作用。
4. 修改布局视图监听子布局视图frame和center变化的实现，由原来的KVO形式变化为直接调用。这样就可以减少布局计算的耗时处理。
5. 重构了流式布局、相对布局，加快了布局计算时间，尤其是相对布局的重构。



### Fixed

1. 修复在使用sizeclass时对位置对象进行克隆的一个BUG。这个BUG可能导致在不同sizeclass下位置设置被覆盖的问题。
2. 修复相对布局下一组视图在高度或者宽度自适应下无法垂直居中或者水平居中的[BUG#103](https://github.com/youngsoft/MyLinearLayout/issues/103)
3. 修复框架布局MyFrameLayout设置高度自适应时，当其中的子视图隐藏或者恢复隐藏时自适应高度无法更新的[BUG#99](https://github.com/youngsoft/MyLinearLayout/issues/99)
4. 修复了流式布局在设置了子视图水平间距和垂直间距的情况下右对齐和底部对齐的BUG。





---
## [V1.8.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.8.0)(2019/06/25)

#### Fixed

1. 重构线性布局，精简实现逻辑和代码。
2. 针对各种布局下的子视图的尺寸约束能力做了扩展。原先版本中只有相对布局中的子视图可以设置尺寸依赖任意其他子视图，而其他布局中的子视图只有有限的约束依赖能力。新版本中这些约束依赖得到增强，几乎所有布局下的子视图都可以支持自身宽度等于自身高度，以及尺寸依赖其他子视图的情况。[issue#94](https://github.com/youngsoft/MyLinearLayout/issues/94)
3. 修复当将布局视图作为UIScrollView下的容器视图同时UIScrollView支持放大缩小能力时，在屏幕旋转时可能会产生的BUG。[issue#93](https://github.com/youngsoft/MyLinearLayout/issues/93)
4. 修复了布局视图的尺寸自适应能力和AutoLayout结合后，布局视图添加删除子视图后要手动代码进行布局视图尺寸自适应的刷新问题。[issue#95](https://github.com/youngsoft/MyLinearLayout/issues/95)
5. 修复相对布局子视图隐藏时，其他依赖这个子视图的子视图的位置和尺寸不正确更新的问题。
6. 修复UIImageView的宽度固定高度自适应的问题。
7. 支持通过对isMyLayouting进行KVO监听来实现布局的通知处理机制，我们可以通过KVO布局视图的isMyLayouting属性来或者布局完成后子视图的frame以及布局视图的frame值了。
8. 下列方法或属性名被列为过期，并推荐使用新的方法名和属性名：

```
+[MyBaseLayout myUpArabicUI:(BOOL)isArabicUI inWindow:(UIWindow *)window]  ==>  +[MyBaseLayout updateRTL:(BOOL)isRTL inWindow:(UIWindow *)window]
  
-[UIView myVisibility]  ==>  -[UIView visibility]
  
-[UIView myAlignment] == > -[UIView alignment]
   
```


## [V1.7.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.7.0)(2019/05/16)
#### Added
1. 添加了对MyLayout的尺寸自适应和AutoLayout结合的能力。AutoLayout能使用和UILabel一样的MyLayout布局视图中的高度和宽度自适应的设置。具体需求见[issue#79](https://github.com/youngsoft/MyLinearLayout/issues/79)。这个问题的解决得到简化处理。新版本的能力让UITableViewCell的高度自适应的能力得到简化。具体的代码演示见[AllTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/AllTest1ViewController.m)，以及[AllTest12ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/AllTest12ViewController.m)中的详细介绍。

 2.  添加了对RTL设置的即时生效的能力，您可通过方法`+[MyBaseLayout myUpArabicUI:(BOOL)isArabicUI inWindow:(UIWindow *)window
`来设置，具体的功能实现要感谢[LAnqxpp](https://github.com/LAnqxpp)的贡献。
#### Fixed
1. 修复了在完成布局后再对子视图设置约束时子视图约束不起作用的[BUG#90](https://github.com/youngsoft/MyLinearLayout/issues/90)。当代码中不对布局视图中的子视图设置任何约束时就会出现这个问题，这个问题涉及到所有布局。
2. 修复了相对布局可能会产生尺寸无限大的问题，尤其是当相对布局的高度为自适应，并且相对布局中同样存在着具有高度自适应的子布局视图的情况。


## [V1.6.1](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.6.1)(2018/09/29)
#### Fixed
1. 修复对所有iPhoneX系列的设备的布局视图在设置padding的值为safeAreaMargin时的BUG。
2. 添加对Application Extension上使用布局库视图的支持。[BUG#81](https://github.com/youngsoft/MyLinearLayout/issues/81)


## [V1.6.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.6.0)(2018/08/04)

#### Added
1. 添加布局属性`layoutTransform`,用来实现对布局内子视图的整体位置变换，可以通过这个属性来实现一般常见的平移，缩放，水平翻转，垂直翻转等功能。具体的DEMO在新增加的[AllTest11ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/AllTest11ViewController.m)中可以查看。
2. 为流式布局`MyFlowLayout`支持子视图固定尺寸并且间距动态拉伸调整的能力，你可以通过设置流式布局的方法：`setSubviewsSize:minSpace:maxSpace:`来实现，这个方法原先只支持内容约束流式布局，现在新版本对数量约束流式布局也同样支持了。具体的DEMO在新增加的[FLLTest8ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FLLTest8ViewController.m)中可以查看。

#### Fixed
1. 修复了UILabel等控件的尺寸设置了wrapContentHeight或者wrapContentWidth为YES并且同时又设置了最大最小尺寸时，在相对布局内进行尺寸计算内可能会出现的问题。
2. 修复了通过Carthage引入库时出现符合以及文件无法找到的问题。


## [V1.5.3](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.5.3)(2018/05/11)

#### Added
1.添加了流式布局`MyFlowLayout`对瀑布流的支持，主要是数量约束流式布局来实现，通过设置`autoArrange`为YES或者设置`arrangedGravity`属性为`MyGravity_Horz_Between或者MyGravity_Vert_Between`来实现两种不同策略的瀑布流模式，瀑布流模式其实就是一种紧凑的流式布局排列方式。具体的DEMO在新增加的[FLLTest7ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FLLTest7ViewController.m)中可以查看。

#### Fixed
1. 修复了流式布局`MyFlowLayout`中的arrangedGravity属性设置和子视图的myAlignment属性同时设置时有可能对齐方式不正确的问题，以及gravity属性设置后停靠有可能不正确的问题。
2. 优化和修复了对UIScrollView+布局视图时，设置UIScrollView的高度或者宽度由布局视图的尺寸进行自适应的问题。新版本中UIScrollView的尺寸可以依赖于布局视图的尺寸，同时布局视图的最大最小尺寸可以设置为UIScrollView的尺寸。具体例子参考：[FLLTest7ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FLLTest7ViewController.m)
3. 添加了对`myTop,myBottom,myLeft,myRight,myLeading,myTrailing,mySize,myWidth,myHeight,myMargin, myHorzMargin, myVertMargin`的读取使用的告警处理！一般情况下这些属性只能用于设置具体的数值，而不能用来获取某个尺寸，get方法也并不代表着视图的约束尺寸，这个点切记，切记。
4. 添加了对布局视图的`cacheEstimatedRect`属性的使用限制说明，这个属性只能用于那些需要高度自适应的UITableViewCell的根布局视图中使用，其他地方如果使用则有可能会出现计算不正确的问题。
5. 恢复了对XCODE8.0以前的编译器版本使用MyLayout的支持。



## [V1.5.2](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.5.2)(2018/05/06)

#### Fixed
1. 修复路径布局`MyPathLayout`中的方法`getSubviewPathPoint`可能产生数组越界的问题。
2. 修复路径布局中的`MyPathSpace`的初始化方法和蓝牙框架一起使用时可能会出现编译时错误的问题。[BUG#70](https://github.com/youngsoft/MyLinearLayout/issues/70)
3. 修复表格布局`MyTableLayout`的行高是MyLayoutSize.wrap时，并且又设置了智能边界线时，列子视图的边界线显示不完整的问题。[BUG#71](https://github.com/youngsoft/MyLinearLayout/issues/71)
4. 修复了一些编译和分析有可能会产生报警的代码。
5. 提供了新的关于表格布局的DEMO：[TLTest4ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/TLTest4ViewController.m)


## [V1.5.1](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.5.1)(2018/04/23)

#### Added
1. 添加了对浮动布局MyFloatLayout中的子视图的行或者列内对齐方式的设置，您可以借助子视图的myAlignment属性来设置行或者列内的对齐方式，具体的DEMO请参考：[FOLTest7ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/FOLTest7ViewController.m) 中的介绍。
2. 将所有设置为过期的方法删除。
3. 修正一些编译上的告警以及一些和Masonry公用时的一些问题。
4. 修复方向旋转时有可能不调用`rotationToDeviceOrientationBlock`的问题。
5. 修正一些注释上的提示。
6. 将网友提交合并的代码一起发布新的版本。



## [V1.5.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.5.0)(2017/10/9)

#### Added
1. 添加新的布局种类：**栅格布局(MyGridLayout)**。栅格布局是一种将矩形区域划分为多个子矩形区域，并将这个划分一直持续下去的机制，然后再将子视图填充到对应的栅格区域里面的一种布局视图。栅格布局特别适合于动态布局，布局样式可以从服务器动态下发，并且可以用JSON格式的语言来描述这种布局结构，具体请参考新增加的栅格布局和对应的DEMO。以及对应的说明文档：[栅格布局介绍](http://bicyclering.com/2017/09/01/IOS-UIViewLayout-%E5%B8%83%E5%B1%80-MyLinearLayout/#more)
2. 添加了对 **基线对齐baseline**的支持[issue:#43](https://github.com/youngsoft/MyLinearLayout/issues/43)，目前只有**水平线性布局(MyLinearLayout)**和**相对布局(MyRelativeLayout)**支持基线对齐。
    1. 在**MyGravity**中添加了`MyGravity_Vert_Baseline`的枚举定义来支持线性布局的基线对齐，并且在线性布局中添加了一个属性：`baselineBaseView`来指定某个基线基准视图。同时在布局视图的gravity属性中支持对`MyGravity_Vert_Baseline`的设置。具体例子参考：[LLTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/LLTest1ViewController.m)

    2. 在UIView的扩展属性中增加了一个扩展属性：`baselinePos`。你可以在相对布局中的子视图使用这个属性来进行基线对齐的设置。具体例子请参考：[RLTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/RLTest1ViewController.m)

3. 添加对Apple TV_OS 的支持，您可以用MyLayout来开发apple TV方面的应用。
4. **MyLayoutPos**中增加了一个特殊的值`safeAreaMargin`用来支持对iOS11应用的适配。
5. 添加对所有设备完美适配的例子，具体看各个DEMO。

#### Change
1. 优化DEMO的目录结构。以便展示更加合理和查找方便。
2. 支持在XCODE8下编译MyLayout的能力。[issue:#54](https://github.com/youngsoft/MyLinearLayout/issues/54)
3. 优化库的文件结构和文件列表。
4. 将原先表格布局中的宏`MTLSIZE_AVERAGE,MTLSIZE_WRAPCONTENT,MTLSIZE_MATCHPARENT`这三个宏设置为过期，将这三个值放入了MyLayoutSize类中的三个类属性：`wrap, fill, average`中。
5. 优化在各种分辨率下的逻辑点的四舍五入的逻辑，原先老的版本的四舍五入逻辑不正确。

#### Fixed
1. 修复各种布局下均分尺寸时可能会中间留出一个像素空间的问题。
2. 修复相对布局下某个子视图固定，其他子视图均分剩余尺寸的问题[BUG#53](https://github.com/youngsoft/MyLinearLayout/issues/53)
3. 优化V1.4.3版本中insetsPaddingFromSafeArea的默认属性设置导致UITableView的中的cell往下偏移，以及iOS11下的多余偏移的问题。


## [V1.4.3](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.4.3)(2017/9/22)

#### Added
1. 添加适配iOS11的能力以及**iPhoneX**的方法。基本不需要改动当前代码。如果需要改动只需要设置根布局视图的一些属性即可。
  1. 新增布局视图属性：`insetsPaddingFromSafeArea`用来设置在哪个方向缩进对应方向的安全区域。
  2. 新增布局视图属性：`insetLandscapeFringePadding`用来设置当支持横屏时，并且insetsPaddingFromSafeArea设置为左右缩进时，是否只缩进有刘海的那一边。这个属性默认设置为NO，表示两边都缩进。您可以在特殊需要时将这个属性设置为YES表示只缩进刘海那一边，非刘海那一边则不缩进。具体参考使用DEMO：[LLTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/LLTest1ViewController.m)

#### Changed
1. 布局方法：`estimateLayoutRect`设置为过期，请用`sizeThatFits`方法来代替，方法换名字的原因是iOS的默认sizeThatFits本来就是用来进行尺寸评估的，所以没有必要用新方法。
2. 修复了流式布局`MyFlowLayout`中当使用`pageCount`设置分页而里面的子视图是布局视图并设置了wrapContentHeight或wrapContentWidth方法时有可能会导致约束冲突而产生死循环的问题。
3. 修复了当布局视图支持事件处理并设置了按下高亮和透明效果时，如果同时触摸多个地方则有可能导致布局视图的高亮和透明效果无法还原的问题。


## [V1.4.2](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.4.2)(2017/8/31)

#### Added
1. 表格布局MyTableLayout添加了`addRow:colCount:`方法，目的是为了支持那些列数固定并且宽度固定的需求，具体例子见DEMO：[TLTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/TLTest1ViewController.m)中的第五行的代码。
2. 添加了布局视图的高度等于非布局父视图宽度以及布局视图宽度等于非布局父视图高度的支持，目的是为了支持对布局视图进行旋转`transform`的支持。
3. 添加了框架布局MyFrameLayout中子视图的高度等于另外视图宽度以及宽度等于另外视图高度的支持。
4. 下一个版本将会有重大功能的添加：栅格布局的支持、基线对齐的支持、均分的再次优化等等功能，敬请期待吧。。

#### Fixed
1. 修复了线性布局中的子视图设置为weight=1来均分布局视图的尺寸时，有可能导致产生中间缝隙的BUG。以及子视图的总尺寸和布局视图尺寸不相等的BUG。
2. 修复了当对布局视图进行多点触摸且设置了布局视图的触摸事件时，有可能会对对应的触摸动作不调用而产生触摸状态无法被恢复的问题。
3. 调整了将原始逻辑点转化为可显示逻辑点的算法，老算法计算可能不精确。

## [V1.4.1](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.4.1)(2017/6/22)
#### Fixed
1. 修复了布局视图套布局视图，然后都具有wrapContentWidth或者wrapContentHeight属性时界面有可能进入死循环的问题，尤其是iPhonePlus设备。


## [V1.4.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.4.0)(2017/6/16)

#### Added
1. 添加了布局视图的新属性：`selected`,这个属性用来记录布局视图的选中和未选中状态
2. 添加了布局视图删除所有子视图的快捷方法：`removeAllSubviews`。


#### Fixed
1. 修复子视图宽高铺满布局视图并设置背景色时边界线不显示的问题。
2. 修复了浮动布局`MyFloatLayout`中当子视图同时设置了`clearFloat`和`weight`的时候有可能尺寸显示不正确的问题。修复了[#BUG42](https://github.com/youngsoft/MyLinearLayout/issues/42)
3. 修复了线性布局`MyLinearLayout`和框架布局`MyFrameLayout`同时设置左右或者上下边距和居中时的尺寸不正确的问题。
4. 优化了位置和尺寸计算时的精度问题，老版本中有可能会出现比如12.99999999999998的场景，新版本将会减少这种情况的发生而直接设置为13. 同时对所有的布局中的大小比较进行了精度限制的优化。



## [V1.3.9](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.9)(2017/6/12)

#### Fixed
1. 修复了[#BUG41](https://github.com/youngsoft/MyLinearLayout/issues/41)。原因是当左右两边的子视图尺寸有重合并且高度或者宽度相等时没有将两边的占用区域进行合并，从而影响了新加入的子视图的尺寸设置。
2. 修复了[#BUG40](https://github.com/youngsoft/MyLinearLayout/issues/40)。原因是当UIScrollView的contentOffset值为负数时，如果修改视图的frame值将会把contentOffset的值重置为0.这个是一个系统的特性，因此解决的方案是不修改frame而是修改bounds和center两个属性。
3. 修复了[#BUG39](https://github.com/youngsoft/MyLinearLayout/issues/39)。原因是当设置视图的frame的pt值时如果pt值无法转化为有效的设备的物理像素时将会出现：**文字模糊发虚、线发虚、以及文字无法多行显示、以及当使用layer的cornerRadius时无法绘制出正确的圆形的问题**。因此解决的方案是在布局完成后设置frame时会将pt值四舍五入转化为最小的可显示的物理像素值。



## [V1.3.8](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.8)(2017/6/2)

#### Fixed
1. 修复了1.3.7中对UILabel设置为`wrapContentWidth`时又同时在相对布局中同时设置了`topPos`和`bottomPos`时高度不正确的问题。这个问题在1.3.7中的Fixed#3条目中没有修复正确。


## [V1.3.7](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.7)(2017/6/1)

#### Added
1. 对视图添加了属性`myVisibility`，这个属性是对视图的hidden属性的扩展，除了可以控制视图的隐藏和显示外还可以控制视图隐藏时是否仍然占位布局。（具体参见RLTest2ViewController）
2. 对视图添加了属性`myAlignment`，这个属性只在线性布局、框架布局、表格布局、流式布局中起作用，它用来设置某个视图的停靠和对齐属性。当对某个布局视图设置`gravity`属性实现整体的停靠和对齐时，如果某个子视图想单独处理停靠则可以用这个属性来单独设置。（具体参见LLTest3ViewController）
3. 添加了`MyDimeScale`的四个方法：`roundNumber,roundPoint,roundSize,roundRect`来分别实现入参为小数时的设备逻辑点值到最小可转化为物理像素的有效设备点值的转化。
4. 添加了对carthage的支持。

#### Changed
1. 将布局视图的属性`hideSubviewReLayout`置为无效，布局视图不再提供对隐藏视图的是否占位的处理了，而是通过新增加的视图的扩展属性`myVisibility`来实现。
2. 将相对布局视图的属性:`flexOtherViewWidthWhenSubviewHidden`和`flexOtherViewHeightWhenSubviewHidden`属性置为无效，布局视图不再提供对隐藏视图的是否占位的处理了，而是通过新增加的视图的扩展属性`myVisibility`来实现。
3. 将原先线性布局、流式布局、浮动布局中的`gravity`属性提升到了布局基类中，目前线性布局、流式布局、浮动布局、和框架布局都支持`gravity`的设置。
4. 进一步优化了布局视图的性能，表现为对KVO监听的延迟处理和优化。
5. 进一步优化了布局视图的内存占用尺寸，将布局视图中对触摸事件处理的变量变为按需要才创建，以及布局视图的边界线对象也改为了按需要才建立，这两部分按需处理机制将有效的减少了布局视图的内存占用。
6. 为了更进一步的优化和简化MyLayout对UITableviewCell高度自适应的处理，新版本中对实现的解决方案进行优化处理，具体详情请参考：[AllTest1ViewController](https://github.com/youngsoft/MyLinearLayout/blob/master/MyLayoutDemo/AllTest1ViewController.m)中的介绍
7. 优化工程目录结构。


#### Fixed
1. 修复了[#BUG37](https://github.com/youngsoft/MyLinearLayout/issues/37)。原因是对`UILabel`或者`UITextView`或者`UIButton`进行尺寸和位置计算时如果得到值并不是最小的有效的设备逻辑点，导致当逻辑点映射到像素显示时模糊不清晰，以及可能会在边缘多出黑色的线条。对于2倍像素的设备来说要求逻辑点的值必须是1/2的倍数。而对于3倍像素的设备来说要求逻辑点的值必须是1/3的倍数。
2. 修复了路径布局`MyPathLayout`中的一个子视图位置可能显示不正确的BUG。原因就是在进行子视图之间的间距的长度逼近时有可能步长再小也无法满足条件时造成子视图显示重叠的问题。
3. 修复了`UILabel`设置为`wrapContentWidth`时而没有指定高度时有可能不显示的BUG。原因是使用者可能没有指定高度，这次系统默认为他指定高度来解决这个问题。
4. 修复了边界线`MyBorderline`的`thick`属性如果设置小于1而出现移动时不停闪烁的:[#BUG38](https://github.com/youngsoft/MyLinearLayout/issues/38)。同时修复了边界线在不同分辨率设备下的显示的粗细不同问题。原因是如果thick过小则因为设备逻辑点映射到物理像素的问题导致刷新闪烁的问题。
5. 修复了iOS7系统中对`MyLayoutPos`的`equalTo`方法设置为`UILayoutSupport`类型值的BUG，导致无法正确的下移。原因是iOS7中对UIViewController中的topGuide和bottomGuide的实现默认的是一个UIView导致在判断时将他当做一个普通的视图来处理了。
6. 修复了路径布局`MyPathLayout`的中心点子视图`originView`的`layer.anchorPoint`的设置不为默认值时的位置frame显示不正确的问题。
7. 修复了当使用1.3.6版本中的`cacheEstimatedRect`属性来缓存UITableviewCell高度时的UITableviewCell的根布局视图的高度可能为0的BUG。
8. 修复了iOS7的对横竖屏size class切换无效的BUG。


## [V1.3.6](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.6)(2017/5/5)

#### Added
1. 添加了对阿拉伯国家的从右往左方向布局的功能[#issue33](https://github.com/youngsoft/MyLinearLayout/issues/33)。系统提供了一个类属性：`isRTL`来实现对RTL布局的支持。同时为了支持RTL系统增加了UIView的扩展属性：`leadingPos, trailingPos, myLeading,myTrailing`用来实现头部和尾部的方向，MyBaseLayout则添加了`leadingPadding,trailingPadding`用来实现内边距的RTL支持。而边界线则增加了`leadingBorderline, trailingBorderline`属性来支持RTL。同时新增了`MyGravity_Horz_Leading,MyGravity_Horz_Trailing`两个停靠属性。下面的表格是介绍这些属性的意义。

所属类名|新属性|等价于LRT方向布局|等价于RTL布局方向
-------|---------------|---------------|------------
UIView(MyLayoutExt)|leadingPos|leftPos|rightPos
UIView(MyLayoutExt)|trailingPos|rightPos|leftPos
UIView(MyLayoutExt)|myLeading|myLeft|myRight
UIView(MyLayoutExt)|myTrailing|myRight|myLeft
MyBaseLayout|leadingPadding|leftPadding|rightPadding
MyBaseLayout|trailingPadding|rightPadding|leftPadding
MyBaseLayout|leadingBorderline|leftBorderline|rightBorderline
MyBaseLayout|trailingBorderline|rightBorderline|leftBorderline
MyGravity|MyGravity_Horz_Leading|MyGravity_Horz_Left|MyGravity_Horz_Right
MyGravity|MyGravity_Horz_Trailing|MyGravity_Horz_Right|MyGravity_Horz_Left

    如果您的界面布局不需要考虑RTL以及对阿拉伯国际的支持则不需要使用上述新添加的属性。

2. 添加了UIView扩展新属性`wrapContentSize`用来简化对`wrapContentHeight和wrapContentWidth`的设置。这个属性尤其对`UILabel`有用，表示视图的尺寸由内容自适用。
3. 实现了对UILabel的`text`和`attributedText`进行设置后自动布局的功能，老版本的代码中每次设置完毕text值后要调用一下sizeToFit来激发布局，新版本自动添加了这个功能，使得不需要明确调用sizeToFit了。但是这样的前提是您必须对UILabel设置了wrapContentHeight或者wrapContentWidth。
4. 对布局类添加新属性`cacheEstimatedRect`，这个属性用来和高度自实用的UITableViewCell结合使用能大幅度的提供布局计算的性能。这个属性提供了缓存一次尺寸评估的机制，使得当存在有复用的cell时减少布局的计算。 具体例子参考(DEMO:AllTest1TableViewCell)
5. MyLayoutPos对象的equalTo方法的val值新增加了对UIView对象的支持，可以直接设置某个视图的位置等于另外一个视图，表示等于另外一个视图的对应的位置；另外val的值还支持对id<UILayoutSupport>对象的支持，比如topPos可以等于视图控制器的topLayoutGuide属性，bottomPos可以等于视图控制器的bottomLayoutGuide属性，这样就可以使得某个布局视图下的子视图的位置不会延生到导航条下面去。具体请参考DEMO:LLTest1ViewController。
6. MyLayoutSize对象的equalTo方法的val值新增加了对UIView对象的支持，可以直接设置某个视图的尺寸等于另外一个视图，表示等于另外一个视图的对应的尺寸。
7. 对边界线类`MyBorderline`增加属性`offset`可以实现边界线绘制的偏移位置，而不是默认的在视图的边界上。

#### Fixed
1. 修复了将一个布局视图加入到SB或者XIB上时同时设置了四周边距而不起作用的[#BUG36](https://github.com/youngsoft/MyLinearLayout/issues/36)。具体解决的方法是实现了MyBaseLayout的awakeFromNib方法，然后在里面更新了布局。
2. 修复了框架布局`MyFrameLayout`和相对布局`MyRelativeLayout`中计算`wrapContentSize`时可能计算错误的BUG。

#### Changed
1.  为了和[TangramKit](https://github.com/youngsoft/TangramKit)库保持一致，对一些名字进行了统一的定义。下面表格列出了新旧名称的定义变化。

所属类名|新定义|老定义|
------------|---------------|---------------
MyOrientation|MyOrientation|MyLayoutViewOrientation
MyOrientation|MyOrientation_Vert|MyLayoutViewOrientation_Vert
MyOrientation|MyOrientation_Horz|MyLayoutViewOrientation_Horz
MyAdjustScrollViewContentSizeMode|MyAdjustScrollViewContentSizeMode|MyLayoutAdjustScrollViewContentSizeMode
MyAdjustScrollViewContentSizeMode|MyAdjustScrollViewContentSizeModeAuto|MyLayoutAdjustScrollViewContentSizeModeAuto
MyAdjustScrollViewContentSizeMode|MyAdjustScrollViewContentSizeModeNo|MyLayoutAdjustScrollViewContentSizeModeNo
MyAdjustScrollViewContentSizeMode|MyAdjustScrollViewContentSizeModeYes|MyLayoutAdjustScrollViewContentSizeModeYes

    如果您要替换掉所有老方法和属性(建议替换)，则您可以按照如下步骤来完成代码的替换工作：
 
             1. 查找所有：MyLayoutViewOrientation_  并替换为MyOrientation_  (选择Containning, 查找后选择preview，然后把除MyLayout库之外的其他都替换掉）
             2. 查找所有：MyLayoutAdjustScrollViewContentSizeMode  并替换为MyAdjustScrollViewContentSizeMode  (选择Containning, 查找后选择preview，然后把除MyLayout库之外的其他都替换掉）


2. 新版本优化了布局库的子视图构建性能和布局性能。下面表格是新旧版本各布局视图内单个子视图在iPhone6真机设备下的构建和布局时长值(单位是毫秒ms)

create time|1.3.6|1.3.5|提升%|layout time|1.3.6|1.3.5|提升%
-------|---|---|----|----|----|-------|--------
MyLinearLayout|0.164|0.211|28%||0.049|0.160|226%
MyFrameLayout|0.149|0.212|42%||0.042|0.142|234%
MyRelativeLayout|0.182|0.215|18%||0.068|0.137|101%
MyFlowLayout|0.107|0.146|37%||0.036|0.111|210%
MyFloatLayout|0.148|0.147|-0.48%||0.055|0.117|113%
MyTableLayout\*|||
MyPathLayout\*|||

    这里没有提供表格布局和路径布局数据是因为表格布局就是一种线性套线性的线性布局，路径布局则没有进行多少优化。下面的一个表格则是单个视图分别在MyLayout,frame,AutoLayout,Masonry,UIStackView5种布局体系下的构建和布局时长对比值。
    
create time|Frame|MyLayout|AutoLayout|Masonry|UIStackView    
-------|-----|------|---------|----------|-----
MyLinearLayout|0.08|0.164|0.219|0.304|0.131
MyFrameLayout|0.05|0.149|0.209|0.273|0.131
MyRelativeLayout|0.079|0.182|0.116|0.359|0.131
MyFlowLayout|0.08|0.107|0.198|0.258|0.131
MyFloatLayout|0.044|0.148|0.203|0.250|0.131



layout time |Frame|MyLayout|AutoLayout|Masonry|UIStackView    
-------|-----|-------|--------|--------|-------
MyLinearLayout|0|0.049|0.269|0.269|0.272
MyFrameLayout|0|0.042|0.243|0.243|0.272
MyRelativeLayout|0|0.068|0.274|0.274|0.272
MyFlowLayout|0|0.036|0.279|0.279|0.272
MyFloatLayout|0|0.055|0.208|0.208|0.272

  从上面的表格中我们得出如下结论[issue#25](https://github.com/youngsoft/MyLinearLayout/issues/25)：
  1. 用frame构建视图用时最少，平均每个视图花费0.068ms。当视图的frame指定后就不再需要布局视图了，所以布局时间几乎是0。
  2. 当用AutoLayout进行布局时每个子视图的平均构建时长约为0.189ms，而Masonry因为是对AutoLayout的封装所以平均构建时长约为0.289ms。在布局时则因为都是使用了AutoLayout所以是相等的，大概花费0.255ms左右。
  3. MyLayout的实现因为是对frame的封装，所以无论是构建时长和布局时长都要优于AutoLayout，但低于原始的frame方法。MyLayout的平均构建时长约0.150ms，比frame构建要多花费2.2倍的时间；而AutoLayout的平均构建时长是MyLayout的1.26倍；Masonry的平均构建时长则是MyLayout的1.9倍。
  4. MyLayout的平均布局时长是0.05ms, 而AutoLayout的布局时长则是MyLayout的5倍。
  5. UIStackView的构建时长要稍微优于MyLayout的线性布局MyLinearLayout.但是布局时长则是MyLinearLayout的5.5倍。
  6. MyLayout中流式布局MyFlowLayout的构建时长和布局时长最小，而相对布局的构建和布局时长最长。



## [V1.3.5](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.5)(2017/4/11)

#### Added
1. 线性布局`MyLinearLayout`中的`shrinkType`属性增加了对`MySubviewsShrink_Space`枚举的支持，也就是可以支持当子视图的尺寸大于布局的尺寸时会自动压缩子视图之间的间距。具体例子参见（DEMO:AllTest7ViewController）中最后一个小例子。
2. 添加了同时设置左右边距的`horzMargin`和同时设置上下边距的`vertMargin`两个视图的扩展属性，方便进行左右和上下边距的设置。

#### Fixed
1. 修复了数量约束流式布局`MyFlowLayout`中当最后一行的数量等于每行的数量时无法拉伸间距的[#BUG35](https://github.com/youngsoft/MyLinearLayout/issues/35)。


#### Changed
1.  大大优化了布局库里面布局位置对象和布局尺寸的内存占用问题，将原来的每个视图都会建立18个布局位置对象和6个布局尺寸对象变化为了只按需要才建立，也就是只有用到了某个位置和某个尺寸才会建立的懒加载模式，这样减少了将近10倍的对象数量的创建，同时还优化了性能和布局的速度：比如屏幕旋转，sizeclass类型的获取，以及布局扩展属性的获取都进行优化处理。
2. 对代码进行了规范化整理，对所有内部的方法都以my开头，并进行了分类处理。这样便于管理和理解。
3. V1.3.5中对布局库中的一些方法名或者属性名进行了重新命名处理，目的是为了使命名更加规范合理，以及和TangramKit更加保持一致。下面列出了名字变更的列表：


所属类(class)|老命名(old name)|新命名(new name)
------------|---------------|---------------
UIView(MyLayoutExt)|myTopMargin|myTop
UIView(MyLayoutExt)|myLeftMargin|myLeft
UIView(MyLayoutExt)|myBottomMargin|myBottom
UIView(MyLayoutExt)|myRightMargin|myRight
UIView(MyLayoutExt)|myCenterXOffset|myCenterX
UIView(MyLayoutExt)|myCenterYOffset|myCenterY
UIView(MyLayoutExt)|myCenterOffset|myCenter
UIView(MyLayoutExt)|widthDime|widthSize
UIView(MyLayoutExt)|heightDime|heightSize
UIView(MyLayoutExt)|flexedHeight|wrapContentHeight
MyBaseLayout|subviewMargin|subviewSpace
MyBaseLayout|subviewVertMargin|subviewVSpace
MyBaseLayout|subviewHorzMargin|subviewHSpace
MyBaseLayout|leftBorderLine|leftBorderline
MyBaseLayout|rightBorderLine|rightBorderline
MyBaseLayout|topBorderLine|topBorderline
MyBaseLayout|bottomBorderLine|bottomBorderline
MyBaseLayout|boundBorderLine|boundBorderline
MyBaseLayout|IntelligentBorderLine|intelligentBorderline
MyBaseLayout|notUseIntelligentBorderLine|notUseIntelligentBorderline
MyBorderline|MyBorderLineDraw|MyBorderline
MyGravity|MyMarginGravity|MyGravity
MyGravity|MyMarginGravity_XXXX|MyGravity_XXXX
MyLinearLayout|averageSubviews:|equalizeSubviews:
MyLinearLayout|averageSubviews:inSizeClass:|equalizeSubviews:inSizeClass:
MyLinearLayout|averageSubviews:withMargin|equalizeSubviews:withSpace
MyLinearLayout|averageSubviews:withMargin:inSizeClass:|equalizeSubviews:withSpace:inSizeClass:
MyLinearLayout|averageMargin:|equalizeSubviewsSpace:
MyLinearLayout|averageMargin:inSizeClass:|equalizeSubviewsSpace:inSizeClass:
MyTableLayout|rowSpacing|subviewVSpace
MyTableLayout|colSpacing|subviewHSpace

非常抱歉进行了这么多名称的变更。现在是将所有老的属性和方法名都设置为了过期属性和方法，并且依然能够使用，但是会报告警。
> 为了保持对老版本的兼容性，您可以在**PCH文件，或者MyLayout.h的头文件引用前，或者工程设置中** 加入宏定义： \#define MY_USEOLDMETHODNOWARNING = 1  样就不会产代码中使用老方法名而报警了。

 如果您要替换掉所有老方法和属性(建议替换)，则您可以按照如下步骤来完成代码的替换工作：
 
     1. 查找所有：MyMarginGravity_   并替换为MyGravity_  (选择Containning, 查找后选择preview，然后把除MyLayout库之外的其他都替换掉）
     2. 把所有.myLeftMargin, .myRightMargin, .myTopMargin, .myBottomMargin,  .myCenterXOffset, .myCenterYOffset, .myCenterOffset 分别替换为.myLeft, .myRight, .myTop, .myBottom, .myCenterX, .myCenterY, .myCenter (选择Matching模式)
     3. 把所有.widthDime替换为.widthSize, .heightDime替换为.heightSize (选择Matching模式)
     4. 把所有.subviewMargin替换为.subviewSpace, .subviewVertMargin替换为.subviewVSpace, .subviewHorzMargin替换为.subviewHSpace  (选择Matching模式)
    5. 把所有的MyBorderLineDraw替换为MyBorderline（选择Matching模式 并注意MyBaseLayout.h中的不要替换）
    6. 把.leftBorderLine替换为.leftBorderline,  .rightBorderLine替换为.rightBorderline,  .topBorderLine替换为.topBorderline,  .bottomBorderLine替换为.bottomBorderline,  .IntelligentBorderLine替换为.intelligentBorderline, .notUseIntelligentBorderLine替换为.notUseIntelligentBorderline（选择Matching模式）
    7. 把averageSubviews:方法替换为equalizeSubviews: 把averageMargin:替换为equalizeSubviewsSpace: (注意不要替换MyLinearLayout.h和MyLinearLayout.m中的部分)



## [V1.3.4](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.4)(2017/3/04)

#### Added
1. 布局视图添加了新方法`-(CGRect)subview:(UIView*)subview estimatedRectInLayoutSize:(CGSize)size`用来评估一个将要加入布局视图的子视图的frame值。这个方法通常用来实现一些子视图在布局视图之间移动的动画效果的能力。具体例子参见（DEMO:AllTest4ViewController）

#### Changed
1. 优化了当将一个布局视图作为视图控制器的根视图时(self.view)的一些属性设置可能导致约束冲突，和可能导致将控制器中的视图加入到一个滚动视图时无法滚动的问题。
2. 将线性布局`MyLinearLayout`中的shrinkType属性的默认值由原来的`MySubviewsShrink_Average`改为了`MySubviewsShrink_None`，也就是默认是不压缩的。
3. 修正了相对布局中的子视图设置`useFrame`为YES时，子视图无法自由控制自己的frame的问题。
4. 优化了所有类以及方法和属性以及各种类型的注释，注释更加清晰明了。同时优化了所有DEMO中的注释信息。
5. 在布局视图以及一些扩展视图中增加了IBInspectable标识，以便更好的和XIB以及SB编程结合。

## [V1.3.3](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.3)(2017/2/24)

#### Added
1. 线性布局`MyLinearLayout`中的`shrinkType`中添加了一个可设置的值`MySubviewsShrink_Auto` 这个值的目的是为了解决水平线性布局里面当有左右2个子视图的宽度都不确定，但又不希望2个子视图不能重叠展示的问题。具体例子参见（DEMO:AllTest7ViewController 中的第4个例子）。
2. 布局视图添加了属性`zeroPadding`用来描述当布局视图的尺寸由子视图决定，并且当布局视图中没有任何子视图时设置的padding值是否会参与布局视图尺寸的计算。默认是YES，当设置为NO时则当布局视图没有子视图时padding是不会参与布局视图尺寸的计算的。具体例子参见 （DEMO: LLTest4ViewController）
3. 添加了线性布局、流式布局、浮动布局的initWithFrame的方法，这样你就可以用这个方法来指定frame值了。
4. 添加了对普通视图的`wrapContentHeight`和`wrapContentWidth`的支持，这两个属性由原来的布局视图属性移植到了所有视图的扩展属性中。这样对于一个非布局父视图也可以通过设置`wrapContentHeight`和`wrapContentWidth`来实现其高度和宽度由里面的子布局视图来决定。具体例子参见（DEMO: LLTest4ViewController）。 
5. 添加了对UIButton的宽度固定情况下高度自自适应的支持。

#### Changed
1. 删除框架布局的子视图要通过`marginGravity`的扩展属性来设置位置和尺寸的支持，具体变化参见MyFrameLayout.h中的代替方法。
2. 取消了对自适应高度视图扩展属性`flexedHeight`的支持，将高度自适应设置改为了通过`wrapContentHeight`扩展属性的设置来完成。
3. 优化了通过`makeLayout`来进行布局约束设置的一些方法。
4. 修正了将一个布局视图添加到非布局视图里面后，如果后续调整了布局视图的边界设置后无法更新布局视图尺寸的问题。


## [V1.3.2](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.2)(2017/1/20)

#### Added
1. 流式布局`MyFlowLayout`添加了对分页滚动的支持，通过新增加的属性`pagedCount`来实现，这个属性只支持数量约束流式布局。`pagedCount`和`wrapContentHeight以及wrapContentWidth`配合使用能够实现各种方向上的分页滚动效果(具体见DEMO：FLLTest5ViewController)
2. 线性布局`MyLinearLayout`中完全支持了所有子视图的高度等于宽度的设置的功能，以及在水平线性布局中添加了子宽度等于高度的功能。

#### Changed
1. 流式布局`MyFlowLayout`中的子视图的widthDime,heightDime中可设置的相对类型尺寸的值的维多扩宽，不仅可以依赖兄弟视图，父视图，甚至还可以依赖别的任意的视图。

#### Fixed
1. 修复了[#BUG30](https://github.com/youngsoft/MyLinearLayout/issues/30)，主要原因是当计算出视图的尺寸为小于0时，而又将这个尺寸用来设置视图的bounds属性的尺寸时会调整bounds的origin部分而产生的BUG。具体展示是视图的位置产生了不正确的错误。




## [V1.3.1](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.1)(2016/12/28)

#### Added
1. 布局位置类`MyLayoutPos`和布局尺寸类`MyLayoutSize`类中添加了新属性：`active`.用来描述指定的位置或者尺寸所设置的约束是否有效。
2. 添加了Demo:ALLTest8ViewController这个例子专门用来演示把一个布局视图加入到非布局父视图时的使用方法。

#### Fixed
1. 修正了将一个具有`wrapContentWidth`或者`wrapContentHeight`属性设置的布局视图加入到非布局父视图时，且又设置centerXPos，centerYPos,rightPos,bottomPos来定位布局视图时无法正确定位布局视图位置的BUG。

#### Changed
1. 修改了将布局视图加入`UIScrollView`时会自动调整`UIScrollView`的`contentSize`的机制，新的机制中布局视图设置的`MyLayoutPos`边距值也会算到contentSize里面去。比如某个布局的高度是100，其中的myTopMargin = 10, 那么当将布局视图加入到UIScrollView时他的contentSize的高度则是110.


## [V1.3.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.3.0)(2016/12/21)

#### Added
1. 添加对布局位置类`MyLayoutPos`的方法:`lBound,uBound`用来设置视图的位置最小最大的依赖，`lBound，uBound`方法只有在相对布局中的子视图设置才有效。
2. 添加了Demo:RLTest5ViewController这个例子专门用来演示相对布局中的子视图设置lBound,uBound方法的例子。

#### Fixed
1. 修复路径布局`MyPathLayout`中设置`wrapContentWidth`和`wrapContentHeight`为YES时的计算错误的情况。
2. 修复线性布局`MyLinearLayout`里面均分间距和均分视图两个方法可能导致均分不正确的BUG。
3. 修复了相对布局`MyRelativeLayout`中如果设置了`topPadding`而子视图的`topPos`设置为数值时`topPadding`不起作用的[BUG#29](https://github.com/youngsoft/MyLinearLayout/issues/29)。
4. 修复了相对布局`MyRelativeLayout`中子视图的高度设置为`flexedHeight`时计算可能不正常的问题。

#### Changed
1. 优化了相对布局和框架布局时的性能。

## [V1.2.9](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.9)(2016/12/5)

#### Added
1. **MyMarginGravity**枚举类型添加了`MyMarginGravity_Horz_Between，MyMarginGravity_Vert_Between`两个新的类型的值，用于描述对布局里面子视图的拉伸操作。
2. 扩充了线性布局**MyLinearLayout**中的`gravity`属性的功能（具体见LLTest3ViewController应用）。
3. 扩充了流式布局**MyFlowLayout**中的`gravity`属性的功能(具体见FLLTest1ViewController应用)。
4. 为流式布局**MyFlowLayout**添加了新的方法：`-(void)setSubviewsSize:(CGFloat)subviewSize minSpace:(CGFloat)minSpace maxSpace:(CGFloat)maxSpace` 用来实现内容约束流式布局的动态间距调整的功能，通过这个方法可以实现多屏幕的完美适配。
5. 添加了工程中的单元测试的target和UI单元测试target。

#### Changed
1. 浮动布局**MyFloatLayout**中的方法：~~`-(void)setSubviewFloatMargin:(CGFloat)subviewSize minMargin:(CGFloat)minMargin`~~ 将过期，替换为新的方法：`-(void)setSubviewsSize:(CGFloat)subviewSize minSpace:(CGFloat)minSpace maxSpace:(CGFloat)maxSpace`。
2. 流式布局**MyFlowLayout**中的均分子视图尺寸的属性：~~`averageArrange`~~ 将过期，替换为对`gravity`属性的设置。
3. 对功能中的相同类型的DEMO进行了分组，以便更加方便的查找对应的例子。

#### Fixed
1. 修复了将布局视图添加到非布局父视图时，当父布局视图的位置变化因此布局视图更新布局的问题。

## [V1.2.8](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.8)(2016/11/25)
 
#### Changed
1. 将老版本中的**MyLayoutDime**类更名为**MyLayoutSize**类。
2. 将老版本提供的调试视图布局属性的方法改为了使用`po viewobj.myFrame.sizeClass` 或者 `expr -o -- viewobj.myFrame.sizeClass` 两种方法。


#### Fixed
1. 修复了将布局视图加入到非布局父视图时，而又在布局视图上设置了`transform`进行坐标变换时的布局可能失效的问题。最新版本已经能和视图的`transform`属性共同使用了，原因是老版本中最终进行布局时修改的是frame属性，而新版本中将所有对frame属性的修改都变化为了center和bounds两个属性。
2. 修复了布局里面布局计算时浮点数==, !=, <=, >=比较时可能会出现的精度误差而导致的布局不正确的问题。
3. 修复了流式布局**MyFlowLayout**在设置了间距时且最后一行(一列)设置了比重时的尺寸计算错误的BUG。
4. 修复了框架布局**MyFrameLayout**在iOS7上如果子视图宽度等于高度，且居中对齐时的布局错误的BUG。


##[V1.2.7](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.7)(2016/11/13)
 

#### Added
1. 为线性布局**MyLinearLayout**新增加了属性`shrinkType`。这个属性可以用来控制当子视图中有比重尺寸或者相对间距，而又有固定尺寸比布局视图的尺寸还大时，用于缩小这些固定尺寸视图的尺寸值的方法。(具体见AllTest7ViewController应用)。
2. 为布局视图添加了`rotationToDeviceOrientationBlock`属性。这个block给予用户在布局视图第一次完成或者有屏幕旋转时进行界面布局处理的机会。我们可以通过这个block块来处理设备屏幕旋转而需要改动布局的场景。这个block块不像`beginLayoutBlock`以及`endLayoutBlock`那样只调用一次，而是第一次布局完成以及每次屏幕旋转并布局完成后都会调用，因此要注意循环引用的问题。(具体见LLTest6ViewController应用）。
3. 添加了**MyLayoutDime**中的`uBound`和`lBound`方法中最大最小值设置时可以等于自己的情况，这样目的是为了保证视图本身的尺寸不被压缩。(具体见AllTest7ViewController应用)。
4. 添加了在调试时使用`po 视图对象.absPos.sizeClass` 或者`expr -o -- 视图.absPos.sizeClass` 方法时可以输出布局设置的各种布局属性值。
5. 添加了将布局视图作为非布局视图的子视图的四周边距值可以是相对边距的支持，也就是当布局视图作为非布局视图的子视图时设置的`topPos,rightPos,topPos,bottomPos`的值是大于0且小于1时表明的是相对边距。
6. 添加了AllTest7ViewController这个新的DEMO，用来解决一些实践中各种屏幕尺寸下布局的完美处理方案。

#### Changed 

1. 线性布局**MyLinearLayout**中去掉了当子视图中有设置比重，或者子视图中设置相对间距时而又设置了布局视图的`wrapContentWidth`或者`wrapContentHeight`属性时,`wrapContentWidth`或者`wrapContentHeight`设置失效的限制。(具体见AllTest7ViewController应用)。

#### Fixed
 
1. 线性布局**MyLinearLayout**中的水平线性布局中修复了一个当子视图中有比重尺寸或者相对间距，而又有固定尺寸比布局视图的尺寸还大时，缩小那些具有固定尺寸的子视图的宽度的一个BUG。
2. 修复了视图尺寸**MyLayoutDime**的`uBound,lBound`方法的最大最小尺寸设置为父布局视图时，而布局视图又有`padding`时，没有减去`padding`值的BUG。


## [V1.2.6](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.6)(2016/10/28)

#### Changed
1. 为了解决和**Masonry**两个库共存时，打开了**Masonry**的宏`MAS_SHORTHAND_GLOBALS`时造成`offset, equalTo`方法无法使用的问题，解决的方法是您可以在PCH或者在使用MyLayout.h之前定义：`#define MY_USEPREFIXMETHOD` 这个宏，这样所有**MyLayoutPos, MyLayoutDime**中的方法都增加了前缀my。 比如原来的: `A.leftPos.equalTo(@10) ==> A.leftPos.myEqualTo(@10)`
 
#### Fixed
1. 优化代码，修复一个设置布局尺寸**MyLayoutDime**的`uBound,lBound`方法时可以指定其他任意视图的问题。

## [V1.2.5](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.5)(2016/10/8)

#### Updated
1. 优化了`beginLayoutBlock`和`endLayoutBlock`的调用时机，以及解决了可能这两个block块会出现循环引用的问题，同时优化了`viewLayoutCompleteBlock`可能会出现循环引用的问题
   
#### Fixed
1. 修复了布局视图隐藏属性hidden设置时可能会出现的布局的问题，尤其是当布局视图作为相对布局视图里面的子视图时。

## [V1.2.4](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.4)(2016/8/18)

#### Added
 1. 浮动布局**MyFloatLayout**增加了新属性`noBoundaryLimit`，用来实现那些只要单向浮动且没有边界限制的场景。（具体见FOLTest6ViewController应用）。
 2. 添加了2个DEMO，一个是RLTest4ViewController用来介绍布局在滚动条上滚动式停靠的实现。一个是FOLTest6ViewController用来介绍用浮动布局实现一些用户配置方面的DEMO。
 
#### Updated
1. 优化了布局方法`estimateLayoutRect`，优化了那些布局套布局的尺寸的评估的计算方法，加快了对动态高度评估计算的速度。
  

## [V1.2.3](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.3)(2016/8/2)

#### Added
1. 添加了新的布局：路径布局**MyPathLayout**。通过路径布局您只需要提供一个生成路径曲线的方程、以及指定子视图在路径曲线之中的距离等信息就可以让子视图按照指定的路径曲线进行布局，因此路径布局可以实现一些非常酷炫的效果。(具体见PLTest1,2,3,4ViewController应用）

2. 添加了子视图的新方法:`@property(nonatomic,copy) void (^viewLayoutCompleteBlock)(MyBaseLayout* layout, UIView *v);` 这个方法是在每个子视图布局完成后会调用一次，然后自动销毁。您可以实现这个block来进行一些子视图布局完成后的设置，一般实现这个块用来完成一些特定的动画效果，以及取值操作。(具体见RLTest1ViewController,PLTest1ViewController应用）。

3. 添加了对布局视图里面的子视图通过transform进行坐标变换的支持功能，在您对子视图进行坐标变换操作时，您可以可以通过设置扩展属性来确定子视图的尺寸和位置。

#### Updated
1. 完善了智能边界线的能力，如果您在布局视图中设置了subviewMargin属性的话，布局系统将会自动的将智能边界线一分为二。（具体见TLTest3ViewController见）

#### Changed
1. 布局基类的属性：~~`adjustScrollViewContentSize`~~被设置为过期，改为通过`adjustScrollViewContentSizeMode`属性来设置当布局视图加入到UIScrollView时调整其contentSize的方式。

#### Fixed
1. 修正了一个线性布局中当布局视图的尺寸没有子视图尺寸大，而子视图又设置了`weight`属性时可能导致的计算不正确的问题。
 
## [V1.2.2](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.2)(2016/7/8)

#### Added
 1. 流式布局**MyFlowLayout**中的子视图添加了对`weight`属性的支持，流式布局中的`weight`属性表示的是剩余空间的占比。通过`weight`属性的使用，我们可以在很多用线性布局实现的布局，改用流式布局来完成，从而减少布局的嵌套。流式布局具有HTML中的Flex的特性。(具体见FLLTest4ViewController应用)。
 
2. 布局视图增加了子视图反序排列的功能属性：`@property(nonatomic, assign) BOOL reverseLayout;` 这个属性可以按子视图添加的逆顺序进行界面布局。(具体见AllTest4ViewController应用).

#### Fixed
 
1. 修正了浮动布局**MyFloatLayout**中`weight`计算的问题，由原先的减间距再乘比例改为先乘比例再减间距

## [V1.2.1](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.1)(2016/6/28)

#### Added
1. 垂直线性布局里面添加了A.heightDime.equalTo(A.widthDime)的支持。水平线性布局不支持。

#### Changed
1. 优化了代码结构，增加了代码的可读性。

#### Fixed
1. 修正了相对布局中子视图隐藏时，相关子视图重新排列布局可能导致不正确的问题。相对布局中子视图隐藏时其他视图重新排列布局的算法是：隐藏的子视图的尺寸设置为0，所以依赖隐藏的子视图的边距依赖无效，变为依赖隐藏子视图所依赖的边距。


## [V1.2.0](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.2.0)(2016/6/13)

#### Fixed
1. 修复了垂直线性布局中同时设置`myLeftMargin,myRightMargin`并且设置了`gravity=MyMarginGravity_Horz_Center`时前者设置失效的问题。水平线性布局亦然。


## [V1.1.9](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.9)(2016/6/11)

#### Added
1. 添加对DEMO的国际化的支持。


## [V1.1.8](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.8)(2016/6/8)

#### Added
1. 增加了浮动布局**MyFloatLayout**设置浮动间距的方法`setSubviewFloatMargin` (具体见：FOLTest4ViewController)。

#### Fixed
1. 修复了表格布局MyTableLayout和智能边界线的结合的问题。(具体见TLTest3ViewController)

## [V1.1.7](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.7)(2016/6/6)


#### Added

 1. 为表格布局添加行间距:`rowSpacing`和列间距:`colSpacing`两个属性，用来设置表格的行和列之间的间距。 (具体见TLTest2ViewController)
 2. 为布局添加方法：`layoutAnimationWithDuration`用来实现布局时的动画效果。(具体见：各个DEMO)
 3. 新增加了扩展`flexedHeight`属性对于**UIImageView**的支持。当对一个**UIImageView**设置`flexedHeight`为YES时则其在布局时会自动根据**UIImageView**设置的宽度等比例缩放其高度。这个特性在瀑布流实现中非常实用。(具体见TLTest2ViewController)
 4. 为浮动布局**MyFloatLayout**提供`subviewMargin、subviewVertMargin、subviewHorzMargin`三个新属性，用来设置浮动布局中各视图的水平和垂直间距。 (具体见：FOLTest4ViewController，FOLTest5ViewController)
 5. 为布局视图下的子视图的尺寸提供了设置最大尺寸以及最小尺寸的新功能，原先的MyLayoutDime中的`min,max`两个方法只能用来设置最小最大的常数值。**MyLayoutDime**新增加的方法`lBound,uBound`则功能更加强大。除了可以设置常数限制尺寸外，还可以设置对象限制尺寸。(具体见：AllTest2ViewController，AllTest3ViewController) 
 6. 系统自动处理了大部分可能出现布局约束冲突的地方，减少了约束冲突出现的可能性。以及出现了约束冲突时告警以及crash的提示。
 
#### Updated

1. 对线性布局中的浮动间距进行优化，支持宽度自动调整的能力.(具体见：AllTest3ViewController)
2. 完善了将布局视图加入到非布局父视图时的位置和尺寸设置。您可以用myXXXMargin方法以及myHeight,myWidth方法设置其在非布局父视图上的位置和尺寸。
3. 修改表格布局的`addRow:colSize:以及insertRow:colSize:atIndex`的方法名，将原来的`colWidth改为了colSize`。 (具体见：TLTest2ViewController)
4. 修改了表格布局的特殊尺寸的宏定义：MTLSIZE_XXXX  (具体见：TLTest1ViewController，TLTest2ViewController)
5. 所有代码部分的注释重新编写，更加有利于大家的理解。
6. 重新编写了大部分的DEMO例子。
 
#### Fixed 

1. 修复了浮动布局加入到**UIScrollview**中不能自动固定的问题。
2. 修正了相对布局嵌套其他布局时，高度评估方法可能不正确的问题。
3. 修正了线性布局在计算高度和宽度时的一个问题。

## [V1.1.6](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.6)(2016/5/3)

1.  **MyLayoutDime**类的`equalTo`方法添加可以等于自身的功能。比如`a.widthDime.equalTo(a.widthDime).add(10);` 表示视图a的最终宽度等于其本身内容的宽度再加上10. 这种设置方法不会造成循环引用，主要用于那些需要在自身内容尺寸基础上再扩展尺寸的场景，(具体见： FLLTest2ViewController).
2.  流式布局**MyFlowLayout**中的内容填充布局为了解决每行内容的填充空隙问题，增加了拉伸间距，拉伸尺寸，以及自动排列三种功能。拉伸间距需要设置属性`gravity`的值为`MyMarginGravity_Horz_Fill`或者`MyMarginGravity_Vert_Fill`；拉伸尺寸需要设置属性`averageArrange`的值为YES；自动排列则需要设置属性`autoArrange`的值为YES。（具体见*FLLTest2ViewController）。
3.  添加了新的视图扩展属性`noLayout`。这个属性设置为YES时表示子视图会参与布局，但是并不会真实的调整其在布局视图中的位置和尺寸，而布局视图则会保留出这个子视图的布局位置和尺寸的空间。这个属性和`useFrame`混合使用用来实现一些动画效果。(具体见FLLTest3ViewController）
4.  框架布局**MyFrameLayout**支持了`wrapContentHeight`和`wrapContentWidth`设置为YES的功能。
5.  布局视图添加新的属性`highlightedOpacity`，用来指定当布局Touch事件的高亮不透明度值。(具体例子见：AllTest1ViewController)
6. 修正了**MyTableLayout**中的一个BUG。
7.  将布局库中的所有注释部分重新进行了格式化和调整。
8.  优化了布局中的一些性能问题。
9.  去掉了对过期代码的兼容性。

## [V1.1.5](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.5)(2016/4/7)
1. 添加了新的布局浮动布局**MyFloatLayout*，浮动布局实现不规则的子视图的排列，卡片布局。设计思想是从HTML中的CSS样式的float属性得到了。
2. 新增智能边界线的功能，通过智能边界线的设定，可以让布局中的子布局根据排版而自动生成边界线，而不需要手动去设置。
3. 修正了各布局的`wrapContentHeight`和 `wrapContentWidth` 可能计算不正确的问题。
4. 修正了布局视图的`leftBorderLineLayer`的宽度不正确的问题。
5. 增加了**MyLayoutDime**和**MyLayoutPos**这两个类中的方法`clear`，以便能快速的清除掉所有的设置。
6. 优化了速度和性能的问题。


## [V1.1.4](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.4)(2016/3/10)
1. 修正了尺寸评估函数`estimateLayoutRect`的一个多层嵌套是无法正确评估尺寸的BUG。
2. 添加了属性`myMargin`用来简单快速的设置myLeftMarign,myTopMargin,myRightMargin,myBottomMargin都是相等的值。
3. 增加了`MyDimeScale`这个工具类，用来实现不同屏幕的尺寸和位置的缩放的功能，加入我们的UI给我们的是iPhone6的设计图，并指定了某个视图的高度为100但又同时希望在iPhone5上高度缩小，而在iPhone6Plus上高度增加，则可以通过`[MyDimeScale scale:100]`得到各种屏幕的缩放后的值了。


## [V1.1.3](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.3)(2016/2/22)
1.  对SizeClass支持和竖屏`MySizeClass_Portrait`和横屏`MySizeClass_Landscape`。以便支持单独的横屏和竖屏的界面适配，尤其是对iPad设备的横竖屏进行区分适配。

## [V1.1.2](https://github.com/youngsoft/MyLinearLayout/releases/tag/1.1.2)(2016/2/18)
1.  全面升级，新增加了对**SizeClass**的支持，通过**SizeClass**的功能可以为苹果的不同尺寸的设备提供完美的适配功能，对**SizeClass**的支持，是在苹果的**SizeClass**能力上支持的，因此只有iOS8以上的版本才支持SizeClass.
2.  流式布局**MyFlowLayout**增加了按内容填充约束的方式的布局，当`arrangedCount`设置为0时则表示按内容约束方式进行布局。
3.  添加了一个新的视图扩展属性`mySize`，以便为了简化同时设置myWidth,myHeight的能力。
4.  将原先的布局基类名字**MyLayoutBase**更名为**MyBaseLayout**.
5.  修正了直接从**MyLinearLayout**或者**MyFlowLayout**建立派生类并初始化可能会出现的死循环的问题。
6.  增加了对布局视图的autoresizesSubviews属性的支持，这个属性默认是设置为YES，如果设置为NO则布局视图不会产生任何的布局动作，也就是所有的子视图的frame的设置是最终的布局的结果，设置这个属性的作用主要用来实现一些子视图的动画。
7.  修正了其他的BUG。

## [V1.1.1]
1.    新增加了一个mySize属性可以设置布局的宽度和高度，相当于同时设置myWidth,myHeight
2.    修正了和iOS的AutoLayout结合使用时可能出现的布局定位不正确的问题，这个版本可以同时和frame,AutoLayout布局进行混合使用。
3.    修正了其他的小问题，以及注释进行了优化和完整。
4.    将原来的leftMargin,rightMargin,topMargin,bottomMargin,width,height,centerXOffset,centerYOffset,centerOffset这几个方法进行了命名冲突兼容，新版本都在前面增加了my前缀，如果要保持老版本请定义宏：`  #define MY_USEOLDMETHODDEF 1 ` 和`  #define MY_USEOLDMETHODNOWARNING 1 `。
5.    将原来的的MarginGravity枚举类型和LineViewOrientation枚举类型重新定义为：MyMarginGravity和MyLayoutViewOrientation。里面的枚举值也进行重新定义，但可以定义宏：`  #define MY_USEOLDENUMDEF 1 `和`  #define MY_USEOLDENUMNOWARNING 1 `来兼容老版本。


## [V1.1.0]
1. 增加了新布局流式布局MyFlowLayout。     
2. 线性布局添加了gravity停靠设置的屏幕水平居中和屏幕垂直居中的功能。  
3. 添加了设置布局视图背景图片backgroundImage和高亮背景图片highlightedBackgroundImage的功能。
4. 添加了视图偏移约束的最大max最小值min限制，以及尺寸约束时的最大max最小值min限制。
5. 添加了布局尺寸评估方法estimateLayoutRect以及视图的评估rect值的功能。
6. 添加了框架布局中的子视图的高度和宽度设置功能，可以让高度或者宽度设置为父视图的高度或者宽度的缩放比例，可以设置高度和宽度相等等功能。
7. 添加了线性布局均分视图设置边距subviewMargin的功能。
8. 添加了在布局中让某个子视图不参与布局的功能,只要将useFrame设置为YES即可。
9. 添加了布局视图设置按下事件setTouchDownTarget，按下被取消setTouchCancelTarget的事件功能。
10. 添加了线性布局均分时的间距值设置功能averageSubviews。
11. 添加了清除视图布局设定的方法resetMyLayoutSetting。
12. 修复了布局占用大量内存的问题。   
13. 修改了布局内添加UIScrollView时橡皮筋效果无效的问题。  
14. 优化了一些约束冲突的解决。
15. 优化了布局视图添加到非布局视图时的位置和尺寸调整功能。
16. 修正了子视图恢复隐藏时的界面不重绘的问题。
17. 修正了布局边界线的缩进显示的问题。
18. 修正UITableView，UICollectionView下添加布局可能会造成的问题。
 

 
