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
    private var levelNumber:UInt
    private var playerLives:Int
    private var finished = false
    
    class func scene(size:CGSize, levelNumber:UInt) -> GameScene
    {
        return GameScene(size:size, levelNumber:levelNumber)
    }
    
    override convenience init(size:CGSize)
    {
        self.init(size: size, levelNumber: 1)
    }
    
    init(size:CGSize, levelNumber:UInt)
    {
        self.levelNumber = levelNumber
        self.playerLives = 5
        super.init(size: size)
        
        backgroundColor = SKColor.whiteColor()
        
        let lives:SKLabelNode = SKLabelNode(fontNamed: "Courier")
        lives.fontSize = 16
        lives.fontColor = SKColor.blackColor()
        lives.name = "LivesLabel"
        lives.text = "Lives: \(playerLives)"
        lives.verticalAlignmentMode = .Top
        lives.horizontalAlignmentMode = .Right
        lives.position = CGPointMake(frame.size.width, frame.size.height)
        addChild(lives);
        
        let level:SKLabelNode = SKLabelNode(fontNamed: "Courier")
        level.fontSize = 16
        level.fontColor = SKColor.blackColor()
        level.name = "LevelLabel"
        level.text = "Level \(levelNumber)"
        level.verticalAlignmentMode = .Top
        level.horizontalAlignmentMode = .Left
        level.position = CGPointMake(0, frame.size.height)
        addChild(level)
    }

    required init?(coder aDecoder: NSCoder)
    {
        levelNumber = UInt(aDecoder.decodeIntegerForKey("level"))
        playerLives = aDecoder.decodeIntegerForKey("playerLives")
        super.init(coder: aDecoder)
    }
    
    override func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeInteger(Int(levelNumber), forKey: "level")
        aCoder.encodeInteger(playerLives, forKey: "playerLives")
    }

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
