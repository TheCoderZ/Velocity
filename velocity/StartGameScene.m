//
//  StartGameScene.m
//  velocity
//
//  Created by Adil Rahman on 2/21/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import "StartGameScene.h"
#import "MyScene.h"

@implementation StartGameScene

-(void)didMoveToView:(SKView *)view{
    
    SKLabelNode *Startlabel = [SKLabelNode labelNodeWithFontNamed:@"Futura"];
    Startlabel.position = CGPointMake(CGRectGetMidX(self.frame), 450);
    Startlabel.text = @"VelocitY";
    Startlabel.name = @"StartLabel";
    Startlabel.fontSize = 20;
    Startlabel.fontColor = [SKColor blackColor];
    [self addChild:Startlabel];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(buttonSelector) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Start" forState:UIControlStateNormal];
    button.frame = CGRectMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame), 33, 10);
    [view addSubview:button];
}


-(void)buttonSelector{
    scene = [MyScene sceneWithSize:self.scene.view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    // CHANGE BACKGROUND COLOR FROM ATTRIBUTE BELOW...
    scene.backgroundColor = [SKColor lightGrayColor];
    scene.zPosition = 0;
    // Present the scene.
    [button removeFromSuperview];
    [self.scene.view presentScene:scene ];
}



@end
