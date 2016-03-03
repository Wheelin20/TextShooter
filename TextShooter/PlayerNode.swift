//
//  PlayerNode.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/1/16.
//  Copyright © 2016 Kevin Emigh. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class PlayerNode: SKNode
{
    override init()
    {
        super.init()
        name = "Player \(self)"
        initNodeGraph()
        initPhysicsBody()
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func receiveAttacker(attacker: SKNode, contact: SKPhysicsContact)
    {
        let path = NSBundle.mainBundle().pathForResource("EnemyExplosion", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        explosion.numParticlesToEmit = 50
        explosion.position = contact.contactPoint
        scene!.addChild(explosion)
    }
    
    private func initNodeGraph()
    {
        let label = SKLabelNode(fontNamed: "Courier")
        label.fontColor = SKColor.darkGrayColor()
        label.fontSize = 40
        label.text = "v"
        label.zRotation = CGFloat(M_PI)
        label.name = "label"
        self.addChild(label)
    }
    
    func moveToward(target:CGPoint)
    {
        removeActionForKey("movement")
        removeActionForKey("wobbling")
        
        let distance = Geometry.pointDistance(position, p2: target)
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let duration = NSTimeInterval(2 * distance / screenWidth)
        
        runAction(SKAction.moveTo(target, duration: duration), withKey:"movement")
        
        let wobbleTime = 0.3
        let halfWobbleTime = wobbleTime / 2
        let wobbling = SKAction.sequence([
            SKAction.scaleXTo(0.6, duration: halfWobbleTime),
            SKAction.scaleXTo(1.0, duration: halfWobbleTime)
        ])
        let wobbleCount = Int(duration/wobbleTime)
        
        runAction(SKAction.repeatAction(wobbling, count:wobbleCount), withKey:"wobbling")
    }
    
    private func initPhysicsBody()
    {
        let body = SKPhysicsBody(rectangleOfSize: CGSizeMake(20, 20))
        body.affectedByGravity = false
        body.categoryBitMask = PlayerCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = 0
        physicsBody = body
    }
}
