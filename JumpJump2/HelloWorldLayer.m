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
    pv = player1.playerVelocity;
	[[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

-(void) update:(ccTime)delta
{

    [player1 updatePlayer:delta];
    [platformManager updatePlatforms:player1];
    Platform* platform = [platformManager platformDidHitPlayer:player1];
    if (platform != NULL) {
        [player1 playerJump];
    }
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
    float accel_filter = 0.1f;
    pv.x = pv.x * accel_filter + acceleration.x * (1.0f - accel_filter) * 500.0f;
}
@end
