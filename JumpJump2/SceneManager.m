//
//  SceneManager.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import "SceneManager.h"

@implementation SceneManager
+(void) goToMainMenu;
{
    CCLayer *layer = [MainMenu node];
    [SceneManager go:layer];
}
+(void) goToGame
{
    CCLayer *layer = [HelloWorldLayer node];
    [SceneManager go:layer];
}
+(void) goToGameOver
{
    CCLayer *layer = [GameOver node];
    [SceneManager go:layer];
    
}
+(void) go : (CCLayer*) layer
{
    CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	if ([director runningScene]) {
		[director replaceScene:newScene];
	}else {
		[director runWithScene:newScene];
	}
}
+(CCScene *) wrap : (CCLayer *) layer
{
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer];
	return newScene;
}
@end
