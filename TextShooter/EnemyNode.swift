//
//  EnemyNode.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/1/16.
//  Copyright © 2016 Kevin Emigh. All rights reserved.
//

import UIKit
import SpriteKit

class EnemyNode: SKNode
{
    override init()
    {
        super.init()
        name = "Enemy \(self)"
        initNodeGraph()
        initPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func friendlyBumpFrom(node: SKNode)
    {
        physicsBody!.affectedByGravity = true
    }
    
    override func receiveAttacker(attacker: SKNode, contact: SKPhysicsContact)
    {
        physicsBody!.affectedByGravity = true
        let force = Geometry.vectorMultiply(attacker.physicsBody!.velocity, m: contact.collisionImpulse)
        let myContact = scene!.convertPoint(contact.contactPoint, toNode: self)
        physicsBody!.applyForce(force, atPoint: myContact)
        
        let path = NSBundle.mainBundle().pathForResource("MissileExplosion", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        explosion.numParticlesToEmit = 20
        explosion.position = contact.contactPoint
        scene!.addChild(explosion)
        
        runAction(SKAction.playSoundFileNamed("enemyHit.wav", waitForCompletion: false))
    }
    
    private func initNodeGraph()
    {
        let topRow = SKLabelNode(fontNamed: "Courier-Bold")
        topRow.fontColor = SKColor.brownColor()
        topRow.fontSize = 20
        topRow.text = "x x"
        topRow.position = CGPointMake(0, 15)
        addChild(topRow)
        
        let middleRow = SKLabelNode(fontNamed: "Courier-Bold")
        middleRow.fontColor = SKColor.brownColor()
        middleRow.fontSize = 20
        middleRow.text = "x"
        addChild(middleRow)
        
        let bottomRow = SKLabelNode(fontNamed: "Courier-Bold")
        bottomRow.fontColor = SKColor.brownColor()
        bottomRow.fontSize = 20
        bottomRow.text = "x x"
        bottomRow.position = CGPointMake(0, -15)
        addChild(bottomRow)
    }
    
    private func initPhysicsBody()
    {
        let body = SKPhysicsBody(rectangleOfSize: CGSizeMake(40, 40))
        body.affectedByGravity = false
        body.categoryBitMask = EnemyCategory
        body.contactTestBitMask = PlayerCategory | EnemyCategory
        body.mass = 0.2
        body.angularDamping = 0
        body.linearDamping = 0
        body.fieldBitMask = 0
        physicsBody = body
    }
}
