//
//  MainMenu.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import "MainMenu.h"

@implementation MainMenu
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainMenu *layer = [MainMenu node];
    
	[scene addChild: layer];
	return scene;
}
-(id) init
{
    if (self = [super init]) {
        CCLayer *menuLayer = [[CCLayer alloc]init];
        [self addChild:menuLayer];
        
        [CCMenuItemFont setFontName:@"Marker Felt"];
        
        CCMenuItemFont *startGame = [CCMenuItemFont itemWithString:@"Play" target:self selector:@selector(startGame)];
        startGame.fontSize = 18;
        startGame.position = ccp(100, 30);
        [startGame setColor:ccc3(255, 255, 255)];
        
        CCMenu *mainMenu = [CCMenu menuWithItems:startGame, nil];
        [menuLayer addChild:mainMenu];
        
    }
    
    return self;
}
-(void) startGame
{
    [SceneManager goToGame];
}
@end
