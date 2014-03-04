//
//  MyScene.h
//  velocity
//

//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameOverScene.h"

@interface MyScene : SKScene{
    GameOverScene *gameoverdata;
    BOOL ballSide;
    int Touch;
    int Score;
    BOOL GameOver;
    BOOL WhiteAlpha;
    BOOL IsMoving;
    SKSpriteNode *WhiteScreen;
    SKScene *GameOverScene;
}
@end
