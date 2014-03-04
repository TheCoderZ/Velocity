//
//  GameOverScene.m
//  velocity
//
//  Created by Adil Rahman on 2/20/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import "GameOverScene.h"
#import "MyScene.h"

@implementation GameOverScene
-(void)didMoveToView:(SKView *)view{
    NSLog(@"did move to view?");
    SKLabelNode *Gameoverlabel = [SKLabelNode labelNodeWithFontNamed:@"Futura"];
    Gameoverlabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    Gameoverlabel.text = @"Game Over";
    Gameoverlabel.name = @"Gameover";
    Gameoverlabel.fontSize = 20;
    Gameoverlabel.fontColor = [SKColor blackColor];
    [self addChild:Gameoverlabel];

    trybutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [trybutton addTarget:self action:@selector(GameOverButton) forControlEvents:UIControlEventTouchUpInside];
    [trybutton setTitle:@"Try Again?" forState:UIControlStateNormal];
    trybutton.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 70, 5);
    [view addSubview:trybutton];

    
    }
-(void)GameOverButton{
    SKScene *scene = [MyScene sceneWithSize:self.scene.view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    // CHANGE BACKGROUND COLOR FROM ATTRIBUTE BELOW...
    scene.backgroundColor = [SKColor lightGrayColor];
    scene.zPosition = 0;
    // Present the scene.
    scene.alpha = 100;
    SKTransition *transition = [SKTransition fadeWithColor:[SKColor whiteColor] duration:0.5];
    [self.scene.view presentScene:scene transition:transition];
    [trybutton removeFromSuperview];
}

@end
