//
//  RedoubtableView.m
//  WHC_AutoLayoutExample
//
//  Created by WHC on 2018/8/27.
//  Copyright © 2018年 吴海超. All rights reserved.
//

#import "RedoubtableView.h"


@implementation RedoubtableView
 /// my attr start

-(UIImageView *)paste_spell_gossip:(double)evening serene_timetable:(NSArray *)serene_timetable {
     NSDictionary * chip_fahrenheit = [NSDictionary dictionaryWithObjectsAndKeys:@"impress",@(502), @"unapologetic",@(595), @"gentleman",@(190), nil];
     UIView * enshrine = [[UIView alloc] initWithFrame:CGRectZero];
     UIImageView * tissue = [[UIImageView alloc] init];
     NSDictionary * cordially = [NSDictionary dictionaryWithObjectsAndKeys:@"ford",@(258), nil];
     UIView * close = [[UIView alloc] initWithFrame:CGRectZero];
    UIImageView * impersonator_retreat_patent = [[UIImageView alloc] initWithFrame:CGRectZero];
    enshrine.frame = CGRectMake(135, 183, 0, 0);
    enshrine.alpha = 0.2;
    enshrine.backgroundColor = [UIColor colorWithRed:227 / 255.0 green:245 / 255.0 blue:59 / 255.0 alpha:1.0];
    tissue.backgroundColor = [UIColor colorWithRed:219 / 255.0 green:218 / 255.0 blue:71 / 255.0 alpha:0.2];
    tissue.alpha = 0.9;
    tissue.frame = CGRectMake(266, 81, 0, 0);
    tissue.animationRepeatCount = 6;
    tissue.image = [UIImage imageNamed:@"go_overwrought"];
    tissue.contentMode = UIViewContentModeScaleAspectFit;
    close.backgroundColor = [UIColor colorWithRed:213 / 255.0 green:159 / 255.0 blue:243 / 255.0 alpha:0.9];
    close.alpha = 0.4;
    close.frame = CGRectMake(87, 265, 0, 0);
    impersonator_retreat_patent.contentMode = UIViewContentModeScaleAspectFit;
    impersonator_retreat_patent.animationRepeatCount = 9;
    impersonator_retreat_patent.image = [UIImage imageNamed:@"swamp"];
    impersonator_retreat_patent.alpha = 0.7;
    impersonator_retreat_patent.backgroundColor = [UIColor colorWithRed:88 / 255.0 green:194 / 255.0 blue:204 / 255.0 alpha:0.9];
    impersonator_retreat_patent.frame = CGRectMake(2, 294, 0, 0);

    return impersonator_retreat_patent;

}



-(NSInteger)receptacle_forebear_anniversary{
     double align = 1663.0;
     int dilemma_enervate = 7972;
     NSInteger molar_grate = 9537;
     long sleigh = 8760;
     CGFloat before_all = 7030.0;
    NSInteger promptly_synopsis = 0;
    align = align;
    align = dilemma_enervate;
    align = molar_grate;
    align = sleigh;
    align = before_all;
    promptly_synopsis -= align;
    dilemma_enervate = 9023;
    promptly_synopsis *= dilemma_enervate;
    molar_grate = 7321;
    promptly_synopsis -= molar_grate;
    sleigh -= 19;
    promptly_synopsis += sleigh;
    before_all += 73;
    promptly_synopsis += before_all;

    return promptly_synopsis;

}



-(Boolean)unwitting_thereby_arbitration{
     int supine_orphan = 5669;
     double counter_offer = 1022.0;
    BOOL quartz_firework = NO;
    supine_orphan = supine_orphan;
    quartz_firework = supine_orphan > 98;
    counter_offer = supine_orphan * counter_offer;
    quartz_firework = counter_offer > 25;

    return quartz_firework;

}



/// my attr end

- (instancetype)init {
 /// my attr start

         [self paste_spell_gossip:2669.0 serene_timetable:@[@(270), @(122)]];
         [self receptacle_forebear_anniversary];
         [self unwitting_thereby_arbitration];
/// my attr end

    self = [super init];
    if (self) {
        self.whc_Edge = UIEdgeInsetsZero;
        self.whc_Orientation = Horizontal;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
        _supperButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _answerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_supperButton setTitle:@"赞" forState:UIControlStateNormal];
        [_supperButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _supperButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_answerButton setTitle:@"评论" forState:UIControlStateNormal];
        [_answerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _answerButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_supperButton];
        [self addSubview:_answerButton];
        [self whc_StartLayout];
        [_supperButton addTarget:self action:@selector(smoke_agreeable_stab:) forControlEvents:UIControlEventTouchUpInside];
        [_answerButton addTarget:self action:@selector(drainage_ripple:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)smoke_agreeable_stab:(UIButton *)sender {
 /// my attr start

         [self receptacle_forebear_anniversary];
         [self unwitting_thereby_arbitration];
/// my attr end

    [UIView animateWithDuration:0.2 animations:^{
        _supperButton.transform = CGAffineTransformMakeScale(2, 2);
    } completion:^(BOOL finished) {
        _supperButton.transform = CGAffineTransformIdentity;
        if (_delegate && [_delegate respondsToSelector:@selector(oncologist_trapeze_asia_rebuttal:isClickSupper:)]) {
            [_delegate oncologist_trapeze_asia_rebuttal:self isClickSupper:YES];
        }
    }];
}

- (void)drainage_ripple:(UIButton *)sender {
 /// my attr start

         [self unwitting_thereby_arbitration];
         [self receptacle_forebear_anniversary];
/// my attr end

    if (_delegate && [_delegate respondsToSelector:@selector(oncologist_trapeze_asia_rebuttal:isClickSupper:)]) {
        [_delegate oncologist_trapeze_asia_rebuttal:self isClickSupper:NO];
    }
}

@end

