//
//  Player.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/12/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import "Player.h"
#import "cocos2d.h"
@implementation Player
@synthesize 
            playerTag,
            playerAcc,
            playerPosition,
            playerVelocity,
            playerSize,
            maximumX,
            minimumX;

-(id) init
{
    if (self = [super init]) {
        [self initializePlayer];
        [self scheduleUpdate];
        
        _accelerometerEnabled = YES;
        [[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / 60.0)];
    }
    
    return self;
}
-(void) resetPlayer
{
    playerPosition.x = 160;
    playerPosition.y = 1000;
    player.position = playerPosition;
    
    playerVelocity.x = 0;
    playerVelocity.y = 0;
    
    playerAcc.x = 0;
    playerAcc.y = -550.0f;
    
}
-(void) initializePlayer
{
    playerTag = 199;
    player = (CCSprite*)[CCSprite spriteWithFile:@"Icon copy.png"];
    [self addChild:player z:1000 tag:playerTag];

}
- (void) playerJump
{
    NSLog(@"jump");
	playerVelocity.y = 350.0f + fabsf(playerVelocity.x);
    
}

-(void) updatePlayer:(ccTime)dt
{
    playerPosition.x += playerVelocity.x * dt;
    
    playerSize = player.contentSize;
    maximumX = 320 - playerSize.width/2;
    minimumX = 0 + playerSize.width/2;
    
    
    if (playerPosition.x - 57 > maximumX) {
        playerPosition.x = minimumX;
    }
    if (playerPosition.x + 57 < minimumX) {
        playerPosition.x = maximumX;
    }
    
    playerVelocity.y += playerAcc.y * dt;
    playerPosition.y += playerVelocity.y * dt;

    player.position = playerPosition;
    
}
-(void) resetPosition
{
    playerPosition.y = 240;
    player.position = playerPosition;
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{

    float accel_filter = 0.1f;
    playerVelocity.x = playerVelocity.x * accel_filter + acceleration.x * (1.0f - accel_filter) * 500.0f;
}

-(BOOL) playerDied
{
    player.position = playerPosition;
    if (playerPosition.y + player.boundingBox.size.height/2 + 10 < 0)
    {
        return YES;
    }
    return NO;
}
@end
