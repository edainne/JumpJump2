//
//  PlatformManager.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//
#import "cocos2d.h"
#import "PlatformManager.h"
#import "Player.h"
@implementation PlatformManager

@synthesize currentPlatformY,
            currentMaxPlatformStep,
            currentPlatformTag,
            platformCount,
            platformsStartTag,
            t,
            hit;
-(id) init
{
    if(![super init]) return nil;
    pVelocity = player.playerVelocity;
    pPosition = player.playerPosition;
	return self;
}
-(void) initializePlatform
{
    CCSprite *platform = [CCSprite spriteWithFile:@"platform.png"];
    [self addChild:platform z: 3 tag:currentPlatformTag];
}
-(void) createPlatforms
{
	
    currentPlatformTag = platformsStartTag;
	while (currentPlatformTag < platformsStartTag + kNumPlatforms)
    {
		[self initializePlatform];
		currentPlatformTag++;
	}
	[self resetPlatforms];
    
}
-(void) resetPlatforms
{
    currentPlatformY = -1;
	currentPlatformTag = platformsStartTag;
	currentMaxPlatformStep = 60.0f;
	platformCount = 0;
    
	while(currentPlatformTag < platformsStartTag + kNumPlatforms)
    {
		[self resetPlatform];
		currentPlatformTag++;
        
	}
    NSLog(@"CPT %i", platformsStartTag);
}
-(void) resetPlatform
{
    if (currentPlatformY < 0)
    {
        currentPlatformY = 30.0f;
    }
    else
    {
        currentPlatformY += random() % (int)(currentMaxPlatformStep - kMinPlatformStep) + kMinPlatformStep;
        
		if(currentMaxPlatformStep < kMaxPlatformStep)
        {
			currentMaxPlatformStep += 0.5f;
        }
    }
    
    CCSprite *platform1 = [CCSprite spriteWithFile:@"platform.png"];
    platform1 = (CCSprite*)[self getChildByTag:currentPlatformTag];
    
	float x;
	CGSize size = platform1.contentSize;
    
	if(currentPlatformY == 30.0f)
    {
		x = 160.0f;
	}
    else
    {
		x = random() % (320-(int)size.width) + size.width/2;
	}
	
	platform1.position = ccp(x,currentPlatformY);
	platformCount++;
}
-(void) platformHitsPlayer : (Player *) player1
{
    player1 = player;
    
    if (pVelocity.y < 0) {
        t = platformsStartTag;
        for (t ; t < platformsStartTag + kNumPlatforms; t++)
            hit = YES;
    }
    else if (pPosition.y > 240)
    {
    float delta = pPosition.y - 240;
    pPosition.y = 240;
    
    currentPlatformY -= delta;
    
    t = t = platformsStartTag;
    
    for(t; t < platformsStartTag + kNumPlatforms; t++) {
        CCSprite *platform = (CCSprite *)[self getChildByTag:t];
        CGPoint pos = platform.position;
        pos = ccp(pos.x, pos.y - delta);
        if (pos.y <-platform.contentSize.height/2) {
            currentPlatformTag = t;
            [self resetPlatform];
        } else {
            platform.position = pos;
        }
    }
    
}
//player.position = playerPosition;
//[self updatePlayerPosition:playerPosition];
}
@end
