//
//  SKNode+Extra.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/2/16.
//  Copyright © 2016 Kevin Emigh. All rights reserved.
//

import Foundation
import SpriteKit

extension SKNode
{
    func receiveAttacker(attacker:SKNode, contact: SKPhysicsContact)
    {
        // Default implementation does nothing
    }
    
    func friendlyBumpFrom(node: SKNode)
    {
        // Default implementation does nothing
    }
}