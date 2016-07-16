//
//  GameScene.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright (c) 2016 Antoine FeuFeu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let AudioNodeGeneral = SKNode()
    let AnimationNodeGenerel = SKNode()

    let IlotNode = SKNode()
    
    // pierres :
    var boite_a_pierre = [pierre]()
    var selectionCarte = selection()
    let selectionSprite = SKSpriteNode(texture: textures.pierre_select, color: UIColor.clearColor(), size: CGSize(width: information.ScreenWidth/6, height: information.ScreenWidth/6))
    let selectionSpriteIlot = SKSpriteNode(texture: textures.zone_select)
    var heroPosable: heroSprite? = nil
    
    var collectionHero = [heroSprite]()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    override init(size: CGSize) {
        super.init(size: size)
        self.addChild(AudioNodeGeneral)
        self.addChild(AnimationNodeGenerel)
        information = InformationGeneral(frame: self.frame, audioNode: self.AudioNodeGeneral, animationNode: self.AnimationNodeGenerel)
        information.solHeight = textures.zone.size().height
        information.solwidth = textures.zone.size().width
        self.addChild(IlotNode)
        self.addChild(selectionSprite)
        self.selectionSprite.hidden = true
        self.selectionSprite.zPosition = 998
        self.addChild(selectionSpriteIlot)
        self.selectionSpriteIlot.hidden = true
        self.selectionSpriteIlot.zPosition = 42
        // demarrer positionement et init des ilots/infoilots
        var colonne: CGFloat = 1.0
        var ranger: CGFloat = 0.0
        for i in 1...35 {
            
            let sprite = ilot(texture: textures.zone) // colonne et ranger de l'ilot utiliser dans touch
            sprite.colonne = colonne
            sprite.zPosition = 40 - CGFloat(i)
            ranger += 1
            sprite.ranger = ranger
            if ranger > 5 {
                ranger = 1
                colonne += 1
            }
            sprite.position = CGPoint(x: self.frame.origin.x + (ranger*sprite.size.width) - 32.5, y: self.frame.origin.y + 100 + (colonne*109.0))
            
            let info = ilotInfo(colonne: colonne, ranger: ranger, ilotReferance: sprite) // utilisez pour les heros, batiments ...
            sprite.ide = key(colonne, ranger: ranger)
            collectionIlot[sprite.ide] = info
            collectionIlot[sprite.ide]?.contient = ilotContient.vide
            IlotNode.addChild(sprite)
            
            if i == 1 || i == 2 || i == 3 || i == 4 || i == 5 { // zone de deploiment allier
               sprite.texture = textures.zone_deplacement
               collectionIlot[sprite.ide]?.contient = ilotContient.deploiementAllier
            }
            if i == 31 || i == 32 || i == 33 || i == 34 || i == 35 { // <-- enemie
                sprite.texture = textures.zone_deplacement
                collectionIlot[sprite.ide]?.contient = ilotContient.deploiementEnemie
            }
            
            let lab = SKLabelNode(text: "\(collectionIlot[sprite.ide]!.contient)")
            lab.fontColor = UIColor.blueColor()
            sprite.label = lab
            sprite.addChild(lab)
            
        }
        // fin ilot 
        // pierre 
        INITpierre()
        
        self.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.waitForDuration(1),
            SKAction.runBlock({
                self.tour()
            })
            ])))
        
    }
    
    func tour() {
       
        for superHero in collectionHero {
            
            if superHero is mageSpirituel {
               let mage = superHero as! mageSpirituel
               mage.reflexion()
            }
            
        }
        
    }
    
    func INITpierre() {
        
        for i in 1...5 {
            
            let pier = pierre(carte: hero.mage, numero: i)
            let info = collectionIlot[key(1, ranger: CGFloat(i))]
            pier.position = CGPoint(x: (info?.ilotReferance.position.x)!, y: (info?.ilotReferance.position.y)! - 130)
            self.addChild(pier)
            self.boite_a_pierre.append(pier)
        }
        
        func randomCarte() -> hero {
            let a = Int(arc4random_uniform(4) + 1)
            switch a {
            case 1:
                return hero.mage
            case 2:
                return hero.demoniste
            case 3:
                return hero.moltanica
            case 4:
                return hero.duc
            default:
                return hero.mage
            }
        }
        
    }

    func key(colonne: CGFloat, ranger: CGFloat) -> CGFloat {
        return colonne*10 + ranger
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            for pier in boite_a_pierre {
                
                if pier.containsPoint(location) {
                    
                    selectionCarte.heroVisible = false 
                    
                    if selectionCarte.select == true && selectionCarte.pier.numero == pier.numero {
                        
                        pier.runAction(SKAction.playSoundFileNamed("select_ok.mp3", waitForCompletion: false))
                        selectionCarte.pier = pier 
                        selectionSprite.position = pier.position
                        selectionSprite.hidden = true
                        selectionCarte.select = false
                        
                    } else if selectionCarte.select == true && selectionCarte.pier.numero != pier.numero  {
                        
                        pier.runAction(SKAction.playSoundFileNamed("select.caf", waitForCompletion: false))
                        selectionCarte.pier = pier
                        selectionSprite.position = pier.position
                        selectionSprite.hidden = false
                        
                    } else if selectionCarte.select == false {
                        pier.runAction(SKAction.playSoundFileNamed("select.caf", waitForCompletion: false))
                        selectionCarte.select = true
                        selectionCarte.pier = pier
                        selectionSprite.position = pier.position
                        selectionSprite.hidden = false
                    }
                   
                   
                }
                
            }
            
        }
    } // touch began 
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if selectionCarte.select {
                
                
                for child in IlotNode.children {
                    
                    if child.containsPoint(CGPoint(x: location.x, y: location.y - 75)) {
                        
                        let ile = child as! ilot
                        
                       self.selectionSpriteIlot.position = child.position
                       self.selectionSpriteIlot.hidden = false
                       
                        
                        if heroPosable == nil && selectionCarte.pier.carte != nil {
                        
                            
                           let mage = mageSpirituel()
                           heroPosable = mage
                           mage.info = heroInfo(colonne: ile.colonne, ranger: ile.ranger)
                           heroPosable?.position = CGPoint(x: ile.position.x, y: ile.position.y + 75)
                           self.addChild(mage)
                            
                           selectionCarte.ide = ile.ide 
                           selectionSpriteIlot.blendMode = SKBlendMode.Alpha
                           selectionCarte.ok = true
                            
                        } else if collectionIlot[ile.ide]?.contient == ilotContient.deploiementAllier {
                            heroPosable?.position = CGPoint(x: ile.position.x, y: ile.position.y + 75)
                            heroPosable?.info = heroInfo(colonne: ile.colonne, ranger: ile.ranger)
                            selectionSpriteIlot.blendMode = SKBlendMode.Alpha
                            selectionCarte.ok = true
                        } else {
                            selectionSpriteIlot.blendMode = SKBlendMode.Subtract
                            heroPosable?.position = CGPoint(x: ile.position.x, y: ile.position.y + 75)
                            selectionCarte.ok = false
                        }
                        selectionCarte.heroVisible = true
                        
                    }
                    
                }
                
                
            }
            
        }
    } //
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.selectionSpriteIlot.hidden = true
        
        if selectionCarte.select == true && selectionCarte.heroVisible == true && selectionCarte.ok == true {
            
            if let copy = heroPosable {
               self.heroPosable?.removeFromParent()
               self.heroPosable = nil
               self.addChild(copy)
               self.collectionHero.append(copy)
               selectionCarte.select = false
               selectionSprite.hidden = true
                
                let number = selectionCarte.pier.numero
               
               
                
               self.selectionCarte.pier.carte?.runAction(SKAction.sequence([
                SKAction.fadeAlphaTo(0.0, duration: 1),
                SKAction.waitForDuration(1),
                SKAction.removeFromParent()
                ]))
                
                for pier in boite_a_pierre {
                    if pier.numero == number {
                       pier.carte = nil
                    }
                }
                
                
            }
            
        } else if selectionCarte.ok == false {
            
            heroPosable?.removeFromParent()
            heroPosable = nil
            selectionCarte.select = false
            selectionSprite.hidden = true
            
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        for node in IlotNode.children {
            
            if node is ilot {
               let ile = node as! ilot
               ile.label.text = "\(collectionIlot[ile.ide]!.contient)"
            }
            
        }
    }

}


















