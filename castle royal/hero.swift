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
    
    var pv: Int = 100 {
        didSet {
            if pv <= 0 {
                self.removeFromParent()
            }
        }
    }
    
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
        }
    }
    private func remplir(key: CGFloat) {
        collectionIlot[key]?.contient = ilotContient.heroAllier
    }
    
    
}

class mageSpirituel: heroSprite {
    
    
    let action: String
    var gauchiste: Bool = true
    init() {
        action = String(NSUUID.init())
        super.init(texture: textures.mage_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth/2, height: information.solwidth/2))
        self.zPosition = 200
        self.devant()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
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
        animerNR(textures.mage_devant_atk)
    }
    func derriereATK() {
        animerNR(textures.mage_derriere_atk)
    }
    func profilATK() {
        animerNR(textures.mage_profil_atk)
    }
    
    
    private func animer(textures: [SKTexture]) {
        self.removeActionForKey(action)
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 0.1)), withKey: action)
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
        
        print("tai tai !!")
        
    }
    
}
























