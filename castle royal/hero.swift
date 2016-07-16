//
//  hero.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright © 2016 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class heroSprite: SKSpriteNode {
    
    var pv: Int = 500 {
        didSet {
            if pv <= 0 {
                self.removeFromParent()
            }
        }
    }
    
    var degat: Int = 50
    
    var info: heroInfo! // set ou crash
    
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
        collectionIlot[self.key()]?.contient = ilotContient.heroAllier
    }
    private func reculerColonne() {
        self.info.colonne -= 1
        collectionIlot[self.key()]?.contient = ilotContient.heroAllier
    }
    private func avancerRanger() {
        self.info.ranger += 1
        collectionIlot[self.key()]?.contient = ilotContient.heroAllier
    }
    private func reculerRanger() {
        self.info.ranger -= 1
        collectionIlot[self.key()]?.contient = ilotContient.heroAllier
    }
    private func vider() {
        if collectionIlot[self.key()]?.contient != ilotContient.deploiementAllier {
        collectionIlot[self.key()]?.contient = ilotContient.vide
        collectionIlot[self.key()]?.hero = nil 
        }
    }
    private func remplir(key: CGFloat) {
        collectionIlot[key]?.contient = ilotContient.heroAllier
        collectionIlot[key]?.hero = self
    }
    
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
        } else if cible.building == nil && cible.hero == nil {
            fatalError("erreur ! une attaque se produirait sur un ilot vide ?")
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
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_demo_bim, timePerFrame: 0.1, resize: true, restore: false))
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
            let projectile = SKSpriteNode(texture: textures.anim_projectile_flamme[0])
            projectile.runAction(SKAction.animateWithTextures(textures.anim_projectile_flamme, timePerFrame: 0.1))
            projectile.position = self.position
            projectile.position.y += 20
            information.AnimationNode?.addChild(projectile)
            projectile.size = CGSize(width: 120, height: 120)
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
                    eclat.runAction(SKAction.animateWithTextures(textures.anim_moltanica_bim, timePerFrame: 0.05))
                    eclat.hidden = false
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
    
    
}

class mageSpirituel: heroSprite {
    
    
    let action: String
    var gauchiste: Bool = true
    init() {
        action = String(NSUUID.init())
        super.init(texture: textures.mage_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth/3, height: information.solwidth/3))
        self.zPosition = 200
        self.devant()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit { }
    
    
    func devant() {
        animer(textures.mage_devant)
    }
    func derriere() {
        animer(textures.mage_derriere)
    }
    func profil() {
        animer(textures.mage_profil)
    }
    func devantIMMO() {
        animer(textures.mage_devant_im)
    }
    func derriereIMMO() {
        animer(textures.mage_derriere_im)
    }
    func profilIMMO() {
        animer(textures.mage_profil_im)
    }
    func devantATK() {
        animer(textures.mage_devant_atk)
    }
    func derriereATK() {
        animer(textures.mage_derriere_atk)
    }
    func profilATK() {
        animer(textures.mage_profil_atk)
    }
    
    
    private func animer(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1), withKey: action)
    }
    private func animerNR(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1), withKey: action)
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
            } else if h.contient == ilotContient.batiment || h.contient == ilotContient.heroEnemie {
           self.attaque(mouvement.haut(h))
                attaque = true
                return
            }
        }
        if let b = collectionIlot[bas] {
            if b.contient == ilotContient.vide {
           mouvements.append(mouvement.bas(b))
            } else if b.contient == ilotContient.batiment || b.contient == ilotContient.heroEnemie {
           self.attaque(mouvement.bas(b))
                attaque = true
                return
            }
        }
        if let g = collectionIlot[gauche] {
            if g.contient == ilotContient.vide {
           mouvements.append(mouvement.gauche(g))
            } else if g.contient == ilotContient.batiment || g.contient == ilotContient.heroEnemie {
           self.attaque(mouvement.gauche(g))
                attaque = true
                return
            }
        }
        if let d = collectionIlot[droit] {
            if d.contient == ilotContient.vide {
           mouvements.append(mouvement.droit(d))
            } else if d.contient == ilotContient.batiment || d.contient == ilotContient.heroEnemie {
           self.attaque(mouvement.droit(d))
                attaque = true
                return
            }
        }
        
        if mouvements.count == 0 || attaque == true {
            return // break mother fuck us !
        }
        
        let jevaisoumaintenant = Int(arc4random_uniform(UInt32(mouvements.count)))
        self.vider()
        self.sedeplacer(mouvements[jevaisoumaintenant])
        
        
    }
    
    private func sedeplacer(movement: mouvement) {
        self.removeActionForKey(action)
        func deplacer(point: CGPoint, textures: [SKTexture]) {
            let pointReel = CGPoint(x: point.x, y: point.y + 75)
            self.runAction(SKAction.group([
                SKAction.animateWithTextures(textures, timePerFrame: 0.1),
                SKAction.moveTo(pointReel, duration: 1)
                ]))
            
        }
        
        switch movement {
        case .bas(let b):
            deplacer(b.ilotReferance.position, textures: textures.mage_devant)
            self.reculerColonne()
        case .droit(let d):
            deplacer(d.ilotReferance.position, textures: textures.mage_profil)
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.avancerRanger()
        case .gauche(let g):
            deplacer(g.ilotReferance.position, textures: textures.mage_profil)
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.reculerRanger()
        case .haut(let h):
            deplacer(h.ilotReferance.position, textures: textures.mage_derriere)
            self.avancerColonne()
        }
        
    }
    
    private func attaque(movement: mouvement) {
        
        information.son_hero_attaque()
        switch movement {
        case .bas(let b):
            self.devantATK()
            self.projectile(hero.mage, cible: b)
        case .droit(let d):
            self.profilATK()
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.projectile(hero.mage, cible: d)
        case .gauche(let g):
            self.profilATK()
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.projectile(hero.mage, cible: g)
        case .haut(let h):
            self.derriereATK()
            self.projectile(hero.mage, cible: h)
        }
        
    }
    
}


class demoniste: heroSprite { // demoniste
    
    
    let action: String
    var gauchiste: Bool = true
    init() {
        action = String(NSUUID.init())
        super.init(texture: textures.mage_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth/2, height: information.solwidth*0.65))
        self.zPosition = 200
        self.devantIMMO()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit { }
    
    
    func devant() {
        animer(textures.demo_devant)
    }
    func derriere() {
        animer(textures.demo_derriere)
    }
    func profil() {
        animer(textures.demo_profil)
    }
    func devantIMMO() {
        animer(textures.demo_devant_im)
    }
    func derriereIMMO() {
        animer(textures.demo_derriere_im)
    }
    func profilIMMO() {
        animer(textures.demo_profil_im)
    }
    func devantATK() {
        animer(textures.demo_devant_atk)
    }
    func derriereATK() {
        animer(textures.demo_derriere_atk)
    }
    func profilATK() {
        animer(textures.demo_profil_atk)
    }
    
    
    private func animer(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false), withKey: action)
    }
    private func animerNR(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1), withKey: action)
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
            } else if h.contient == ilotContient.batiment || h.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.haut(h))
                attaque = true
                return
            }
        }
        if let b = collectionIlot[bas] {
            if b.contient == ilotContient.vide {
                mouvements.append(mouvement.bas(b))
            } else if b.contient == ilotContient.batiment || b.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.bas(b))
                attaque = true
                return
            }
        }
        if let g = collectionIlot[gauche] {
            if g.contient == ilotContient.vide {
                mouvements.append(mouvement.gauche(g))
            } else if g.contient == ilotContient.batiment || g.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.gauche(g))
                attaque = true
                return
            }
        }
        if let d = collectionIlot[droit] {
            if d.contient == ilotContient.vide {
                mouvements.append(mouvement.droit(d))
            } else if d.contient == ilotContient.batiment || d.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.droit(d))
                attaque = true
                return
            }
        }
        
        if mouvements.count == 0 || attaque == true {
            return // break mother fuck us !
        }
        
        let jevaisoumaintenant = Int(arc4random_uniform(UInt32(mouvements.count)))
        self.vider()
        self.sedeplacer(mouvements[jevaisoumaintenant])
        
        
    }
    
    private func sedeplacer(movement: mouvement) {
        self.removeActionForKey(action)
        func deplacer(point: CGPoint, textures: [SKTexture]) {
            let pointReel = CGPoint(x: point.x, y: point.y + 75)
            self.runAction(SKAction.group([
                SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false),
                SKAction.moveTo(pointReel, duration: 1)
                ]))
            
        }
        
        switch movement {
        case .bas(let b):
            deplacer(b.ilotReferance.position, textures: textures.demo_devant)
            self.reculerColonne()
        case .droit(let d):
            deplacer(d.ilotReferance.position, textures: textures.demo_profil)
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.avancerRanger()
        case .gauche(let g):
            deplacer(g.ilotReferance.position, textures: textures.demo_profil)
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.reculerRanger()
        case .haut(let h):
            deplacer(h.ilotReferance.position, textures: textures.demo_derriere)
            self.avancerColonne()
        }
        
    }
    
    private func attaque(movement: mouvement) {
        information.son_hero_attaque()
        switch movement {
        case .bas(let b):
            self.devantATK()
            self.projectile(hero.demoniste, cible: b)
        case .droit(let d):
            self.profilATK()
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.projectile(hero.demoniste, cible: d)
        case .gauche(let g):
            self.profilATK()
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.projectile(hero.demoniste, cible: g)
        case .haut(let h):
            self.derriereATK()
            self.projectile(hero.demoniste, cible: h)
        }

        
    }
    
    
}

class moltanica: heroSprite { // moltanica
    
    
    let action: String
    var gauchiste: Bool = true
    init() {
        action = String(NSUUID.init())
        super.init(texture: textures.molta_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth*1.1, height: information.solwidth*0.8))
        self.zPosition = 200
        self.devant()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit { }
    
    
    func devant() {
        animer(textures.molta_devant)
    }
    func derriere() {
        animer(textures.molta_derriere)
    }
    func profil() {
        animer(textures.molta_profil)
    }
    func devantIMMO() {
        animer(textures.molta_devant_im)
    }
    func derriereIMMO() {
        animer(textures.molta_derriere_im)
    }
    func profilIMMO() {
        animer(textures.molta_profil_im)
    }
    func devantATK() {
        animer(textures.molta_devant_atk)
    }
    func derriereATK() {
        animer(textures.molta_derriere_atk)
    }
    func profilATK() {
        animer(textures.molta_profil_atk)
    }
    
    
    private func animer(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false), withKey: action)
    }
    private func animerNR(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1), withKey: action)
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
            } else if h.contient == ilotContient.batiment || h.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.haut(h))
                attaque = true
                return
            }
        }
        if let b = collectionIlot[bas] {
            if b.contient == ilotContient.vide {
                mouvements.append(mouvement.bas(b))
            } else if b.contient == ilotContient.batiment || b.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.bas(b))
                attaque = true
                return
            }
        }
        if let g = collectionIlot[gauche] {
            if g.contient == ilotContient.vide {
                mouvements.append(mouvement.gauche(g))
            } else if g.contient == ilotContient.batiment || g.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.gauche(g))
                attaque = true
                return
            }
        }
        if let d = collectionIlot[droit] {
            if d.contient == ilotContient.vide {
                mouvements.append(mouvement.droit(d))
            } else if d.contient == ilotContient.batiment || d.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.droit(d))
                attaque = true
                return
            }
        }
        
        if mouvements.count == 0 || attaque == true {
            return // break mother fuck us !
        }
        
        let jevaisoumaintenant = Int(arc4random_uniform(UInt32(mouvements.count)))
        self.vider()
        self.sedeplacer(mouvements[jevaisoumaintenant])
        
        
    }
    
    private func sedeplacer(movement: mouvement) {
        self.removeActionForKey(action)
        func deplacer(point: CGPoint, textures: [SKTexture]) {
            let pointReel = CGPoint(x: point.x, y: point.y + 75)
            self.runAction(SKAction.group([
                SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false),
                SKAction.moveTo(pointReel, duration: 1)
                ]))
            
        }
        
        switch movement {
        case .bas(let b):
            deplacer(b.ilotReferance.position, textures: textures.molta_devant)
            self.reculerColonne()
        case .droit(let d):
            deplacer(d.ilotReferance.position, textures: textures.molta_profil)
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.avancerRanger()
        case .gauche(let g):
            deplacer(g.ilotReferance.position, textures: textures.molta_profil)
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.reculerRanger()
        case .haut(let h):
            deplacer(h.ilotReferance.position, textures: textures.molta_derriere)
            self.avancerColonne()
        }
        
    }
    
    private func attaque(movement: mouvement) {
        
        information.son_hero_attaque()
        switch movement {
        case .bas(let b):
            self.devantATK()
            self.projectile(hero.moltanica, cible: b)
        case .droit(let d):
            self.profilATK()
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.projectile(hero.moltanica, cible: d)
        case .gauche(let g):
            self.profilATK()
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.projectile(hero.moltanica, cible: g)
        case .haut(let h):
            self.derriereATK()
            self.projectile(hero.moltanica, cible: h)
        }

        
    }
    
    
}


class vladDracula: heroSprite { // vlad dracula
    
    
    let action: String
    var gauchiste: Bool = true
    init() {
        action = String(NSUUID.init())
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth, height: information.solwidth*0.7))
        self.zPosition = 200
        self.devant()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit { }
    
    
    func devant() {
        animer(textures.vlad_devant)
    }
    func derriere() {
        animer(textures.vlad_derriere)
    }
    func profil() {
        animer(textures.vlad_profil)
    }
    func devantIMMO() {
        animer(textures.vlad_devant_im)
    }
    func derriereIMMO() {
        animer(textures.vlad_derriere_im)
    }
    func profilIMMO() {
        animer(textures.vlad_profil_im)
    }
    func devantATK() {
        animer(textures.vlad_devant_atk)
    }
    func derriereATK() {
        animer(textures.vlad_derriere_atk)
    }
    func profilATK() {
        animer(textures.vlad_profil_atk)
    }
    
    
    private func animer(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false), withKey: action)
    }
    private func animerNR(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.animateWithTextures(textures, timePerFrame: 0.1), withKey: action)
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
            } else if h.contient == ilotContient.batiment || h.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.haut(h))
                attaque = true
                return
            }
        }
        if let b = collectionIlot[bas] {
            if b.contient == ilotContient.vide {
                mouvements.append(mouvement.bas(b))
            } else if b.contient == ilotContient.batiment || b.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.bas(b))
                attaque = true
                return
            }
        }
        if let g = collectionIlot[gauche] {
            if g.contient == ilotContient.vide {
                mouvements.append(mouvement.gauche(g))
            } else if g.contient == ilotContient.batiment || g.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.gauche(g))
                attaque = true
                return
            }
        }
        if let d = collectionIlot[droit] {
            if d.contient == ilotContient.vide {
                mouvements.append(mouvement.droit(d))
            } else if d.contient == ilotContient.batiment || d.contient == ilotContient.heroEnemie {
                self.attaque(mouvement.droit(d))
                attaque = true
                return
            }
        }
        
        if mouvements.count == 0 || attaque == true {
            return // break mother fuck us !
        }
        
        let jevaisoumaintenant = Int(arc4random_uniform(UInt32(mouvements.count)))
        self.vider()
        self.sedeplacer(mouvements[jevaisoumaintenant])
        
        
    }
    
    private func sedeplacer(movement: mouvement) {
        self.removeActionForKey(action)
        func deplacer(point: CGPoint, textures: [SKTexture]) {
            let pointReel = CGPoint(x: point.x, y: point.y + 75)
            self.runAction(SKAction.group([
                SKAction.animateWithTextures(textures, timePerFrame: 0.1, resize: true, restore: false),
                SKAction.moveTo(pointReel, duration: 1)
                ]))
            
        }
        
        switch movement {
        case .bas(let b):
            deplacer(b.ilotReferance.position, textures: textures.vlad_devant)
            self.reculerColonne()
        case .droit(let d):
            deplacer(d.ilotReferance.position, textures: textures.vlad_profil)
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.avancerRanger()
        case .gauche(let g):
            deplacer(g.ilotReferance.position, textures: textures.vlad_profil)
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.reculerRanger()
        case .haut(let h):
            deplacer(h.ilotReferance.position, textures: textures.vlad_derriere)
            self.avancerColonne()
        }
        
    }
    
    private func attaque(movement: mouvement) {
        information.son_hero_attaque()
        switch movement {
        case .bas(let b):
            self.devantATK()
            self.projectile(hero.vlad, cible: b)
        case .droit(let d):
            self.profilATK()
            if self.gauchiste == true {
                self.xScale = self.xScale * -1
                gauchiste = false
            }
            self.projectile(hero.vlad, cible: d)
        case .gauche(let g):
            self.profilATK()
            if self.gauchiste == false {
                self.xScale = self.xScale * -1
                gauchiste = true
            }
            self.projectile(hero.vlad, cible: g)
        case .haut(let h):
            self.derriereATK()
            self.projectile(hero.vlad, cible: h)
        }
        
    }
    
    
}


















