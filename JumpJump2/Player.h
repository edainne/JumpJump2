//
//  Player.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/12/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface Player : CCLayer
{
    CGPoint playerPosition;
	CGPoint playerVelocity;
	CGPoint playerAcc;
    
    int playerTag;
    
    CGSize playerSize;
    float maximumX;
    float minimumX;

    CCSprite *player;
}

@property (assign, nonatomic)   int playerTag;
@property (assign, nonatomic)   CGPoint playerPosition;
@property (readwrite)	CGPoint playerVelocity;
@property (assign, nonatomic)	CGPoint playerAcc;
@property (assign, nonatomic)   CGSize playerSize;
@property (assign, nonatomic)   float maximumX;
@property (assign, nonatomic)   float minimumX;

- (void) initializePlayer;
- (void) resetPlayer;
- (void) playerJump;
- (void) updatePlayer:(ccTime) dt;
- (void) resetPosition;
- (float) setPlayerVel;

@end
