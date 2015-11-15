//
//  FMRestaurantView.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMRestaurantView.h"
#import "FMColors.h"
#import "FMLabel.h"

@implementation FMRestaurantView

-(instancetype)initWithFrame:(CGRect)frame Dictionary:(NSDictionary*)dict {
    self = [super initWithFrame:frame];
    if (self) {
        _imgURL = dict[@"image_url"];
        _name = dict[@"name"];
        _url = dict[@"url"];
        
        NSLog(@"dict=%@\n", dict);
        
        self.layer.cornerRadius = 10;
        self.layer.borderColor = TEXT_COLOR.CGColor;
        self.layer.borderWidth = 3;
    }
    return self;
}

-(void)layoutSubviews {
    NSLog(@"loading image from %@\n", _imgURL);
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _url]];
    UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];
    
    CGFloat imgWidth = 100, textPadding = 20;
    imgView.frame = CGRectMake(self.frame.size.width / 2 - imgWidth / 2, 100, imgWidth, imgWidth);
    
    
    FMLabel* label = [[FMLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label.text = _name;
    [label sizeToFit];
    label.frame = CGRectMake(self.frame.size.width / 2 - label.frame.size.width / 2, 100 + imgWidth + 10, label.frame.size.width, label.frame.size.height);
    
    [self addSubview:imgView];
    [self addSubview:label];
}

@end
