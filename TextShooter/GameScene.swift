//
//  GameScene.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/1/16.
//  Copyright (c) 2016 Kevin Emigh. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.locationInNode(self)
        }
    }
   
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
}
