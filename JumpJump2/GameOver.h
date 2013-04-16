//
//  GameOver.h
//  JumpJump2
//
//  Created by Edainne Ladys S. Silva on 4/16/13.
//  Copyright (c) 2013 Edainne Ladys S. Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SceneManager.h"
#import "GUI.h"
#import "cocos2d.h"
@interface GameOver : CCLayer
{
    GUI *gui;
    int a;
}
-(void) displayScore: (int) score;
@end
