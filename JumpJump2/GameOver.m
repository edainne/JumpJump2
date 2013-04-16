//
//  GameOver.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import "GameOver.h"
#import "HelloWorldLayer.h"
@implementation GameOver
-(id) init
{
    if (self = [super init]) {
        gui = [[GUI alloc] init];
        CCLayer *overLayer = [[CCLayer alloc]init];
        [self addChild:overLayer];
        
        [CCMenuItemFont setFontName:@"Marker Felt"];
        
        CCMenuItemFont *startGame = [CCMenuItemFont itemWithString:@"Try Again" target:self selector:@selector(startGame)];
        startGame.fontSize = 18;
        startGame.position = ccp(100, 30);
        [startGame setColor:ccc3(255, 255, 255)];
        
        CCMenu *menu = [CCMenu menuWithItems:startGame, nil];
        [overLayer addChild:menu];
        
        [gui finalScoreLabelM:[gui finalPlayerPoints]];
        [self addChild: gui];
            NSLog(@"DS2: %d", [gui finalPlayerPoints]);

}
    
    return self;
}
-(void) startGame
{
    [SceneManager goToGame];
}
-(void) displayScore: (int) score
{
    [gui setFinalPlayerPoints:score];
    NSLog(@"DS: %d", score);                  
}

@end
