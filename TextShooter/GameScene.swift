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
    private let playerNode:PlayerNode = PlayerNode()
    private let enemies = SKNode()
    
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
        
        playerNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame) * 0.1)
        addChild(playerNode)
        
        addChild(enemies)
        spawnEnemies()
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
            
            if location.y < frame.height * 0.2
            {
                let target = CGPointMake(location.x, playerNode.position.y)
                playerNode.moveToward(target)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
    
    private func spawnEnemies()
    {
        let count = UInt(log(Float(levelNumber))) + levelNumber
        for var i:UInt = 0; i<count; i++
        {
            let enemy:EnemyNode = EnemyNode()
            let size = frame.size
            let x = arc4random_uniform(UInt32(size.width * 0.8)) + UInt32(size.width * 0.1)
            let y = arc4random_uniform(UInt32(size.height * 0.5)) + UInt32(size.height * 0.5)
            enemy.position = CGPointMake(CGFloat(x), CGFloat(y))
            enemies.addChild(enemy)
        }
    }
}
