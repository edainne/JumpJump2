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
    platformManager.platformsStartTag = 0;
    NSLog(@"%@", platformManager.description);
    
//    int playerTag = player1.playerTag;
    player1 = [[Player alloc] init];
//    CCSprite *player = [CCSprite spriteWithFile:@"Icon copy.png"];
//    [self addChild:player z:10 tag: playerTag];

    [self addChild:player1];
        NSLog(@"%@", player1.description);

    [platformManager createPlatforms];
    [player1 resetPlayer];
    [self schedule:@selector(update:)];
    
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

-(void) gameStart
{
	[platformManager resetPlatforms];
	[player1 resetPlayer];
    
	[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

-(void) update:(ccTime)delta
{
    NSLog(@"Update helloworld");
    [player1 updatePlayer:delta];
    [platformManager updatePlatforms:player1];
    Platform* platform = [platformManager platformDidHitPlayer:player1];
    if (platform != NULL) {
        [player1 playerJump];
    }
}
- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{

	[player1 accelerometer:accelerometer didAccelerate:acceleration];

//    
//float deceleration = 0.1f, sensitivity = 8.0f, maxVelocity = 150;
//
//// adjust velocity based on current accelerometer acceleration
//  pv.x = pv.x * deceleration + acceleration.x * sensitivity;
////limit the maximum velocity of the player sprite, in both directions (positive & negative values)
//pv.x = fmaxf(fminf(pv.x, maxVelocity), -maxVelocity);
}

@end
