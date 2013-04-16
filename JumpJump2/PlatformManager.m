//
//  PlatformManager.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//
#import "PlatformManager.h"
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
	platforms = [[NSMutableArray alloc] init];
    currentPlatformTag = platformsStartTag;
	while (currentPlatformTag < platformsStartTag + kNumPlatforms)
    {
        Platform *platform = [[Platform alloc]init];
        [platforms addObject:platform];
        [self addChild:platform];
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

    Platform *platform = platforms [currentPlatformTag];
    
	float x;
	CGSize size = platform.contentSize;
    
	if(currentPlatformY == 30.0f)
    {
		x = 160.0f;
	}
    else
    {
		x = random() % (320-(int)size.width) + size.width/2;
	}
	
	platform.position = ccp(x,currentPlatformY);
	platformCount++;
}
-(void) updatePlatforms : (Player *) player1
{
    
    if (player1.playerVelocity.y < 0) {
        t = platformsStartTag;
        for (t ; t < platformsStartTag + kNumPlatforms; t++)
            hit = YES;
    }
    else if (player1.playerPosition.y > 240)
    {
    float delta = player1.playerPosition.y - 240;
        [player1 resetPosition]; 
    
    currentPlatformY -= delta;
    
        
    t = t = platformsStartTag;
    
    for(t; t < platformsStartTag + kNumPlatforms; t++) {
        Platform *platform = platforms [t];
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

}
-(Platform*) platformDidHitPlayer : (Player *) player1
{
    for (int i = 0; i < platforms.count; i++) {
        Platform *platform = platforms [i];
        if ([platform didCollideWithPlayer:player1]) {
            return platform;
        }
    
    }
    return NULL;
}
@end
