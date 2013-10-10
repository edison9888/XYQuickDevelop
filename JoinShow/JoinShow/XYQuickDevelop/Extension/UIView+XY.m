//
//  UIView+XY.m
//  TWP_SkyBookShelf
//
//  Created by Heaven on 13-7-31.
//
//

#import "UIView+XY.h"
#import "XYExtension.h"
#import <objc/runtime.h>

DUMMY_CLASS(UIView_XY);

@implementation UIView (XY)

#undef	UIView_key_tapBlock
#define UIView_key_tapBlock	"UIView.tapBlock"


// objc_setAssociatedObject 对象在dealloc会自动释放
-(void) UIView_dealloc{
    objc_removeAssociatedObjects(self);
    XY_swizzleInstanceMethod([self class], @selector(UIView_dealloc), @selector(dealloc));
	[self dealloc];
}

/*
+ (void) load{
}
 */

-(void) addTapGestureWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    [tap release];
}
-(void) removeTapGesture{
    for (UIGestureRecognizer * gesture in self.gestureRecognizers)
	{
		if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
		{
			[self removeGestureRecognizer:gesture];
		}
	}
}

-(void) addTapGestureWithBlock:(void(^)(void))aBlock{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap)];
    [self addGestureRecognizer:tap];
    [tap release];
    
    objc_setAssociatedObject(self, UIView_key_tapBlock, aBlock, OBJC_ASSOCIATION_COPY);
    XY_swizzleInstanceMethod([self class], @selector(dealloc), @selector(UIView_dealloc));
}
-(void)actionTap{
    void (^aBlock)(void) = objc_getAssociatedObject(self, UIView_key_tapBlock);
    
    if (aBlock) aBlock();
}
/////////////////////////////////////////////////////////////

-(void) addShadeWithTarget:(id)target action:(SEL)action color:(UIColor *)aColor alpha:(float)aAlpha{
    UIView *tmpView = [[UIView alloc] initWithFrame:self.frame];
    tmpView.tag = UIView_shadeTag;
    if (aColor) {
        tmpView.backgroundColor = aColor;
    } else {
        tmpView.backgroundColor = [UIColor blackColor];
    }
    tmpView.alpha = aAlpha;
    [self addSubview:tmpView];
    [tmpView release];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [tmpView addGestureRecognizer:tap];
    [tap release];
    
}
-(void) removeShade{
    UIView *view = [self viewWithTag:UIView_shadeTag];
    [view removeFromSuperview];
}

/////////////////////////////////////////////////////////////
-(void) setBg:(NSString *)str{
    UIImage *image = [UIImage imageNamed:str];
    self.layer.contents = (id) image.CGImage;
}
@end
