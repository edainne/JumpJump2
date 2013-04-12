//
//  PlatformManager.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#define kMinPlatformStep	50
#define kMaxPlatformStep	100
#define kNumPlatforms		20
#define kPlatformTopPadding 10
@interface PlatformManager : CCLayer
{
    Player *player;
    float currentPlatformY;
	float currentMaxPlatformStep;
    
    int currentPlatformTag;
	int platformCount;
	int platformsStartTag;
    int t;
    
    BOOL hit;
    
    CGPoint pVelocity;
    CGPoint pPosition;
}
-(void) initializePlatform;
-(void) createPlatforms;
-(void) resetPlatforms;
-(void) resetPlatform;

@property (assign, nonatomic)   float currentPlatformY;
@property (assign, nonatomic)	float currentMaxPlatformStep;
@property (assign, nonatomic)   int currentPlatformTag;
@property (assign, nonatomic)	int platformCount;
@property (assign, nonatomic) 	int platformsStartTag;
@property (assign, nonatomic)   int t;
@property (assign, nonatomic)   BOOL hit;
@end
