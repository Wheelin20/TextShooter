//
//  Geometry.swift
//  TextShooter
//
//  Created by Kevin Emigh on 3/1/16.
//  Copyright © 2016 Kevin Emigh. All rights reserved.
//

import Foundation
import UIKit

class Geometry
{
    // Takes a CGVector and a CGFloat
    // Returns a new CGVector where each component of v has been multiplied by m
    static func vectorMultiply(v:CGVector, m:CGFloat) -> CGVector
    {
        return CGVector(dx: v.dx * m, dy: v.dy * m)
    }
    
    // Takes two CGPoints
    // Returns a CGVector representing a direction from p1 to p2
    static func vectorBetweenPoints(p1:CGPoint, p2:CGPoint) -> CGVector
    {
        return CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)
    }
    
    // Takes a CGVector
    // Returns a CGFloat containing the length of the vector
    static func vectoryLength(v:CGVector) -> CGFloat
    {
        return CGFloat(sqrtf(powf(Float(v.dx), 2.0) + powf(Float(v.dy), 2.0)))
    }
    
    // Takes 2 CGPoints
    // Returns the distance between them
    static func pointDistance(p1:CGPoint, p2:CGPoint) -> CGFloat
    {
        return CGFloat(sqrtf(powf(Float(p2.x - p1.x), 2.0) + powf(Float(p2.y - p1.y), 2.0)))
    }
}