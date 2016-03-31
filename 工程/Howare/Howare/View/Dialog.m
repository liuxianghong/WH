//
//  Dialog.m
//  Howare
//
//  Created by 刘向宏 on 16/3/30.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

#import "Dialog.h"

@interface Dialog()
@property (nonatomic,weak) IBOutlet UIView *contentView;
@end

@implementation Dialog{
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    [[NSBundle mainBundle] loadNibNamed:@"Dialog" owner:self options:nil];
    [self addSubview:self.contentView];
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
