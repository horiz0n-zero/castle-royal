//
//  structures.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright © 2016 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

// info general

struct InformationGeneral {
    
    let ScreenWidth: CGFloat
    let ScreenHeight: CGFloat
    let AudioNode: SKNode?
    let AnimationNode: SKNode?
    var solwidth: CGFloat!
    var solHeight: CGFloat!
    init(frame: CGRect, audioNode: SKNode?, animationNode: SKNode?) {
        
    self.ScreenWidth = frame.width
    self.ScreenHeight = frame.height
        self.AudioNode = audioNode
        self.AnimationNode = animationNode
        
    }
    
    func son_hero_attaque() {
        self.AudioNode?.runAction(SKAction.playSoundFileNamed("hero_attack.mp3", waitForCompletion: false))
    }
    func son_batiment_detruit() {
        self.AudioNode?.runAction(SKAction.playSoundFileNamed("buildingEx.mp3", waitForCompletion: false))
    }
    func son_vlad_explo() {
        self.AudioNode?.runAction(SKAction.playSoundFileNamed("vladBim.mp3", waitForCompletion: false))
    }
    
}

// case 

enum ilotContient: UInt8 {
    case vide = 1
    case batiment = 2
    case heroAllier = 3
    case heroEnemie = 4
    case deploiementAllier = 5
    case deploiementEnemie = 6
}

class ilot: SKSpriteNode {
    var ide: CGFloat!
    var colonne: CGFloat!
    var ranger: CGFloat!
    
}

struct ilotInfo {
    
    let colonne: CGFloat
    let ranger: CGFloat
    let ilotReferance: ilot
    var contient: ilotContient = .vide
    var hero: heroSprite? = nil
    var building: batiment? = nil
    let position: CGPoint
    init(colonne: CGFloat, ranger: CGFloat, ilotReferance: ilot) {
        self.colonne = colonne
        self.ranger = ranger
        self.ilotReferance = ilotReferance
        self.position = CGPoint(x: ilotReferance.position.x, y: ilotReferance.position.y - 75)
    }
    
}

struct heroInfo {
    
    var colonne: CGFloat = 0.0
    var ranger: CGFloat = 0.0
    
}

// pierre

enum hero {
    case mage
    case duc
    case demoniste
    case moltanica
    case vlad
}

class batiment: SKSpriteNode {
    var ide: CGFloat = 0.0
    let label = SKLabelNode(text: "4500")
    var pv: Int = 12000 {
        didSet {
            if pv <= 0 {
                collectionIlot[self.ide]!.contient = ilotContient.vide
                collectionIlot[self.ide]!.building = nil
                information.son_batiment_detruit()
                self.removeFromParent()
            } else {
                
                
                switch self.pv {
                case 0...3000:
                    label.fontColor = UIColor.redColor()
                case 3000...8000:
                    label.fontColor = UIColor.orangeColor()
                default:
                    label.fontColor = UIColor.greenColor()
                }
                self.label.text = "\(self.pv)"
                self.label.alpha = 1.0
                self.label.runAction(SKAction.sequence([
                    SKAction.waitForDuration(0.2),
                    SKAction.fadeAlphaTo(0.0, duration: 0.5),
                    ]))
                
            }
        }
    }
    
    func parametrerLabel() {
        self.addChild(label)
        self.label.alpha = 0.0
        label.fontSize = 32
        label.position.y = 50
        label.zPosition = 300
        self.label.fontName = "Baby-blocks"
    }
}

class pierre: SKSpriteNode {
    
    var carte: SKSpriteNode? = nil
    var numero: Int = 0
    var contientHero: hero? = nil
    init(carte: hero, numero: Int) {
        self.contientHero = carte 
        super.init(texture: textures.pierre, color: UIColor.clearColor(), size: CGSize(width: information.ScreenWidth/6, height: information.ScreenWidth/6))
        switch carte {
        case .demoniste:
            self.carte = SKSpriteNode(texture: textures.carteDemoniste)
        case .duc:
            self.carte = SKSpriteNode(texture: textures.carteDuc)
        case .mage:
            self.carte = SKSpriteNode(texture: textures.carteMage)
        case .moltanica:
            self.carte = SKSpriteNode(texture: textures.carteMoltanica)
        case .vlad:
            self.carte = SKSpriteNode(texture: textures.carteVlad)
        }
        
        self.addChild(self.carte!)
        self.numero = numero
        self.zPosition = 999
        self.carte?.zPosition = 1000
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct selection {
    
    var pier: pierre
    var select = false
    var ide: CGFloat = 0.0
    var heroVisible = false
    var ok = false 
    init() {
        self.pier = pierre(carte: hero.demoniste, numero: 0)
    }
    
}





