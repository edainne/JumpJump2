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
    if(![super initWithFile:@"platform.png"]) return nil;
    pst = parent.platformsStartTag;
    cpt = parent.currentPlatformTag;
    cpY = parent.currentPlatformY;
	return self;
}

-(BOOL) didCollideWithPlayer : (Player *) player1
{
    
    CGSize platformSize = self.contentSize;
    CGPoint platformPosition = self.position;
    
    maximumX = platformPosition.x - platformSize.width/2;
    minimumX = platformPosition.x + platformSize.width/2;

        
    float minimumY = platformPosition.y + (platformSize.height + 15 + playerSize.height/2 - kPlatformTopPadding);
    
    if (player1.playerPosition.x > maximumX &&
        player1.playerPosition.x < minimumX &&
        player1.playerPosition.y > platformPosition.y &&
        player1.playerPosition.y < minimumY) {
        return YES;
    }
    return NO;
}

@end
