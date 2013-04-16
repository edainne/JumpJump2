//
//  SceneManager.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelloWorldLayer.h"
#import "MainMenu.h"
#import "GameOver.h"
@interface SceneManager : NSObject
{
    
}
+(void) goToMainMenu;
+(void) goToGame;
+(void) goToGameOver;

+(void) go : (CCLayer*) layer;
+(CCScene *) wrap : (CCLayer *) layer;
@end
