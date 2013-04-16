//
//  GUI.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import "GUI.h"
#import "cocos2d.h"

@implementation GUI
@synthesize scoreLabel,playerPoints, finalPlayerPoints, finalScoreLabel;
-(id) init
{
	if(![super init]) return nil;

    
    playerPoints = 0;
    [self setScoreLabel];
    [self finalScoreLabel];
	return self;
}
-(void) setScoreLabel
{
    scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", playerPoints] fontName:@"Marker Felt" fontSize:10.0];
    scoreLabel.position = ccp(self.contentSize.width/2, self.contentSize.height-20);
    [scoreLabel setColor:ccc3(255, 255, 255)];
    [self addChild:scoreLabel z:1000 tag:scoreTag];

}

-(void) finalScoreLabelM : (int) fpp
{
    finalScoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", fpp] fontName:@"Marker Felt" fontSize:10.0];
    finalScoreLabel.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    [finalScoreLabel setColor:ccc3(255, 255, 255)];
    [self addChild:finalScoreLabel z:1000 tag:finalScoreTag];
    NSLog(@"FS : %d", fpp);
}
@end
