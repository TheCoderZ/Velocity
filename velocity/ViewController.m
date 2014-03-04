//
//  ViewController.m
//  velocity
//
//  Created by Adil Rahman on 2/12/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import "ViewController.h"
#import "StartGameScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    startscene = [StartGameScene sceneWithSize:skView.bounds.size];
    startscene.scaleMode = SKSceneScaleModeAspectFill;
    // CHANGE BACKGROUND COLOR FROM ATTRIBUTE BELOW...
    startscene.backgroundColor = [SKColor lightGrayColor];
    startscene.zPosition = 0;
    // Present the scene.
    [skView presentScene:startscene];
    }

-(IBAction)Start:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
