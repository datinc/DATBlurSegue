//
//  BlurView.m
//
//  Created by Peter Gulyas on 2/5/2014.
//  Copyright (c) 2014 DATInc. All rights reserved.
//
//

#import "DATBlurView.h"

@interface DATBlurView ()

@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UIView* tintView;

@end

@implementation DATBlurView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.clipsToBounds = YES;
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:self.bounds];
    self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self insertSubview:self.toolbar atIndex:0];
    
    self.tintView = [[UIView alloc] initWithFrame:self.bounds];
    self.tintView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.tintView.hidden = YES;
    self.tintView.backgroundColor = nil;
    
    [self insertSubview:self.tintView atIndex:1];
    
    self.tintColor = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
}

-(void) setTintColor:(UIColor *)tintColor{
    CGFloat alpha = CGColorGetAlpha(tintColor.CGColor);
    if (alpha == 1.0){
        tintColor = [tintColor colorWithAlphaComponent:0.3];
        
    }
    self.tintView.backgroundColor = tintColor;
    self.tintView.hidden = alpha == 0.0;
}

-(UIColor*) tintColor{
    return self.tintView.backgroundColor;
}


@end
