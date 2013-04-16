//
//  HelloWorldLayer.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright Edainne Ladys S. Silva 2013. All rights reserved.
//

#import <GameKit/GameKit.h>
#import "SceneManager.h"
#import "PlatformManager.h"
#import "cocos2d.h"
#import "Player.h"
#import "Platform.h"
#import "GUI.h"


@interface HelloWorldLayer : CCLayer <UIAccelerometerDelegate>
{
    PlatformManager *platformManager;
    Player *player1;
    GUI *gui;
    CGPoint pv;

    UIAccelerometer *accelerometer;
}

@property (retain, nonatomic) PlatformManager *platformManager;

+(CCScene *) scene;

@end
