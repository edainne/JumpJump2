//
//  Platform.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import "Platform.h"
#import "cocos2d.h"
#import "PlatformManager.h"
@implementation Platform
@synthesize parent, player;
-(id) init
{
    if(![super init]) return nil;
    pVelocity = player.playerVelocity;
    pPosition = player.playerPosition;

    pst = parent.platformsStartTag;
    cpt = parent.currentPlatformTag;
    cpY = parent.currentPlatformY;
	return self;
}

-(void) didCollideWithPlayer : (Player *) player1
{
    if (parent.hit) {
    player1 = player;
    int t = parent.t;
    CCSprite *platform = (CCSprite*)[self getChildByTag:t];
    
    CGSize platformSize = platform.contentSize;
    CGPoint platformPosition = platform.position;
    
    maximumX = platformPosition.x - platformSize.width/2;
    minimumX = platformPosition.x + platformSize.width/2;

        
    float minimumY = platformPosition.y + (platformSize.height + playerSize.height/2 - kPlatformTopPadding);
    
    if (pPosition.x > maximumX &&
        pPosition.x < minimumX &&
        pPosition.y > platformPosition.y &&
        pPosition.y < minimumY) {
        [player playerJump];
    }
    }
}

@end
