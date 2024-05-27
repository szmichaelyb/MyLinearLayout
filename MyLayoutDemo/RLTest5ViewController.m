//
//  RLTest5ViewController.m
//  MyLayout
//
//  Created by oybq on 16/12/19.
//  Copyright (c) 2016年 YoungSoft. All rights reserved.
//

#import "RLTest5ViewController.h"
#import "MyLayout.h"
#import "CFTool.h"

@interface RLTest5ViewController ()<UIScrollViewDelegate>
@end

@implementation RLTest5ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;  /// 设置视图控制器中的视图尺寸不延伸到导航条或者工具条下面。您可以注释这句代码看看效果。

    /*
       本示例用来介绍最值约束的使用方式。什么是最值约束呢？在一些场景中我们希望一个视图的宽度或者高度是某一些宽度或者高度集合中的最大值或者最小值，同样在一些场景中
     我们希望某个视图的某个方位的位置值是一些位置值集合中的最大或者最小值。这种尺寸或者位置是一个集合中的尺寸或者位置中的最大最小值的约束就称之为最值约束。
     
     为了实现最值约束我们对MyLayoutSize以及MyLayoutPos的equalTo方法的参数中分别添加了对MyLayoutMostSize以及MyLayoutMostPos类型值的支持。我们不需要关心MyLayoutMostSize以及MyLayoutMostPos的内部具体实现，只需要知道这两种类型的值是分别从NSArray数组的分类方法:myMaxSize,myMinSize,myMaxPos,myMinPos中获取得到。而对于NSArray数组中的元素类型，则要求必须是NSNumber类型或者MyLayoutSize或者MyLayoutPos类型。下面举例来说：
  
         1.视图D的高度是： 视图A的宽度、视图B的高度、视图C的高度的一半、50 这四个值中的最大值。那么视图D的高度约束可以如下设置：
           D.heightSize.equalTo(@[A.widthSize, B.heightSize, C.heightSize.clone(0, 0.5), @50].myMaxSize);
     
         2.视图D的右边距是：视图A的左边距、视图B的右边距、视图C的左边距偏移20、50这四个值中的最小值。那么视图D的右边距约束可以如下设置：
           D.rightPos.equalTo(@[A.leftPos,B.rightPos,C.leftPos.clone(20), @50].myMinPos);
     
         3.视图C的宽度是：自身宽度、视图B的宽度-20、30这三个值的最小值。
           C.widthSize.equalTo(@[@(MyLayoutSize.wrap),B.widthSize.clone(-20,1),@30)].myMinSize);
     
    需要注意的是在使用最值约束时要求数组中的元素的约束必须是在当前约束计算前就已经完成约束计算，否则结果未可知。就以上面的例子来说在计算D的高度时，要求A的宽度，B的高度，C的高度都是已经完成了约束计算才有效。
     
        需要注意的是只有相对布局中的子视图的位置约束才支持位置的最值约束设置，其他布局中的子视图不支持！而尺寸最值约束则所有布局中的子视图都支持。
     */
    
    /// TODO: 注意学习。
    /// (1) 视图C的高度的一半，其表示方式：
    ///     C.heightSize.clone(0,0.5)
    /// (2) 视图B的宽度-20
    ///     B.widthSize.clone(-20,1)
    /// (2) 视图C的左边距偏移20
    ///     C.leftPos.clone(20)
    
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.myMargin = 0;
    [self.view addSubview:rootLayout];
    
    //最值约束例子1
    MyRelativeLayout *layout1 = [self createLayout1];
    layout1.topPos.equalTo(rootLayout.topPos);
    layout1.leftPos.equalTo(rootLayout.leftPos);
    layout1.backgroundColor = [CFTool color:7];
    [rootLayout addSubview:layout1];
    
    //最值约束例子2
    MyRelativeLayout *layout2 = [self createLayout2];
    layout2.topPos.equalTo(layout1.bottomPos).offset(20);
    layout2.leftPos.equalTo(rootLayout.leftPos);
    layout2.backgroundColor = [CFTool color:8];
    [rootLayout addSubview:layout2];
    
    //最值约束例子3
    MyRelativeLayout *layout3 = [self createLayout3];
    layout3.topPos.equalTo(layout2.bottomPos).offset(20);
    layout3.leftPos.equalTo(rootLayout.leftPos);
    layout3.backgroundColor = [CFTool color:8];
    [rootLayout addSubview:layout3];
    
}

-(MyRelativeLayout*)createLayout1
{
    //这个例子用来演示位置的最值约束设置。通过位置的最值约束我们设置某个位置的值为一批位置中的最大或者最小值。位置最值约束只能用于相对布局。
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.widthSize.equalTo(@(MyLayoutSize.wrap));
    rootLayout.heightSize.equalTo(@(MyLayoutSize.wrap));
    rootLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //名字控件，尺寸是自适应的。
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"欧阳大哥";
    nameLabel.font = [CFTool font:20];
    nameLabel.widthSize.equalTo(@(MyLayoutSize.wrap));
    nameLabel.heightSize.equalTo(@(MyLayoutSize.wrap));
    [rootLayout addSubview:nameLabel];
    
    /// 详情控件，尺寸是自适应的，但是最宽是屏幕宽度减20，这里减20的原因是因为布局视图设置了左右padding为10。
    UILabel *detailLabel = [UILabel new];
    detailLabel.text = @"继续！";
    detailLabel.backgroundColor = [CFTool color:9];
    /// TODO: 注意学习。这里减去20，是因为pading的间距
    /// 宽度自适应，最宽是屏幕的宽度减去20。
    detailLabel.widthSize.equalTo(@(MyLayoutSize.wrap)).uBound(self.view.widthSize,-20,1);
    detailLabel.heightSize.equalTo(@(MyLayoutSize.wrap));
    detailLabel.topPos.equalTo(nameLabel.bottomPos).offset(10);
    detailLabel.leftPos.equalTo(nameLabel.leftPos);
    [rootLayout addSubview:detailLabel];
    
    /// 按钮控件，右边和详情控件对齐，但是当详情控件的内容太少时，起码要和名字控件最小的距离是40
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clickButton setTitle:@"Click me" forState:UIControlStateNormal];
    clickButton.backgroundColor = [CFTool color:10];
    /// TODO: 注意学习。这里因为在后面有用到尺寸。所以调用[sizeToFit]
    /// 这里直接计算出clickButton的size是自适应的
    [clickButton sizeToFit];
    
    clickButton.topPos.equalTo(nameLabel.topPos);
    /// 最新版本的相对布局可以让子视图的位置设置为某些视图位置中的最大或者最小值，也就是最值，我们可以对一个数组调用扩展分类的方法myMaxPos或者myMinPos来获取
    /// 到数组中元素的最大或者最小位置值。使用最大最小值的前提是在计算当前位置的约束时，要求数组中的元素的约束都是已经计算好了的，否则得到的结果是未可知，就如本例中
    /// 在计算clickButton的右边距时，detailLabel以及nameLabel的右边距都是已经计算好了的。
    /// TODO: `已经计算好`，其实就是已经设置好了的意思。
    /// 代码确实很绕，需要仔细理解
    clickButton.rightPos.equalTo(@[detailLabel.rightPos,nameLabel.rightPos.clone(-1*(40+clickButton.frame.size.width))].myMaxPos);
    [rootLayout addSubview:clickButton];
    
    [clickButton addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    /// 这个控件的高度取nameLabel和detailLabel二个高度中的最小高度值。
    /// 这个控件的宽度取nameLabel和detailLabel二个宽度中的最大宽度值。
    /// 在设置最值尺寸约束时，要求数组中的约束尺寸是已经计算完毕了的，否则结果未可知。
    UILabel *subDetailLabel = [UILabel new];
    subDetailLabel.text = @"这是一句很长的文字，随着detail的增长而显示越多";
    subDetailLabel.backgroundColor = [CFTool color:10];
    subDetailLabel.topPos.equalTo(detailLabel.bottomPos).offset(10);
    subDetailLabel.leftPos.equalTo(nameLabel.leftPos);
    subDetailLabel.heightSize.equalTo(@[nameLabel.heightSize,detailLabel.heightSize].myMinSize);
    subDetailLabel.widthSize.equalTo(@[nameLabel.widthSize,detailLabel.widthSize].myMaxSize);
    [rootLayout addSubview:subDetailLabel];

    return rootLayout;
}

-(MyRelativeLayout*)createLayout2
{
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.widthSize.equalTo(@(MyLayoutSize.wrap));
    rootLayout.heightSize.equalTo(@(MyLayoutSize.wrap));
    rootLayout.padding = UIEdgeInsetsMake(10,10,10,10);
    
    /// 名字控件，尺寸是自适应的。
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"欧阳大哥";
    nameLabel.widthSize.equalTo(@(MyLayoutSize.wrap));
    nameLabel.heightSize.equalTo(@(MyLayoutSize.wrap));
    [rootLayout addSubview:nameLabel];
    
    UILabel *detailLabel = [UILabel new];
    detailLabel.text = @"继续！";
    detailLabel.backgroundColor = [CFTool color:9];
    /// 宽度固定为90
    detailLabel.widthSize.equalTo(@(90));
    detailLabel.heightSize.equalTo(@(MyLayoutSize.wrap));
    detailLabel.topPos.equalTo(nameLabel.bottomPos).offset(10);
    detailLabel.leftPos.equalTo(nameLabel.leftPos);
    [rootLayout addSubview:detailLabel];
    
    /// 按钮控件，右边和详情控件对齐，但是当详情控件的内容太少时，起码要和名字控件最小的距离是40
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clickButton setTitle:@"Click me" forState:UIControlStateNormal];
    clickButton.backgroundColor = [CFTool color:10];
    /// 这里直接计算出date的size是自适应
    [clickButton sizeToFit];
    clickButton.leftPos.equalTo(detailLabel.rightPos).offset(20);
    /// 按钮的底部位置取100和detailLabel底部位置二者的最小值。
    /// 在这个例子中随着detailLabel的高度增加底部越来越大，但是clickButton的底部如果超过100则最终会取值100
    clickButton.bottomPos.equalTo(@[@100,detailLabel.bottomPos].myMinPos);
    [rootLayout addSubview:clickButton];
    [clickButton addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    /// TODO: 注意学习。先乘后加。
    /// 从布局尺寸中克隆一个尺寸对象来。这个克隆出来的尺寸值是源尺寸对象的值乘以multival再加上addVal。
    /// nameLabel.widthSize.clone(10,0.5)
    
    /// 这个控件的高度取50和detailLabel二个高度中的最小高度值。
    /// 这个控件的宽度取nameLabel宽度的一半加10，detailLabel高度的3/5，100三个宽度中的最大宽度值。
    /// 在设置最值尺寸约束时，要求数组中的约束尺寸是已经计算完毕了的，否则结果未可知。
    UILabel *subDetailLabel = [UILabel new];
    subDetailLabel.text = @"这是一句很长的文字，随着detail的增长而显示越多";
    subDetailLabel.backgroundColor = [CFTool color:10];
    subDetailLabel.topPos.equalTo(clickButton.bottomPos).offset(10);
    subDetailLabel.leftPos.equalTo(detailLabel.rightPos).offset(10);
    subDetailLabel.heightSize.equalTo(@[@50,detailLabel.heightSize].myMinSize);
    subDetailLabel.widthSize.equalTo(@[nameLabel.widthSize.clone(10,0.5),detailLabel.heightSize.clone(0,0.6),@(100)].myMaxSize);
    [rootLayout addSubview:subDetailLabel];

    return rootLayout;
}

-(MyRelativeLayout*)createLayout3
{
    MyRelativeLayout *rootlayout = [MyRelativeLayout new];
    rootlayout.widthSize.equalTo(@(MyLayoutSize.wrap));
    rootlayout.heightSize.equalTo(@(MyLayoutSize.wrap));
    rootlayout.padding = UIEdgeInsetsMake(10,10,10,10);
    
    /// 名字控件，尺寸是自适应的。
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"欧阳大哥";
    nameLabel.widthSize.equalTo(@(MyLayoutSize.wrap));
    nameLabel.heightSize.equalTo(@(MyLayoutSize.wrap));
    nameLabel.backgroundColor = [CFTool color:2];
    [rootlayout addSubview:nameLabel];
    
    /// 详情控件，尺寸是自适应的，但是最宽是屏幕宽度减20，这里减20的原因是因为布局视图设置了左右padding为10。
    UILabel *detailLabel = [UILabel new];
    detailLabel.text = @"继续！";
    detailLabel.backgroundColor = [CFTool color:9];
    /// TODO: 注意学习。这里减去20，是因为pading的间距
    /// 宽度自适应，最宽是屏幕的宽度减去20。
    detailLabel.widthSize.equalTo(@(MyLayoutSize.wrap)).uBound(self.view.widthSize,-20,1);
    detailLabel.heightSize.equalTo(@(MyLayoutSize.wrap));
    detailLabel.topPos.equalTo(nameLabel.bottomPos).offset(10);
    detailLabel.leftPos.equalTo(nameLabel.leftPos);
    [rootlayout addSubview:detailLabel];
    
    /// 按钮控件，右边和详情控件对齐，但是当详情控件的内容太少时，起码要和名字控件最小的距离是40
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clickButton setTitle:@"Click me" forState:UIControlStateNormal];
    clickButton.backgroundColor = [CFTool color:10];
    /// TODO: 注意学习。这里因为在后面有用到尺寸。所以调用[sizeToFit]
    /// 这里直接计算出clickButton的size是自适应的
    [clickButton sizeToFit];
    
    clickButton.topPos.equalTo(nameLabel.topPos);
    /// 最新版本的相对布局可以让子视图的位置设置为某些视图位置中的最大或者最小值，也就是最值，我们可以对一个数组调用扩展分类的方法myMaxPos或者myMinPos来获取
    /// 到数组中元素的最大或者最小位置值。使用最大最小值的前提是在计算当前位置的约束时，要求数组中的元素的约束都是已经计算好了的，否则得到的结果是未可知，就如本例中
    /// 在计算clickButton的右边距时，detailLabel以及nameLabel的右边距都是已经计算好了的。
    /// TODO: `已经计算好`，其实就是已经设置好了的意思
    clickButton.rightPos.equalTo(@[detailLabel.rightPos,nameLabel.rightPos.clone(-1*(40+clickButton.frame.size.width))].myMaxPos);
    [rootlayout addSubview:clickButton];
    
    [clickButton addTarget:self action:@selector(handleClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *sublb = UILabel.new;
    sublb.text = @"呀灭地嘎嘎";
    sublb.backgroundColor = [CFTool color:4];
    /// sublb.widthSize.equalTo(@(MyLayoutSize.wrap));
    sublb.heightSize.equalTo(@(MyLayoutSize.wrap));
    sublb.widthSize.equalTo(@[@(MyLayoutSize.wrap),nameLabel.widthSize,detailLabel.widthSize].myMaxSize);
    
    /// sublb.topPos.equalTo(nameLabel.bottomPos).offset(10);
    sublb.topPos.equalTo(@[nameLabel.bottomPos,detailLabel.bottomPos].myMaxPos);
    [rootlayout addSubview:sublb];
    
    /// 这个控件的高度取nameLabel和detailLabel二个高度中的最小高度值。
    /// 这个控件的宽度取nameLabel和detailLabel二个宽度中的最大宽度值。
    /// 在设置最值尺寸约束时，要求数组中的约束尺寸是已经计算完毕了的，否则结果未可知。
    UILabel *subDetailLabel = [UILabel new];
    subDetailLabel.text = @"这是一句很长的文字，随着detail的增长而显示越多";
    subDetailLabel.backgroundColor = [CFTool color:10];
    subDetailLabel.topPos.equalTo(sublb.bottomPos).offset(10);
    subDetailLabel.leftPos.equalTo(nameLabel.leftPos);
    subDetailLabel.heightSize.equalTo(@[nameLabel.heightSize,detailLabel.heightSize].myMinSize);
    subDetailLabel.widthSize.equalTo(@[nameLabel.widthSize,detailLabel.widthSize].myMaxSize);
    [rootlayout addSubview:subDetailLabel];
    
    return rootlayout;
}

-(IBAction)handleClick:(UIButton*)sender
{
    UILabel *label = (UILabel*)sender.superview.subviews[1];
    label.text = [NSString stringWithFormat:@"继续！ %@", label.text];
}

-(void)handleClick2:(UIButton*)sender
{
    UILabel *label = (UILabel*)sender.superview.subviews[1];
    label.text = [NSString stringWithFormat:@"继续！ %@", label.text];
    
    sender.selected = !sender.selected;
    label.visibility = sender.selected?MyVisibility_Gone:MyVisibility_Visible;
}

@end
