//
//  HelloWorldLayer.m
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/11/13.
//  Copyright Edainne Ladys S. Silva 2013. All rights reserved.
//

#import "HelloWorldLayer.h"
#import "PlatformManager.h"
#import "AppDelegate.h"
#import "Player.h"
#import "Platform.h"

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
    
    platformManager = [[PlatformManager alloc] init];
    [self addChild:platformManager];
    platformManager.platformsStartTag = 200;
    NSLog(@"%@", platformManager.description);
    
    int playerTag = player1.playerTag;
    player1 = [[Player alloc] init];
//    CCSprite *player = [CCSprite spriteWithFile:@"Icon copy.png"];
//    [self addChild:player z:10 tag: playerTag];

    [self addChild:player1];
        NSLog(@"%@", player1.description);

    [platformManager createPlatforms];
    [player1 resetPlayer];
    pVelocity = player1.playerVelocity;
    [player1 schedule:@selector(updatePlayer:)];
    
    _accelerometerEnabled = YES;
    _touchEnabled = NO;
    
    [self gameStart];
    
    
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / 60.0)];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	return self;
}



- (void) dealloc
{

	[super dealloc];
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
	float accel_filter = 0.1f;
    pVelocity.x = pVelocity.x * accel_filter + acceleration.x * (1.0f - accel_filter) * 500.0f;
}
-(void) gameStart
{
	[platformManager resetPlatforms];
	[player1 resetPlayer];
    
	[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}
@end
