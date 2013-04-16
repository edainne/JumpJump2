//
//  Platform.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
@class PlatformManager;
@interface Platform : CCSprite
{
    PlatformManager * parent;
    Player * player;
    
    CGPoint pVelocity;
    CGPoint pPosition;

    
    float minimumX;
    float maximumX;
    CGSize playerSize;
}
@property (retain, nonatomic) PlatformManager * parent;
@property (retain, nonatomic) Player * player;

-(BOOL) didCollideWithPlayer : (Player *) player1;
@end
