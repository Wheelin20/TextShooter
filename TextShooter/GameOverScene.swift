//
//  GameOverScene.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/2/16.
//  Copyright © 2016 Kevin Emigh. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene
{
    override init(size: CGSize)
    {
        super.init(size: size)
        backgroundColor = SKColor.purpleColor()
        let text:SKLabelNode = SKLabelNode(fontNamed: "Courier")
        text.text = "Game Over"
        text.fontColor = SKColor.whiteColor()
        text.fontSize = 50
        text.position = CGPointMake(frame.size.width/2, frame.size.height/2)
        addChild(text)
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        super.init(coder: aDecoder)
    }
}
