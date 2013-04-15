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


-(void) resetPlayer
{
   CCSprite *player = [CCSprite spriteWithFile:@"Icon copy.png"];
     [self addChild:player z: 3 tag:playerTag];
    playerPosition.x = 160;
    playerPosition.y = 160;
    player.position = playerPosition;
    
    playerVelocity.x = 0;
    playerVelocity.y = 0;
    
    playerAcc.x = 0;
    playerAcc.y = -550.0f;
    
}
-(void) initializePlayer
{
    playerTag = 199;
    CCSprite *player = (CCSprite*)[CCSprite spriteWithFile:@"Icon copy.png"];
    [self addChild:player z:1000 tag:playerTag];

}
- (void) playerJump
{
    NSLog(@"jump");
	playerVelocity.y = 350.0f + fabsf(playerVelocity.x);
}

-(void) updatePlayer:(ccTime)dt
{
    CCSprite *player = [CCSprite spriteWithFile:@"Icon copy.png"];
    [self addChild:player z:10 tag: playerTag];
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
    
}
@end
