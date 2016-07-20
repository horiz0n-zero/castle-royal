//
//  hero.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright © 2016 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

public class heroSprite: SKSpriteNode {
    
   
    deinit { }
    
    var action: String!
    var gauchiste: Bool = true
    var useAutoResize = false
    var t_devant: [SKTexture]!
    var t_devantATK: [SKTexture]!
    var t_devantIMO: [SKTexture]!
    var t_derrier: [SKTexture]!
    var t_derrierATK: [SKTexture]!
    var t_derrierIMO: [SKTexture]!
    var t_profil: [SKTexture]!
    var t_profilATK: [SKTexture]!
    var t_profilIMO: [SKTexture]!
    var heroType: hero!
    private var selfMouvement: mouvement!
    
    var CapaciterIndicateurMax: UInt8 = 3
    var CapaciterIndicateur: UInt8 = 0 {
        didSet {
            if self.CapaciterIndicateur == self.CapaciterIndicateurMax+1 {
               self.CapaciterIndicateur = 0
               self.capaciter()
            }
        }
    }
    let CapaciterNode = SKNode()
    
    
    
    private func capaciter() {
        
        
        switch self.heroType {
        case hero.mage?:
            var limite = 0
            for (_, enemie) in collectionHero.enumerate() {
                
                let enemieHero = enemie.1
                if enemieHero.allier != self.allier {
                    if limite > 3 {
                        return
                    }
                   self.projectile(self.heroType, cible: collectionIlot[enemieHero.key()]!)
                   limite += 1
                }
                
            }
        case hero.demoniste?:
            var limite = 0
            for (_, enemie) in collectionHero.enumerate() {
                
                let enemieHero = enemie.1
                if enemieHero.allier != self.allier {
                    if limite > 4 {
                        return
                    }
                    self.projectile(self.heroType, cible: collectionIlot[enemieHero.key()]!)
                    limite += 1
                }
                
            }
        case hero.harpie?:
            var limite = 0
            for (_, enemie) in collectionHero.enumerate() {
                
                let enemieHero = enemie.1
                
                if enemieHero.allier != self.allier {
                    
                    if limite > 2 {
                        return
                    }
                    
                    self.projectile(self.heroType, cible: collectionIlot[enemieHero.key()]!)
                    limite += 1
                }
                
            }
        case hero.moltanica?:
            
            func check(ile: ilotInfo) {
                if let enemie = ile.hero {
                    if enemie.pv >= 0 {
                    enemie.degat -= 100
                    let sprite = SKSpriteNode(texture: textures.moltaDesactive[0])
                    information.AnimationNode?.addChild(sprite)
                    sprite.position = enemie.position
                    sprite.zPosition = enemie.zPosition + 2
                    sprite.size = CGSize(width: information.solwidth, height: information.solwidth)
                    sprite.runAction(SKAction.sequence([
                        SKAction.animateWithTextures(textures.moltaDesactive, timePerFrame: 0.05),
                        SKAction.waitForDuration(0.65),
                        SKAction.removeFromParent()
                        ]))
                    print(enemie.degat)
                    }
                }
            }
            
            switch self.selfMouvement {
            case .bas(let b)?:
                check(b)
            case .droit(let d)?:
                check(d)
            case .gauche(let g)?:
                check(g)
            case .haut(let h)?:
                check(h)
            default: break
            }
            
        case hero.roiFantome?:
            for (_, enemie) in collectionHero.enumerate() {
               
                let enemieHero = enemie.1
                if enemieHero.allier != self.allier {
                    
                    self.projectile(self.heroType, cible: collectionIlot[enemieHero.key()]!)
                    return
                }
                
            }
        case hero.sirenia?:
            for (_, enemie) in collectionHero.enumerate() {
                
                let enemieHero = enemie.1
                if enemieHero.allier != self.allier {
                    
                    self.projectile(self.heroType, cible: collectionIlot[enemieHero.key()]!)
                    
                }
                
            }
        case hero.vlad?:
        print("vlad")
        default:
            print("le hero ", self.heroType, "n'a pas pu utiliser sa capaciter car elle n'est pas suporter ")
        }
        
        self.CapaciterNode.removeAllChildren()
    }
    
    private func genCristalIndicateur() -> SKSpriteNode {
        let cristal = SKSpriteNode(texture: textures.capaciter)
        cristal.zPosition = self.zPosition + 5
        cristal.alpha = 0.7
        return cristal
    }
    private func scaleCristal(sprite: SKSpriteNode) {
        sprite.setScale(0.0)
        sprite.runAction(SKAction.scaleTo(1.0, duration: 0.3))
    }
    
    private func ajouterIndicateurCapaciter() {
        
        
        self.CapaciterIndicateur += 1
        
        switch self.CapaciterIndicateurMax {
        case 1: // 1 cristaux
            switch self.CapaciterIndicateur {
            case 0:
                self.CapaciterNode.removeAllChildren()
            case 1:
                let cristal = genCristalIndicateur()
                cristal.position = CGPointMake(0, -15)
                scaleCristal(cristal)
                self.CapaciterNode.addChild(cristal)
            default:
                break
            }
        case 3: // trois cristaux
            switch self.CapaciterIndicateur {
            case 0:
                self.CapaciterNode.removeAllChildren()
            case 1:
                let cristal = genCristalIndicateur()
                cristal.position = CGPointMake(0, -15)
                scaleCristal(cristal)
                self.CapaciterNode.addChild(cristal)
            case 2:
                let cristal = genCristalIndicateur()
                cristal.position = CGPointMake(12, 4)
                scaleCristal(cristal)
                self.CapaciterNode.addChild(cristal)
            case 3:
                let cristal = genCristalIndicateur()
                cristal.position = CGPointMake(-12, 4)
                scaleCristal(cristal)
                self.CapaciterNode.addChild(cristal)
            default:
                print("erreur ! l'indicateur ne suit pas l'incation maximum")
            }
        default:
            print("erreur ! \(self.CapaciterIndicateurMax) n' est pas supporter")
        }
        
        
    }
    
    
    var Halo: SKSpriteNode = SKSpriteNode()
    var flying = false
    var pv: Int = 500 {
        didSet {
            if pv <= 0 {
                if collectionIlot[self.key()]?.contient != ilotContient.deploiementAllier && collectionIlot[self.key()]?.contient != ilotContient.deploiementEnemie {
                    collectionIlot[self.key()]?.contient = ilotContient.vide
                    collectionIlot[self.key()]?.hero = nil
                }
                collectionHero.removeValueForKey(self.action)
                self.removeAllChildren()
                self.removeAllActions()
                self.removeFromParent()
                
                
            } else {
                switch self.pv {
                case 0...Int(self.label.pvOriginel/4):
                    label.fontColor = UIColor.redColor()
                case Int(self.label.pvOriginel/4)...Int(self.label.pvOriginel/2):
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
    var BatimentCible: ilotContient = ilotContient.batimentEnemie
    var allier: Bool = true {
        didSet {
            if self.allier {
                self.TypeInverse = ilotContient.heroEnemie
                self.BatimentCible = ilotContient.batimentEnemie
            } else {
                self.TypeInverse = ilotContient.heroAllier
                self.BatimentCible = ilotContient.batimentAllier
            }
        }
    }
    var TypeInverse: ilotContient = ilotContient.heroEnemie
    var degat: Int = 50
    
    var info: heroInfo! // set ou crash
    
    let label = SKSuperLabelNode(fontNamed: "SegoePrint-Bold")
    
    private func initLabel() {
        self.addChild(CapaciterNode)
        self.label.fontColor = UIColor.greenColor()
        self.label.fontSize = 32
        self.label.text = nil
        self.label.position.y += 30
        self.label.pvOriginel = self.pv
        self.addChild(label)
    }
    
    func initHalo() {
        let halo = SKSpriteNode(texture: self.allier ? textures.haloVert : textures.haloViolet)
        self.Halo = halo
        Halo.position.y -= 25
        Halo.zPosition = -1
        Halo.alpha = 0.5
        halo.blendMode = SKBlendMode.Add
        self.addChild(Halo)
    }
    
    private enum mouvement {
        case haut(ilotInfo)
        case bas(ilotInfo)
        case gauche(ilotInfo)
        case droit(ilotInfo)
    }

    private func key() -> CGFloat {
        return self.info.colonne*10 + self.info.ranger
    }
    private func key(colonnesup sup: CGFloat, rangersup: CGFloat) -> CGFloat {
        return (self.info.colonne+sup)*10 + rangersup+self.info.ranger
    }
    private func avancerColonne() {
        self.info.colonne += 1
        if self.allier {
        collectionIlot[self.key()]?.contient = ilotContient.heroAllier
        } else {
        collectionIlot[self.key()]?.contient = ilotContient.heroEnemie
        }
        collectionIlot[self.key()]?.hero = self
    }
    private func reculerColonne() {
        self.info.colonne -= 1
        if self.allier {
            collectionIlot[self.key()]?.contient = ilotContient.heroAllier
        } else {
            collectionIlot[self.key()]?.contient = ilotContient.heroEnemie
        }
        collectionIlot[self.key()]?.hero = self
    }
    private func avancerRanger() {
        self.info.ranger += 1
        if self.allier {
            collectionIlot[self.key()]?.contient = ilotContient.heroAllier
        } else {
            collectionIlot[self.key()]?.contient = ilotContient.heroEnemie
        }
        collectionIlot[self.key()]?.hero = self
    }
    private func reculerRanger() {
        self.info.ranger -= 1
        if self.allier {
            collectionIlot[self.key()]?.contient = ilotContient.heroAllier
        } else {
            collectionIlot[self.key()]?.contient = ilotContient.heroEnemie
        }
        collectionIlot[self.key()]?.hero = self
    }
    private func vider() {
        if collectionIlot[self.key()]?.contient != ilotContient.deploiementAllier && collectionIlot[self.key()]?.contient != ilotContient.deploiementEnemie {
        collectionIlot[self.key()]?.contient = ilotContient.vide
        collectionIlot[self.key()]?.hero = nil 
        }
        collectionIlot[self.key()]?.hero = self 
        if collectionIlot[self.key()]?.contient == ilotContient.deploiementAllier || collectionIlot[self.key()]?.contient == ilotContient.deploiementEnemie && collectionIlot[self.key()]?.hero != nil {
            collectionIlot[self.key()]?.hero = nil
        }
        
    }
    private func remplir(key: CGFloat) {
        if self.allier {
        collectionIlot[key]?.contient = ilotContient.heroAllier
        } else {
        collectionIlot[key]?.contient = ilotContient.heroEnemie
        }
        collectionIlot[key]?.hero = self
    }
    
    // =============================== reflexion
    func devant() {
        animer(self.t_devant)
    }
    func derriere() {
        animer(self.t_derrier)
    }
    func profil() {
        animer(self.t_profil)
    }
    func devantIMMO() {
        animerNR(self.t_devantIMO)
    }
    func derriereIMMO() {
        animerNR(self.t_derrierIMO)
    }
    func profilIMMO() {
        animerNR(self.t_profilIMO)
    }
    func devantATK() {
        animer(self.t_devantATK)
    }
    func derriereATK() {
        animer(self.t_derrierATK)
    }
    func profilATK() {
        animer(self.t_profilATK)
    }
    
    
    private func animer(textures: [SKTexture]) {
        self.removeActionForKey(action)
        if !self.useAutoResize {
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1), withKey: action)
        } else {
          self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false), withKey: action)
        }
        
    }
    private func animerNR(textures: [SKTexture]) {
        self.removeActionForKey(action)
        if !self.useAutoResize {
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 0.1)), withKey: action)
        } else {
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false)), withKey: action)
        }
        
    }
    
    
    func reflexion() {
        
        let haut = self.key(colonnesup: 1, rangersup: 0)
        let bas = self.key(colonnesup: -1, rangersup: 0)
        let gauche = self.key(colonnesup: 0, rangersup: -1)
        let droit = self.key(colonnesup: 0, rangersup: 1)
        
        var mouvements = [mouvement]()
        var attaque: Bool = false
        
        if let h = collectionIlot[haut] {
            if h.contient == ilotContient.vide {
                mouvements.append(mouvement.haut(h))
            } else if h.contient == self.BatimentCible || h.contient == self.TypeInverse {
                self.attaque(mouvement.haut(h))
                attaque = true
                return
            } else {
                self.derriereIMMO()
            }
        }
        if let b = collectionIlot[bas] {
            if b.contient == ilotContient.vide {
                mouvements.append(mouvement.bas(b))
            } else if b.contient == self.BatimentCible || b.contient == self.TypeInverse {
                self.attaque(mouvement.bas(b))
                attaque = true
                return
            } else {
                self.devantIMMO()
            }
        }
        if let g = collectionIlot[gauche] {
            if g.contient == ilotContient.vide {
                mouvements.append(mouvement.gauche(g))
            } else if g.contient == self.BatimentCible || g.contient == self.TypeInverse {
                self.attaque(mouvement.gauche(g))
                attaque = true
                return
            } else {
                if self.gauchiste == false {
                    self.xScale = self.xScale * -1
                    gauchiste = true
                }
                self.profilIMMO()
            }
        }
        if let d = collectionIlot[droit] {
            if d.contient == ilotContient.vide {
                mouvements.append(mouvement.droit(d))
            } else if d.contient == self.BatimentCible || d.contient == self.TypeInverse {
                self.attaque(mouvement.droit(d))
                attaque = true
                return
            } else {
                if self.gauchiste == true {
                    self.xScale = self.xScale * -1
                    gauchiste = false
                }
                self.profilIMMO()
            }
        }
        
        if mouvements.count == 0 || attaque == true {
            return // break mother fuck us !
        }
        
        let jevaisoumaintenant = Int(arc4random_uniform(UInt32(mouvements.count)))
        self.vider()
        self.selfMouvement = mouvements[jevaisoumaintenant]
        self.sedeplacer(self.selfMouvement)
        
    }
    
    private func sedeplacer(movement: mouvement) {
        self.removeActionForKey(action)
        func deplacer(point: CGPoint, textures: [SKTexture]) {
            let pointReel = CGPoint(x: point.x, y: point.y + 75)
            if !self.useAutoResize {
            self.runAction(SKAction.group([
                SKAction.animateWithTextures(textures, timePerFrame: 0.1),
                SKAction.moveTo(pointReel, duration: 1)
                ]))
            } else {
            self.runAction(SKAction.group([
                SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false),
                SKAction.moveTo(pointReel, duration: 1)
                ]))
            }
            
        }
        
        switch movement {
        case .bas(let b):
            deplacer(b.ilotReferance.position, textures: self.t_devant)
            self.reculerColonne()
        case .droit(let d):
            deplacer(d.ilotReferance.position, textures: self.t_profil)
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.avancerRanger()
        case .gauche(let g):
            deplacer(g.ilotReferance.position, textures: self.t_profil)
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.reculerRanger()
        case .haut(let h):
            deplacer(h.ilotReferance.position, textures: self.t_derrier)
            self.avancerColonne()
        }
        
        
    }
    
    private func attaque(movement: mouvement) {
        self.ajouterIndicateurCapaciter()
        information.son_hero_attaque()
        switch movement {
        case .bas(let b):
            self.devantATK()
            self.projectile(self.heroType, cible: b)
        case .droit(let d):
            self.profilATK()
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.projectile(self.heroType, cible: d)
        case .gauche(let g):
            self.profilATK()
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.projectile(self.heroType, cible: g)
        case .haut(let h):
            self.derriereATK()
            self.projectile(self.heroType, cible: h)
        }
        
    }
    // fin de reflexion ================
    private func projectile(heroType: hero, cible: ilotInfo) {
        
        func point() -> CGPoint {
            
            var randomX = CGFloat(arc4random_uniform(20) + 1)
            var randomY = CGFloat(arc4random_uniform(20) + 1)
            let un = arc4random_uniform(3)
            switch un {
            case 0:
                randomX = -randomX
            case 1:
                randomY = -randomY
            case 2:
                randomY = -randomY
                randomX = -randomX
            default:
                break
            }
            return CGPoint(x: cible.ilotReferance.position.x + randomX, y: cible.ilotReferance.position.y + randomY + 75)
            
        }
    
        let positionFinal = point()
        if cible.building != nil && cible.hero != nil {
            fatalError("erreur ! un ilot contiendrait a la fois un batiment et un hero ?")
        } 
        
        
        switch heroType {
        case .mage:
            let projectile = SKSpriteNode(texture: textures.anim_projectile_mage)
            projectile.position = self.position
            information.AnimationNode?.addChild(projectile)
            projectile.size = CGSize(width: 40, height: 40)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            let eclat = SKSpriteNode(texture: textures.anim_mage_bim[0])
            eclat.zPosition = self.zPosition - 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    eclat.hidden = false
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_mage_bim, timePerFrame: 0.05))
                }),
                SKAction.waitForDuration(0.4),
                SKAction.runBlock({
                    eclat.removeFromParent()
                })
                ]))
        case .demoniste:
            let projectile = SKSpriteNode(texture: textures.anim_projectile_flamme[0])
            projectile.runAction(SKAction.animateWithTextures(textures.anim_projectile_flamme, timePerFrame: 0.1, resize: true, restore: false))
            projectile.position = self.position
            information.AnimationNode?.addChild(projectile)
            projectile.size = CGSize(width: 80, height: 80)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            projectile.position.y += 25
            projectile.position.x += 10
            let eclat = SKSpriteNode(texture: textures.anim_demo_bim[0])
            eclat.zPosition = self.zPosition - 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    eclat.hidden = false
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_demo_bim, timePerFrame: 0.1))
                }),
                SKAction.waitForDuration(0.5),
                SKAction.runBlock({
                    eclat.removeFromParent()
                })
                ]))
        case .moltanica:
            let projectile = SKSpriteNode(texture: textures.anim_projectile_flamme[0])
            projectile.runAction(SKAction.animateWithTextures(textures.anim_projectile_flamme, timePerFrame: 0.1, resize: true, restore: false))
            projectile.position = self.position
            projectile.position.y += 20
            information.AnimationNode?.addChild(projectile)
            projectile.size = CGSize(width: 160, height: 160)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            let eclat = SKSpriteNode(texture: textures.anim_demo_bim[0])
            eclat.zPosition = self.zPosition - 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_moltanica_bim, timePerFrame: 0.1, resize: true, restore: false))
                    eclat.hidden = false
                }),
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    eclat.removeFromParent()
                })
                ]))
            
        case .vlad:
            let projectile = SKSpriteNode(texture: textures.anim_vlad_projectile)
            projectile.position = self.position
            projectile.position.y += 20
            projectile.runAction(SKAction.rotateToAngle(CGFloat(M_PI*10), duration: 1))
            projectile.size = CGSize(width: 50, height: 50)
            projectile.alpha = 0.9
            information.AnimationNode?.addChild(projectile)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            let eclat = SKSpriteNode(texture: textures.anim_vladBim[0])
            eclat.zPosition = self.zPosition - 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_vladBim, timePerFrame: 0.05, resize: true, restore: false))
                    information.son_vlad_explo()
                    eclat.hidden = false
                }),
                SKAction.waitForDuration(0.3),
                SKAction.runBlock({
                    eclat.removeFromParent()
                })
                ]))
        case .roiFantome:
            let projectile = SKSpriteNode(texture: textures.eclatBleu[0])
            projectile.position = self.position
            projectile.position.y += 20
            projectile.runAction(SKAction.rotateToAngle(CGFloat(M_PI*10), duration: 1))
            projectile.size = CGSize(width: 50, height: 50)
            projectile.alpha = 0.9
            information.AnimationNode?.addChild(projectile)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            let eclat = SKSpriteNode(texture: textures.anim_vladBim[0])
            eclat.zPosition = self.zPosition + 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.eclatBleu, timePerFrame: 0.1, resize: true, restore: false))
                    information.son_roiFantomeChoc()
                    eclat.hidden = false
                }),
                SKAction.waitForDuration(0.5),
                SKAction.runBlock({
                    eclat.removeFromParent()
                })
                ]))
        case .harpie:
            let projectile = SKSpriteNode(texture: textures.plume)
            projectile.position = self.position
            projectile.position.y += 20
            projectile.runAction(SKAction.rotateToAngle(CGFloat(M_PI), duration: 1))
            projectile.size = CGSize(width: 23, height: 39)
            projectile.alpha = 0.9
            information.AnimationNode?.addChild(projectile)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    for _ in 1...3 {
                        let plume = SKSpriteNode(texture: textures.plume)
                        plume.position = positionFinal
                        plume.runAction(SKAction.moveTo(point(), duration: 0.5))
                        plume.name = "plume"
                        plume.size = CGSize(width: 9, height: 18)
                        plume.alpha = 0.5
                        plume.zPosition = self.zPosition + 3
                        information.AnimationNode?.addChild(plume)
                    }
                    
                }),
                SKAction.waitForDuration(0.5),
                SKAction.runBlock({
                    information.AnimationNode?.enumerateChildNodesWithName("plume", usingBlock: { (node, _) in
                        node.removeFromParent()
                    })
                })
                ]))
            
        case .grimfield:
            let projectile = SKSpriteNode(texture: textures.anim_projectile_grim[0])
            projectile.position = self.position
            projectile.position.y += 20
            projectile.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(textures.anim_projectile_grim, timePerFrame: 0.1)))
            projectile.size = CGSize(width: 50, height: 50)
            information.AnimationNode?.addChild(projectile)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            let eclat = SKSpriteNode(texture: textures.anim_eclat_grim[0])
            let eclatd = SKSpriteNode(texture: textures.anim_eclat_grimDeux[0])
            eclatd.size = CGSize(width: 25, height: 25)
            eclat.size = CGSize(width: 75, height: 50)
            eclatd.hidden = true
            eclatd.zPosition = self.zPosition + 2
            eclat.zPosition = self.zPosition + 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    information.AnimationNode?.addChild(eclatd)
                    eclatd.position = positionFinal
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_eclat_grim, timePerFrame: 0.05, resize: true, restore: false))
                    eclatd.runAction(SKAction.animateWithTextures(textures.anim_eclat_grimDeux, timePerFrame: 0.05, resize: true, restore: false))
                    eclat.hidden = false
                    eclatd.hidden = false
                }),
                SKAction.waitForDuration(0.3),
                SKAction.runBlock({
                    eclat.removeFromParent()
                    eclatd.removeFromParent()
                })
                ]))
        case .sirenia:
            let projectile = SKSpriteNode(texture: textures.flechette)
            projectile.position = self.position
            information.AnimationNode?.addChild(projectile)
            projectile.size = CGSize(width: 40, height: 40)
            projectile.runAction(SKAction.moveTo(positionFinal, duration: 0.6))
            projectile.zPosition = self.zPosition - 1
            let eclat = SKSpriteNode(texture: textures.anim_eclat_sirenia[0])
            eclat.zPosition = self.zPosition + 2
            eclat.hidden = true
            eclat.size = CGSize(width: 80, height: 80)
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.6),
                SKAction.runBlock({
                    projectile.removeFromParent()
                    information.AnimationNode?.addChild(eclat)
                    eclat.hidden = false
                    eclat.position = positionFinal
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_eclat_sirenia, timePerFrame: 0.05))
                }),
                SKAction.waitForDuration(0.4),
                SKAction.runBlock({
                    eclat.removeFromParent()
                })
                ]))
        default:
            break
        }
        
        if let building = cible.building {
            
            
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.9),
                SKAction.runBlock({
                    building.pv -= self.degat
                })
                ]))
            
        }
        if let heroCible = cible.hero {
            
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.9),
                SKAction.runBlock({
                    heroCible.pv -= self.degat
                })
                ]))
            
        }
        
        
    }
    
    func InfligerDommage(dommage: Int, cible: ilotInfo) {
        if let building = cible.building {
            
            
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.9),
                SKAction.runBlock({
                    building.pv -= dommage
                })
                ]))
            
        }
        if let heroCible = cible.hero {
            
            information.AnimationNode?.runAction(SKAction.sequence([
                SKAction.waitForDuration(0.9),
                SKAction.runBlock({
                    heroCible.pv -= dommage
                })
                ]))
            
        }

    }
    
    
}
// hero ==============================================================================
class mageSpirituel: heroSprite {
    
    
    
    init() {
        super.init(texture: textures.mage_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth/3, height: information.solwidth/3))
        self.t_devant = textures.mage_devant
        self.t_profil = textures.mage_profil
        self.t_derrier = textures.mage_derriere
        self.t_devantATK = textures.mage_devant_atk
        self.t_profilATK = textures.mage_profil_atk
        self.t_derrierATK = textures.mage_derriere_atk
        self.t_profilIMO  = textures.mage_profil_im
        self.t_derrierIMO = textures.mage_derriere_im
        self.t_devantIMO = textures.mage_devant_im
        self.heroType = hero.mage
        self.action = String(NSUUID.init())
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 250
        self.degat = 550
        self.initLabel()
        self.flying = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class demoniste: heroSprite { // demoniste
    
    init() {
        super.init(texture: textures.mage_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth/2, height: information.solwidth*0.75))
        action = String(NSUUID.init())
        self.t_devant = textures.demo_devant
        self.t_profil = textures.demo_profil
        self.t_derrier = textures.demo_derriere
        self.t_devantATK = textures.demo_devant_atk
        self.t_profilATK = textures.demo_profil_atk
        self.t_derrierATK = textures.demo_derriere_atk
        self.t_profilIMO  = textures.demo_profil_im
        self.t_derrierIMO = textures.demo_derriere_im
        self.t_devantIMO = textures.demo_devant_im
        self.heroType = hero.demoniste
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 750
        self.degat = 175
        self.initLabel()
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class moltanica: heroSprite { // moltanica
    
    init() {
        super.init(texture: textures.molta_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth*1.5, height: information.solwidth*1.5))
        action = String(NSUUID.init())
        self.useAutoResize = true
        self.t_devant = textures.molta_devant
        self.t_profil = textures.molta_profil
        self.t_derrier = textures.molta_derriere
        self.t_devantATK = textures.molta_devant_atk
        self.t_profilATK = textures.molta_profil_atk
        self.t_derrierATK = textures.molta_derriere_atk
        self.t_profilIMO  = textures.molta_profil_im
        self.t_derrierIMO = textures.molta_derriere_im
        self.t_devantIMO = textures.molta_devant_im
        self.heroType = hero.moltanica
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 1700
        self.degat = 200
        self.initLabel()
        self.flying = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class vladDracula: heroSprite { // vlad dracula
    
    
    init() {
       
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth, height: information.solwidth*0.7))
        action = String(NSUUID.init())
        self.useAutoResize = true
        self.t_devant = textures.vlad_devant
        self.t_profil = textures.vlad_profil
        self.t_derrier = textures.vlad_derriere
        self.t_devantATK = textures.vlad_devant_atk
        self.t_profilATK = textures.vlad_profil_atk
        self.t_derrierATK = textures.vlad_derriere_atk
        self.t_profilIMO  = textures.vlad_profil_im
        self.t_derrierIMO = textures.vlad_derriere_im
        self.t_devantIMO = textures.vlad_devant_im
        self.heroType = hero.vlad
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 950
        self.degat = 300
        self.initLabel()
        self.flying = true 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class roiFantome: heroSprite { // roi fantome ==============================================================================================
    
    
    init() {
        
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth, height: information.solwidth))
        action = String(NSUUID.init())
        self.useAutoResize = true
        self.CapaciterIndicateurMax = 0
        self.t_devant = textures.roi_devant
        self.t_profil = textures.roi_profil
        self.t_derrier = textures.roi_derriere
        self.t_devantATK = textures.roi_devant_atk
        self.t_profilATK = textures.roi_profil_atk
        self.t_derrierATK = textures.roi_derriere_atk
        self.t_profilIMO  = textures.roi_profil_im
        self.t_derrierIMO = textures.roi_derriere_im
        self.t_devantIMO = textures.roi_devant_im
        self.heroType = hero.roiFantome
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 800
        self.degat = 200
        self.initLabel()
        self.flying = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class grimfield: heroSprite { // diaboluc ==============================================================================================
    
    var FormeDemon = false
    
    func SwitcherTextures() {
        if !self.FormeDemon {
            self.t_devant = textures.grim_devant
            self.t_profil = textures.grim_profil
            self.t_derrier = textures.grim_derriere
            self.t_devantATK = textures.grim_devant_atk
            self.t_profilATK = textures.grim_profil_atk
            self.t_derrierATK = textures.grim_derriere_atk
            self.t_profilIMO  = textures.grim_profil_im
            self.t_derrierIMO = textures.grim_derriere_im
            self.t_devantIMO = textures.grim_devant_im
        } else {
            self.t_devant = textures.grimd_devant
            self.t_profil = textures.grimd_profil
            self.t_derrier = textures.grimd_derriere
            self.t_devantATK = textures.grimd_devant_atk
            self.t_profilATK = textures.grimd_profil_atk
            self.t_derrierATK = textures.grimd_derriere_atk
            self.t_profilIMO  = textures.grimd_profil_im
            self.t_derrierIMO = textures.grimd_derriere_im
            self.t_devantIMO = textures.grimd_devant_im
        }
    }
    
    init() {
        
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth*0.7, height: information.solwidth*0.7))
        action = String(NSUUID.init())
        self.useAutoResize = true
        self.SwitcherTextures()
        self.heroType = hero.grimfield
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 1000
        self.degat = 160
        self.initLabel()
        self.flying = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func transforme() {
        let sprite = SKSpriteNode(texture: textures.trans[0])
        self.addChild(sprite)
        sprite.runAction(SKAction.sequence([
            SKAction.animateWithTextures(textures.trans, timePerFrame: 0.05), SKAction.waitForDuration(0.5), SKAction.removeFromParent()
        ]))
    }
    
    private override func capaciter() {
        
        if !self.FormeDemon {
           self.FormeDemon = true
           SwitcherTextures()
           transforme()
           self.pv += 1000 - self.pv
           self.degat *= 2
            self.runAction(SKAction.sequence([SKAction.waitForDuration(10), SKAction.runBlock({
                
                self.FormeDemon = false
                self.SwitcherTextures()
                self.degat /= 2
                self.transforme()
                
            })]))
        }
       
        
    }
    
}

class sirenia: heroSprite { // sirenia ==============================================================================================
    
    
    init() {
        
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth, height: information.solwidth))
        action = String(NSUUID.init())
        self.useAutoResize = true
        self.t_devant = textures.sire_devant
        self.t_profil = textures.sire_profil
        self.t_derrier = textures.sire_derriere
        self.t_devantATK = textures.sire_devant_atk
        self.t_profilATK = textures.sire_profil_atk
        self.t_derrierATK = textures.sire_derriere_atk
        self.t_profilIMO  = textures.sire_profil_im
        self.t_derrierIMO = textures.sire_derriere_im
        self.t_devantIMO = textures.sire_devant_im
        self.heroType = hero.sirenia
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 900
        self.degat = 100
        self.initLabel()
        self.flying = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
    
        print(self.action)
        collectionHero[self.action] = nil
        print(collectionHero[self.action])
        
    }
}

class Harpie: heroSprite { // reine harpie ==============================================================================================
    
    
    init() {
        
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth*0.85, height: information.solwidth*0.85))
        action = String(NSUUID.init())
        self.useAutoResize = true
        self.t_devant = textures.harpie_devant
        self.t_profil = textures.harpie_profil
        self.t_derrier = textures.harpie_derriere
        self.t_devantATK = textures.harpie_devant_atk
        self.t_profilATK = textures.harpie_profil_atk
        self.t_derrierATK = textures.harpie_derriere_atk
        self.t_profilIMO  = textures.harpie_profil_im
        self.t_derrierIMO = textures.harpie_derriere_im
        self.t_devantIMO = textures.harpie_devant_im
        self.heroType = hero.harpie
        self.zPosition = 200
        self.devantIMMO()
        self.pv = 600
        self.degat = 175
        self.initLabel()
        self.flying = true 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}









