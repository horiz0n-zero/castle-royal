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
            
            if i == 28 || i == 8 || i == 10 {
               let bat = batiment(imageNamed: "zap")
               bat.position = CGPointMake(0, 75)
               sprite.addChild(bat)
               bat.zPosition = sprite.zPosition + 1
               bat.ide = sprite.ide 
               collectionIlot[sprite.ide]?.contient = ilotContient.batiment
               collectionIlot[sprite.ide]!.building = bat
               bat.parametrerLabel()
            }
            
            
            
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
            if superHero is demoniste {
               let demo = superHero as! demoniste
               demo.reflexion()
            }
            if superHero is moltanica {
                let molta = superHero as! moltanica
                molta.reflexion()
            }
            if superHero is vladDracula {
                let vlad = superHero as! vladDracula
                vlad.reflexion()
            }
        }
        
    }
    
    func INITpierre() {
        
        func randomCarte() -> hero {
            let a = Int(arc4random_uniform(4) + 1) // n pour s'assurer de ne pas tomber sur ce qui n'est pas encore integrer
            switch a {
            case 1:
                return hero.mage
            case 2:
                return hero.demoniste
            case 3:
                return hero.moltanica
            case 4:
                return hero.vlad
            default:
                return hero.mage
            }
        }
        
        for i in 1...5 {
            
            let pier = pierre(carte: randomCarte(), numero: i) 
            let info = collectionIlot[key(1, ranger: CGFloat(i))]
            pier.position = CGPoint(x: (info?.ilotReferance.position.x)!, y: (info?.ilotReferance.position.y)! - 130)
            self.addChild(pier)
            self.boite_a_pierre.append(pier)
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
                        
                            
                            switch selectionCarte.pier.contientHero! {
                            case hero.mage:
                                heroPosable = mageSpirituel()
                            case hero.demoniste:
                                heroPosable = demoniste()
                            case hero.moltanica:
                                heroPosable = moltanica()
                            case hero.vlad:
                                heroPosable = vladDracula()
                            default:
                                fatalError("attention aucune carte n'est posable -> selectioncarte.pier.contienthero = nul ou le hero n'est pas specifier")
                            }
                            self.addChild(heroPosable!)
                            
                           heroPosable!.info = heroInfo(colonne: ile.colonne, ranger: ile.ranger)
                           heroPosable?.position = CGPoint(x: ile.position.x, y: ile.position.y + 75)
                           
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
    
   
}


















