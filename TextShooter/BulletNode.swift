//
//  BulletNode.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/1/16.
//  Copyright © 2016 Kevin Emigh. All rights reserved.
//

import UIKit
import SpriteKit

class BulletNode: SKNode
{
    var thrust: CGVector = CGVectorMake(0,  0)
    
    override init()
    {
        super.init()
        
        let dot = SKLabelNode(fontNamed: "Courier")
        dot.fontColor = SKColor.blackColor()
        dot.fontSize = 40
        dot.text = "."
        addChild(dot)
        
        let body = SKPhysicsBody(circleOfRadius: 1)
        body.dynamic = true
        body.categoryBitMask = PlayerMissleCategory
        body.contactTestBitMask = EnemyCategory
        body.collisionBitMask = EnemyCategory
        body.fieldBitMask = GravityFieldCategory
        body.mass = 0.01
        
        physicsBody = body
        name = "Bullet \(self)"
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let dx = aDecoder.decodeFloatForKey("thrustX")
        let dy = aDecoder.decodeFloatForKey("thrustY")
        
        thrust = CGVectorMake(CGFloat(dx), CGFloat(dy))
    }
    
    override func encodeWithCoder(aCoder: NSCoder)
    {
        super.encodeWithCoder(aCoder)
        aCoder.encodeFloat(Float(thrust.dx), forKey: "thrustX")
        aCoder.encodeFloat(Float(thrust.dy), forKey: "thrustY")
    }
    
    func applyRecurringForce()
    {
        physicsBody!.applyForce(thrust)
    }
    
    class func bullet(from start:CGPoint, toward destination: CGPoint) -> BulletNode
    {
        let bullet = BulletNode()        
        bullet.position = start
        let movement = Geometry.vectorBetweenPoints(start, p2: destination)
        let magnitude = Geometry.vectorLength(movement)
        let scaledMovement = Geometry.vectorMultiply(movement, m: 1/magnitude)
        
        let thrustMagnitude = CGFloat(100.0)
        bullet.thrust = Geometry.vectorMultiply(scaledMovement, m: thrustMagnitude)
        
        return bullet
    }
}
