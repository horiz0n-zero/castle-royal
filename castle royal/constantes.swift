//
//  constantes.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright © 2016 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

var information: InformationGeneral!

var collectionIlot = [CGFloat: ilotInfo]()

var MatchTerminer = false
var MatchGagnant = 0

var collectionHero = [String: heroSprite]()

// constantes 

extension CGFloat {
    
    public static func radian(degree degree: CGFloat) -> CGFloat {
        return (CGFloat(M_PI)*degree)/180
    }
    
    public static func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
    
    public static func random() -> CGFloat { // 0 - 1
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(de: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(de) + 1))
    }
    
    public static func distance(PointA PointA: CGPoint, PointB: CGPoint) -> CGFloat {
        var y = PointB.y - PointA.y
        y *= y
        var x = PointB.x - PointA.x
        x *= x
        let somme = y + x
        return somme*0.5
    }
    
}

public func -(gauche: CGPoint, droit: CGPoint) -> CGPoint {
    return CGPoint(x: gauche.x - droit.x, y: gauche.y - gauche.y)
}

public extension CGSize {
    
    public static func SizeWithRange(ranger: CGFloat) -> CGSize {
        
        let y = CGFloat.random(min: ranger, max: ranger)
        let x = CGFloat.random(min: ranger, max: ranger)
        return CGSize(width: x, height: y)
    }

    
}

public extension CGPoint {
    
    public static func taille(point: CGPoint) -> CGFloat { // retourne la magnitude d'un point
        return CGFloat(sqrtf(Float(point.x*point.x + point.y*point.y)))
    }
    public static func pointAvecRange(ranger: CGFloat, origine: CGPoint) -> CGPoint {
        
        let y = CGFloat.random(min: ranger, max: ranger)
        let x = CGFloat.random(min: ranger, max: ranger)
        return CGPoint(x: origine.x + x, y: origine.y + y)
    }
    
}






