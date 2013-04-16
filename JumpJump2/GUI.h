//
//  GUI.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface GUI : CCLayer
{
    CCLabelTTF* scoreLabel;
    CCLabelTTF* finalScoreLabel;

    
    int playerPoints;
    int finalPlayerPoints;
    
    int scoreTag;
    int finalScoreTag;
}
@property (retain, nonatomic) CCLabelTTF *scoreLabel;
@property (retain, nonatomic) CCLabelTTF *finalScoreLabel;
@property (assign, nonatomic) int playerPoints;
@property (assign, nonatomic)     int finalPlayerPoints;

-(void) finalScoreLabelM : (int) fpp;
@end
