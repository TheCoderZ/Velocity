//
//  MyScene.m
//  velocity
//
//  Created by Adil Rahman on 2/12/14.
//  Copyright (c) 2014 Adil Rahman. All rights reserved.
//

#import "MyScene.h"
#import "GameOverScene.h"


@implementation MyScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]){
        GameOver = NO;
        Score = 0;
        SKSpriteNode *Ball = [SKSpriteNode spriteNodeWithImageNamed:@"Triangle"];
        Ball.position = CGPointMake(CGRectGetMidX(self.frame), 100);
        Ball.name = @"Ball";
        [self addChild:Ball];
        Ball.alpha = 100;
        Ball.zPosition = 1;
        [self performSelector:@selector(CreateRectangle) withObject:nil afterDelay:0.1];
             }
    return self;
}

// Creating all of the objects/nodes...
-(void)CreateRectangle{
    SKSpriteNode *Rectangle = [SKSpriteNode spriteNodeWithImageNamed:@"BlueRectangle"];
    Rectangle.position = CGPointMake(280, 550);
    Rectangle.name = @"Rectangle";
    Rectangle.alpha = 100;
    Rectangle.zPosition = 2;
    [self addChild:Rectangle];
    
    
    float randomDelay = arc4random_uniform(1) + 1;
    float randomStartArea = arc4random_uniform(3);
    
    // Randomly picking delay, position, and speed for rectangle...
    
    if(GameOver == NO){
    if (randomStartArea == 0){
        [self performSelector:@selector(CreateRectangle1) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 1){
        [self performSelector:@selector(CreateRectangle2) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 2 || randomStartArea == 3){
        [self performSelector:@selector(CreateRectangle3) withObject:nil afterDelay:randomDelay];
    }
    }
}

-(void)CreateRectangle1{
    SKSpriteNode *Rectangle = [SKSpriteNode spriteNodeWithImageNamed:@"BlueRectangle"];
    Rectangle.position = CGPointMake(200, 550);
    Rectangle.name = @"Rectangle";
    Rectangle.alpha = 100;
    Rectangle.zPosition = 2;
    [self addChild:Rectangle];
    
    float randomDelay = arc4random_uniform(1) + 1;
    float randomStartArea = arc4random_uniform(3);
    if(GameOver == NO){
    if(randomStartArea == 0){
        [self performSelector:@selector(CreateRectangle) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 1){
        [self performSelector:@selector(CreateRectangle2) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 2 || randomStartArea == 3){
        [self performSelector:@selector(CreateRectangle3) withObject:nil afterDelay:randomDelay];
    }
    }
    
}

-(void)CreateRectangle2{
    SKSpriteNode *Rectangle = [SKSpriteNode spriteNodeWithImageNamed:@"BlueRectangle"];
    Rectangle.position = CGPointMake(120, 550);
    Rectangle.name = @"Rectangle";
    Rectangle.alpha = 100;
    Rectangle.zPosition = 2;
    [self addChild:Rectangle];

    float randomDelay = arc4random_uniform(1) + 1;
    float randomStartArea = arc4random_uniform(3);
    if(GameOver == NO){
    if(randomStartArea == 0){
        [self performSelector:@selector(CreateRectangle) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 1){
        [self performSelector:@selector(CreateRectangle1) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 2 || randomStartArea == 3){
        [self performSelector:@selector(CreateRectangle3) withObject:nil afterDelay:randomDelay];
    }
    }
}

-(void)CreateRectangle3{
    SKSpriteNode *Rectangle = [SKSpriteNode spriteNodeWithImageNamed:@"BlueRectangle"];
    Rectangle.position = CGPointMake(40, 550);
    Rectangle.name = @"Rectangle";
    [self addChild:Rectangle];
    Rectangle.alpha = 100;
    Rectangle.zPosition = 2;
    
    float randomDelay = arc4random_uniform(1) + 1;
    float randomStartArea = arc4random_uniform(3);
    if(GameOver == NO){
    if(randomStartArea == 0){
        [self performSelector:@selector(CreateRectangle) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 1){
        [self performSelector:@selector(CreateRectangle1) withObject:nil afterDelay:randomDelay];
    } else if (randomStartArea == 2){
        [self performSelector:@selector(CreateRectangle2) withObject:nil afterDelay:randomDelay];
    }
    }
}

// End of creating objects/nodes, started to do stuff with them...

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
       Touch = 1;
    if(GameOver == YES){
        [WhiteScreen removeFromParent];
        SKSpriteNode *Ball = [SKSpriteNode spriteNodeWithImageNamed:@"Triangle"];
        Ball.position = CGPointMake(CGRectGetMidX(self.frame), 100);
        Ball.name = @"Ball";
        [self addChild:Ball];
        Ball.alpha = 100;
        Ball.zPosition = 1;
        GameOver = NO;
        Score = 0;
        [self performSelector:@selector(CreateRectangle) withObject:nil afterDelay:3.0];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    Touch = 0;
}

-(void)Damage{
    // COnfiguring and moving to GameOverScene
    SKScene *Gamescene = [GameOverScene sceneWithSize:self.scene.view.bounds.size];
    Gamescene.scaleMode = SKSceneScaleModeAspectFill;
    // CHANGE BACKGROUND COLOR FROM ATTRIBUTE BELOW...
    Gamescene.backgroundColor = [SKColor whiteColor];
    Gamescene.zPosition = 0;
    // Present the scene.
    Gamescene.alpha = 100;
    SKTransition *transition = [SKTransition fadeWithColor:[SKColor whiteColor] duration:0.5];
    [self.scene.view presentScene:Gamescene transition:transition];
       }
-(void)ScoreCount{
    Score = Score + 1;
    NSLog(@"%i", Score);
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    SKSpriteNode *Ball = (SKSpriteNode *)[self childNodeWithName:@"Ball"];
    SKSpriteNode *Rectangle = (SKSpriteNode *)[self childNodeWithName:@"Rectangle"];
            [self enumerateChildNodesWithName:@"Rectangle" usingBlock:^(SKNode *node, BOOL *stop) {
            if(GameOver == YES){
                [node removeFromParent];
            }
        node.position = CGPointMake(node.position.x, node.position.y - 10);
        if ([Ball intersectsNode:node]){
            GameOver = YES;
            IsMoving = NO;
            [Rectangle removeFromParent];
            [self performSelector:@selector(Damage) withObject:nil afterDelay:0.1];
        }
        if (node.position.y <= 0){
            [self performSelector:@selector(ScoreCount) withObject:nil afterDelay:0.1];
            [node removeFromParent];
        }
    }];
    // Below is movement for ball...
    [self enumerateChildNodesWithName:@"Ball" usingBlock:^(SKNode *node, BOOL *stop) {
        if(Touch == 1){
            
            if(ballSide == NO && node.position.x < 298){
                
                node.position = CGPointMake(node.position.x + 5, node.position.y);
                
                if(node.position.x > 298){
                    
                    ballSide = YES;
                    
                }
                
            }
            if(ballSide == YES && node.position.x > 22){
                node.position = CGPointMake(node.position.x - 5, node.position.y);
                if(node.position.x < 22){
                    ballSide = NO;
                }
            }
        }
        
    }];
}


        
@end
