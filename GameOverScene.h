//
//  GameOverScene.h
//  velocity
//
//  Created by Adil Rahman on 2/20/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameOverScene : SKScene{
    SKLabelNode *scoreLabel;
    UIButton *trybutton;
    int passedscore;
}

@end
