//
//  HelloWorldLayer.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright Edainne Ladys S. Silva 2013. All rights reserved.
//

#import "HelloWorldLayer.h"
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

@implementation HelloWorldLayer
@synthesize platformManager;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];

	[scene addChild: layer];
	return scene;
}
-(id) init
{
    if(![super init]) return nil;
    CGSize winSize = [CCDirector sharedDirector].winSize;

    
    gui = [[GUI alloc] init];
    [self addChild:gui];
    
    platformManager = [[PlatformManager alloc] init];
    [self addChild:platformManager];
    platformManager.platformsStartTag = 0;
    NSLog(@"%@", platformManager.description);

    player1 = [[Player alloc] init];
    [self addChild:player1];
    NSLog(@"%@", player1.description);

    
    [platformManager createPlatforms];
    [player1 resetPlayer];
    [self schedule:@selector(update:)];
    
    _accelerometerEnabled = YES;
    _touchEnabled = NO;
 
    [self gameStart];
	return self;
}



- (void) dealloc
{

	[super dealloc];
}

-(void) gameStart
{
	[platformManager resetPlatforms];
	[player1 resetPlayer];
    pv = player1.playerVelocity;
	[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

-(void) update:(ccTime)delta
{
    
    [player1 updatePlayer:delta];
    [platformManager updatePlatforms:player1];
    Platform* platform = [platformManager platformDidHitPlayer:player1];
    
    gui.playerPoints += 1;
    [self updateScore:gui.playerPoints];
    if (platform != NULL) {
        [player1 playerJump];
            
    }
    if ([player1 playerDied]) {
        [self unscheduleAllSelectors];
        [self unschedule:@selector(updateScore:)];
        gui.finalPlayerPoints = gui.playerPoints;
        NSLog(@"points : %d", gui.finalPlayerPoints);
        
        GameOver *go = [[GameOver alloc] init];
        [go displayScore:gui.finalPlayerPoints];
        [SceneManager goToGameOver];
    }

}

-(int) updateScore : (NSInteger) newScore
{
    gui.playerPoints = newScore;
    [gui.scoreLabel setString:[NSString stringWithFormat:@"%d", gui.playerPoints]];
    NSLog(@"points : %d", gui.finalPlayerPoints);
    return gui.playerPoints;
}
@end
