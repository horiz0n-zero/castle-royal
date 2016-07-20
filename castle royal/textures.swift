//
//  textures.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright © 2016 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct textures {
 
    static let zone = SKTexture(imageNamed: "zone")
    static let zone_deplacement = SKTexture(imageNamed: "zone_deploiment")
    static let zone_select = SKTexture(imageNamed: "zone_select")
    
    static let statue = SKTexture(imageNamed: "statue")
    
    static let pierre = SKTexture(imageNamed: "pierre")
    static let pierre_select = SKTexture(imageNamed: "pierre_select")
    
    static let carteMage = SKTexture(imageNamed: "item0391")
    static let carteDemoniste = SKTexture(imageNamed: "item0290")
    static let carteMoltanica = SKTexture(imageNamed: "item0225")
    static let carteDuc = SKTexture(imageNamed: "item0213")
    static let carteVlad = SKTexture(imageNamed: "item0266")
    static let carteRoiFantome = SKTexture(imageNamed: "item0396")
    static let carteGrimfield = SKTexture(imageNamed: "item0399")
    static let carteReineHarpie = SKTexture(imageNamed: "item0381")
    static let carteSirenia = SKTexture(imageNamed: "item0288")
    
    static let haloViolet = SKTexture(imageNamed: "haloViolet")
    static let haloVert = SKTexture(imageNamed: "haloVert")
    static let haloBleu = SKTexture(imageNamed: "haloBleu")
    
    static let haloVertBig = SKTexture(imageNamed: "haloV")
    static let haloBleuBig = SKTexture(imageNamed: "haloB")
    
    static let anim_demo_bim = [
    SKTexture(imageNamed: "demoBim1"),
    SKTexture(imageNamed: "demoBim2"),
    SKTexture(imageNamed: "demoBim3"),
    SKTexture(imageNamed: "demoBim4"),
    SKTexture(imageNamed: "demoBim5")
    ]
    
    static let anim_projectile_flamme = [
    SKTexture(imageNamed: "flammeProjectile1"),
    SKTexture(imageNamed: "flammeProjectile2"),
    SKTexture(imageNamed: "flammeProjectile3"),
    SKTexture(imageNamed: "flammeProjectile4"),
    SKTexture(imageNamed: "flammeProjectile5"),
    SKTexture(imageNamed: "flammeProjectile6"),
    SKTexture(imageNamed: "flammeProjectile7"),
    SKTexture(imageNamed: "flammeProjectile8"),
    ]
    
    static let anim_projectile_mage = SKTexture(imageNamed: "mage_projectile")
    
    static let anim_mage_bim = [
    SKTexture(imageNamed: "mageBim1"),
    SKTexture(imageNamed: "mageBim2"),
    SKTexture(imageNamed: "mageBim3"),
    SKTexture(imageNamed: "mageBim4"),
    SKTexture(imageNamed: "mageBim5"),
    SKTexture(imageNamed: "mageBim6"),
    SKTexture(imageNamed: "mageBim7"),
    SKTexture(imageNamed: "mageBim8")
    ]
    
    static let anim_moltanica_bim = [
    SKTexture(imageNamed: "moltaBim1"),
    SKTexture(imageNamed: "moltaBim2"),
    SKTexture(imageNamed: "moltaBim3"),
    SKTexture(imageNamed: "moltaBim4"),
    SKTexture(imageNamed: "moltaBim5"),
    SKTexture(imageNamed: "moltaBim6")
    ]
    
    static let moltaDesactive = [
        SKTexture(imageNamed: "moltaD1"),
        SKTexture(imageNamed: "moltaD2"),
        SKTexture(imageNamed: "moltaD3"),
        SKTexture(imageNamed: "moltaD4"),
        SKTexture(imageNamed: "moltaD5"),
        SKTexture(imageNamed: "moltaD6"),
        SKTexture(imageNamed: "moltaD7"),
        SKTexture(imageNamed: "moltaD8"),
        SKTexture(imageNamed: "moltaD9"),
        SKTexture(imageNamed: "moltaD10"),
        SKTexture(imageNamed: "moltaD11"),
        SKTexture(imageNamed: "moltaD12"),
        SKTexture(imageNamed: "moltaD13")
    ]
    
    static let anim_vladBim = [
    SKTexture(imageNamed: "vladBim1"),
    SKTexture(imageNamed: "vladBim2"),
    SKTexture(imageNamed: "vladBim3"),
    SKTexture(imageNamed: "vladBim4"),
    SKTexture(imageNamed: "vladBim5"),
    SKTexture(imageNamed: "vladBim6")
    ]
    static let anim_vlad_projectile = SKTexture(imageNamed: "vladEclat")
    
    static let eclatBleu = [
    SKTexture(imageNamed: "cristalBBim1"),
    SKTexture(imageNamed: "cristalBBim2"),
    SKTexture(imageNamed: "cristalBBim3"),
    SKTexture(imageNamed: "cristalBBim4"),
    SKTexture(imageNamed: "cristalBBim5")
    ]
    
    static let anim_eclat_sirenia = [
    SKTexture(imageNamed: "anim_eclatB1"),
    SKTexture(imageNamed: "anim_eclatB2"),
    SKTexture(imageNamed: "anim_eclatB3"),
    SKTexture(imageNamed: "anim_eclatB4"),
    SKTexture(imageNamed: "anim_eclatB5")
    ]

    static let anim_eclat_grim = [
        SKTexture(imageNamed: "anim_grimE1"),
        SKTexture(imageNamed: "anim_grimE2"),
        SKTexture(imageNamed: "anim_grimE3"),
        SKTexture(imageNamed: "anim_grimE4"),
        SKTexture(imageNamed: "anim_grimE5"),
        SKTexture(imageNamed: "anim_grimE6"),
        SKTexture(imageNamed: "anim_grimE7"),
        SKTexture(imageNamed: "anim_grimE8")
    ]
    
    static let anim_eclat_grimDeux = [
        SKTexture(imageNamed: "anim_proj_grim21"),
        SKTexture(imageNamed: "anim_proj_grim22"),
        SKTexture(imageNamed: "anim_proj_grim23"),
        SKTexture(imageNamed: "anim_proj_grim24"),
        SKTexture(imageNamed: "anim_proj_grim25"),
        SKTexture(imageNamed: "anim_proj_grim26"),
        SKTexture(imageNamed: "anim_proj_grim27"),
        SKTexture(imageNamed: "anim_proj_grim28")
    ]
    
    static let trans = [
    SKTexture(imageNamed: "transformation1"),
    SKTexture(imageNamed: "transformation2"),
    SKTexture(imageNamed: "transformation3"),
    SKTexture(imageNamed: "transformation4"),
    SKTexture(imageNamed: "transformation5"),
    SKTexture(imageNamed: "transformation6"),
    SKTexture(imageNamed: "transformation7"),
    SKTexture(imageNamed: "transformation8"),
    SKTexture(imageNamed: "transformation9"),
    SKTexture(imageNamed: "transformation10")
    ]
    
    static let anim_projectile_grim = [
    SKTexture(imageNamed: "anim_proj_grim1"),
    SKTexture(imageNamed: "anim_proj_grim2")
    ]
    
    static let plume = SKTexture(imageNamed: "plume")
    static let flechette = SKTexture(imageNamed: "flechette")
    static let capaciter = SKTexture(imageNamed: "cap")
    // mage
    static let mage_devant = [
        SKTexture(imageNamed: "100"),
        SKTexture(imageNamed: "101"),
        SKTexture(imageNamed: "102"),
        SKTexture(imageNamed: "103"),
        SKTexture(imageNamed: "104"),
        SKTexture(imageNamed: "105")
    ]
    static let mage_semi_devant = [
        SKTexture(imageNamed: "110"),
        SKTexture(imageNamed: "111"),
        SKTexture(imageNamed: "112"),
        SKTexture(imageNamed: "113"),
        SKTexture(imageNamed: "114"),
        SKTexture(imageNamed: "115")
    ]
    static let mage_profil = [
        SKTexture(imageNamed: "120"),
        SKTexture(imageNamed: "121"),
        SKTexture(imageNamed: "122"),
        SKTexture(imageNamed: "123"),
        SKTexture(imageNamed: "124"),
        SKTexture(imageNamed: "125")
    ]
    static let mage_semi_derriere = [
        SKTexture(imageNamed: "130"),
        SKTexture(imageNamed: "131"),
        SKTexture(imageNamed: "132"),
        SKTexture(imageNamed: "133"),
        SKTexture(imageNamed: "134"),
        SKTexture(imageNamed: "135")
    ]
    static let mage_derriere = [
        SKTexture(imageNamed: "140"),
        SKTexture(imageNamed: "141"),
        SKTexture(imageNamed: "142"),
        SKTexture(imageNamed: "143"),
        SKTexture(imageNamed: "144"),
        SKTexture(imageNamed: "145")
    ]
    // immobile
    static let mage_devant_im = [
        SKTexture(imageNamed: "200"),
        SKTexture(imageNamed: "201"),
        SKTexture(imageNamed: "202"),
        SKTexture(imageNamed: "203"),
        SKTexture(imageNamed: "204"),
        SKTexture(imageNamed: "205")
    ]
    static let mage_semi_devant_im = [
        SKTexture(imageNamed: "210"),
        SKTexture(imageNamed: "211"),
        SKTexture(imageNamed: "212"),
        SKTexture(imageNamed: "213"),
        SKTexture(imageNamed: "214"),
        SKTexture(imageNamed: "215")
    ]
    static let mage_profil_im = [
        SKTexture(imageNamed: "220"),
        SKTexture(imageNamed: "221"),
        SKTexture(imageNamed: "222"),
        SKTexture(imageNamed: "223"),
        SKTexture(imageNamed: "224"),
        SKTexture(imageNamed: "225")
    ]
    static let mage_semi_derriere_im = [
        SKTexture(imageNamed: "230"),
        SKTexture(imageNamed: "231"),
        SKTexture(imageNamed: "232"),
        SKTexture(imageNamed: "233"),
        SKTexture(imageNamed: "234"),
        SKTexture(imageNamed: "235")
    ]
    static let mage_derriere_im = [
        SKTexture(imageNamed: "240"),
        SKTexture(imageNamed: "241"),
        SKTexture(imageNamed: "242"),
        SKTexture(imageNamed: "243"),
        SKTexture(imageNamed: "244"),
        SKTexture(imageNamed: "245")
    ]
    // attaque :
    static let mage_devant_atk = [
        SKTexture(imageNamed: "300"),
        SKTexture(imageNamed: "301"),
        SKTexture(imageNamed: "302"),
        SKTexture(imageNamed: "303"),
        SKTexture(imageNamed: "304"),
        SKTexture(imageNamed: "305"),
        SKTexture(imageNamed: "306"),
        SKTexture(imageNamed: "307")
    ]
    static let mage_semi_devant_atk = [
        SKTexture(imageNamed: "310"),
        SKTexture(imageNamed: "311"),
        SKTexture(imageNamed: "312"),
        SKTexture(imageNamed: "313"),
        SKTexture(imageNamed: "314"),
        SKTexture(imageNamed: "315"),
        SKTexture(imageNamed: "316"),
        SKTexture(imageNamed: "317")
    ]
    static let mage_profil_atk = [
        SKTexture(imageNamed: "320"),
        SKTexture(imageNamed: "321"),
        SKTexture(imageNamed: "322"),
        SKTexture(imageNamed: "323"),
        SKTexture(imageNamed: "324"),
        SKTexture(imageNamed: "325"),
        SKTexture(imageNamed: "326"),
        SKTexture(imageNamed: "327")
    ]
    static let mage_semi_derriere_atk = [
        SKTexture(imageNamed: "330"),
        SKTexture(imageNamed: "331"),
        SKTexture(imageNamed: "332"),
        SKTexture(imageNamed: "333"),
        SKTexture(imageNamed: "334"),
        SKTexture(imageNamed: "335"),
        SKTexture(imageNamed: "336"),
        SKTexture(imageNamed: "337")
        
    ]
    static let mage_derriere_atk = [
        SKTexture(imageNamed: "340"),
        SKTexture(imageNamed: "341"),
        SKTexture(imageNamed: "342"),
        SKTexture(imageNamed: "343"),
        SKTexture(imageNamed: "344"),
        SKTexture(imageNamed: "345"),
        SKTexture(imageNamed: "346"),
        SKTexture(imageNamed: "347")
    ]
    //  demoniste
    
    static let demo_devant_im = [
        SKTexture(imageNamed: "d1"),
        SKTexture(imageNamed: "d2"),
        SKTexture(imageNamed: "d3"),
        SKTexture(imageNamed: "d4"),
        SKTexture(imageNamed: "d5"),
        SKTexture(imageNamed: "d6"),
        SKTexture(imageNamed: "d7"),
        SKTexture(imageNamed: "d8")
    ]
    static let demo_semi_devant_im = [
        SKTexture(imageNamed: "d9"),
        SKTexture(imageNamed: "d10"),
        SKTexture(imageNamed: "d11"),
        SKTexture(imageNamed: "d12"),
        SKTexture(imageNamed: "d13"),
        SKTexture(imageNamed: "d14"),
        SKTexture(imageNamed: "d15"),
        SKTexture(imageNamed: "d16")
    ]
    static let demo_profil_im = [
        SKTexture(imageNamed: "d17"),
        SKTexture(imageNamed: "d18"),
        SKTexture(imageNamed: "d19"),
        SKTexture(imageNamed: "d20"),
        SKTexture(imageNamed: "d21"),
        SKTexture(imageNamed: "d22"),
        SKTexture(imageNamed: "d23"),
        SKTexture(imageNamed: "d24")
    ]
    static let demo_semi_derriere_im = [
        SKTexture(imageNamed: "d25"),
        SKTexture(imageNamed: "d26"),
        SKTexture(imageNamed: "d27"),
        SKTexture(imageNamed: "d28"),
        SKTexture(imageNamed: "d29"),
        SKTexture(imageNamed: "d30"),
        SKTexture(imageNamed: "d31"),
        SKTexture(imageNamed: "d32")
        
    ]
    static let demo_derriere_im = [
        SKTexture(imageNamed: "d33"),
        SKTexture(imageNamed: "d34"),
        SKTexture(imageNamed: "d35"),
        SKTexture(imageNamed: "d36"),
        SKTexture(imageNamed: "d37"),
        SKTexture(imageNamed: "d38"),
        SKTexture(imageNamed: "d39"),
        SKTexture(imageNamed: "d40")
        
    ]
    // immobile
    static let demo_devant = [
        SKTexture(imageNamed: "d41"),
        SKTexture(imageNamed: "d42"),
        SKTexture(imageNamed: "d43"),
        SKTexture(imageNamed: "d44"),
        SKTexture(imageNamed: "d45"),
        SKTexture(imageNamed: "d46"),
        SKTexture(imageNamed: "d47"),
        SKTexture(imageNamed: "d48")
        
    ]
    static let demo_semi_devant = [
        SKTexture(imageNamed: "d49"),
        SKTexture(imageNamed: "d50"),
        SKTexture(imageNamed: "d51"),
        SKTexture(imageNamed: "d52"),
        SKTexture(imageNamed: "d53"),
        SKTexture(imageNamed: "d54"),
        SKTexture(imageNamed: "d55"),
        SKTexture(imageNamed: "d56")
        
    ]
    static let demo_profil = [
        SKTexture(imageNamed: "d57"),
        SKTexture(imageNamed: "d58"),
        SKTexture(imageNamed: "d59"),
        SKTexture(imageNamed: "d60"),
        SKTexture(imageNamed: "d61"),
        SKTexture(imageNamed: "d62"),
        SKTexture(imageNamed: "d63"),
        SKTexture(imageNamed: "d64")
        
    ]
    static let demo_semi_derriere = [
        SKTexture(imageNamed: "d65"),
        SKTexture(imageNamed: "d66"),
        SKTexture(imageNamed: "d67"),
        SKTexture(imageNamed: "d68"),
        SKTexture(imageNamed: "d69"),
        SKTexture(imageNamed: "d70"),
        SKTexture(imageNamed: "d71"),
        SKTexture(imageNamed: "d72")
        
    ]
    static let demo_derriere = [
        SKTexture(imageNamed: "d73"),
        SKTexture(imageNamed: "d74"),
        SKTexture(imageNamed: "d75"),
        SKTexture(imageNamed: "d76"),
        SKTexture(imageNamed: "d77"),
        SKTexture(imageNamed: "d78"),
        SKTexture(imageNamed: "d79"),
        SKTexture(imageNamed: "d80")
        
    ]
    // attaque :
    static let demo_devant_atk = [
        SKTexture(imageNamed: "d81"),
        SKTexture(imageNamed: "d82"),
        SKTexture(imageNamed: "d83"),
        SKTexture(imageNamed: "d84"),
        ]
    static let demo_semi_devant_atk = [
        SKTexture(imageNamed: "d85"),
        SKTexture(imageNamed: "d86"),
        SKTexture(imageNamed: "d87"),
        SKTexture(imageNamed: "d88"),
        SKTexture(imageNamed: "d89"),
        SKTexture(imageNamed: "d90"),
        SKTexture(imageNamed: "d91"),
        SKTexture(imageNamed: "d92")
    ]
    static let demo_profil_atk = [
        SKTexture(imageNamed: "d93"),
        SKTexture(imageNamed: "d94"),
        SKTexture(imageNamed: "d95"),
        SKTexture(imageNamed: "d96"),
        SKTexture(imageNamed: "d97"),
        SKTexture(imageNamed: "d98"),
        SKTexture(imageNamed: "d99"),
        SKTexture(imageNamed: "d100")
    ]
    static let demo_semi_derriere_atk = [
        SKTexture(imageNamed: "330"),
        SKTexture(imageNamed: "331"),
        SKTexture(imageNamed: "332"),
        SKTexture(imageNamed: "333"),
        SKTexture(imageNamed: "334"),
        SKTexture(imageNamed: "335"),
        SKTexture(imageNamed: "336"),
        SKTexture(imageNamed: "337")
        
    ]
    static let demo_derriere_atk = [
        SKTexture(imageNamed: "d109"),
        SKTexture(imageNamed: "d110"),
        SKTexture(imageNamed: "d111"),
        SKTexture(imageNamed: "d112"),
        SKTexture(imageNamed: "d113"),
        SKTexture(imageNamed: "d114"),
        SKTexture(imageNamed: "d115"),
        SKTexture(imageNamed: "d116"),
        SKTexture(imageNamed: "d117"),
        SKTexture(imageNamed: "d118"),
        SKTexture(imageNamed: "d119"),
        SKTexture(imageNamed: "d120"),
        ]
    
    
    //  moltanica :
    
    static let molta_devant_im = [
        SKTexture(imageNamed: "m1"),
        SKTexture(imageNamed: "m2"),
        SKTexture(imageNamed: "m3"),
        SKTexture(imageNamed: "m4"),
        SKTexture(imageNamed: "m5"),
        SKTexture(imageNamed: "m6"),
        SKTexture(imageNamed: "m7"),
        SKTexture(imageNamed: "m8")
    ]
    static let molta_semi_devant_im = [
        SKTexture(imageNamed: "m9"),
        SKTexture(imageNamed: "m10"),
        SKTexture(imageNamed: "m11"),
        SKTexture(imageNamed: "m12"),
        SKTexture(imageNamed: "m13"),
        SKTexture(imageNamed: "m14"),
        SKTexture(imageNamed: "m15"),
        SKTexture(imageNamed: "m16")
    ]
    static let molta_profil_im = [
        SKTexture(imageNamed: "m17"),
        SKTexture(imageNamed: "m18"),
        SKTexture(imageNamed: "m19"),
        SKTexture(imageNamed: "m20"),
        SKTexture(imageNamed: "m21"),
        SKTexture(imageNamed: "m22"),
        SKTexture(imageNamed: "m23"),
        SKTexture(imageNamed: "m24")
    ]
    static let molta_semi_derriere_im = [
        SKTexture(imageNamed: "m25"),
        SKTexture(imageNamed: "m26"),
        SKTexture(imageNamed: "m27"),
        SKTexture(imageNamed: "m28"),
        SKTexture(imageNamed: "m29"),
        SKTexture(imageNamed: "m30"),
        SKTexture(imageNamed: "m31"),
        SKTexture(imageNamed: "m32")
        
    ]
    static let molta_derriere_im = [
        SKTexture(imageNamed: "m33"),
        SKTexture(imageNamed: "m34"),
        SKTexture(imageNamed: "m35"),
        SKTexture(imageNamed: "m36"),
        SKTexture(imageNamed: "m37"),
        SKTexture(imageNamed: "m38"),
        SKTexture(imageNamed: "m39"),
        SKTexture(imageNamed: "m40")
        
    ]
    // immobile
    static let molta_devant = [
        SKTexture(imageNamed: "m41"),
        SKTexture(imageNamed: "m42"),
        SKTexture(imageNamed: "m43"),
        SKTexture(imageNamed: "m44"),
        SKTexture(imageNamed: "m45"),
        SKTexture(imageNamed: "m46"),
        SKTexture(imageNamed: "m47"),
        SKTexture(imageNamed: "m48")
        
    ]
    
    static let molta_profil = [
        SKTexture(imageNamed: "m57"),
        SKTexture(imageNamed: "m58"),
        SKTexture(imageNamed: "m59"),
        SKTexture(imageNamed: "m60"),
        SKTexture(imageNamed: "m61"),
        SKTexture(imageNamed: "m62"),
        SKTexture(imageNamed: "m63"),
        SKTexture(imageNamed: "m64"),
        
    ]
    static let molta_derriere = [
        SKTexture(imageNamed: "m73"),
        SKTexture(imageNamed: "m74"),
        SKTexture(imageNamed: "m75"),
        SKTexture(imageNamed: "m76"),
        SKTexture(imageNamed: "m77"),
        SKTexture(imageNamed: "m78"),
        SKTexture(imageNamed: "m79"),
        SKTexture(imageNamed: "m80")
        
    ]
    // attaque :
    static let molta_devant_atk = [
        SKTexture(imageNamed: "m81"),
        SKTexture(imageNamed: "m82"),
        SKTexture(imageNamed: "m83"),
        SKTexture(imageNamed: "m84"),
        SKTexture(imageNamed: "m85"),
        SKTexture(imageNamed: "m86"),
        SKTexture(imageNamed: "m87"),
        SKTexture(imageNamed: "m88"),
        SKTexture(imageNamed: "m87"),
        SKTexture(imageNamed: "m86")
        ]
    static let molta_profil_atk = [
        SKTexture(imageNamed: "m97"),
        SKTexture(imageNamed: "m98"),
        SKTexture(imageNamed: "m99"),
        SKTexture(imageNamed: "m100"),
        SKTexture(imageNamed: "m101"),
        SKTexture(imageNamed: "m102"),
        SKTexture(imageNamed: "m103"),
        SKTexture(imageNamed: "m104"),
        SKTexture(imageNamed: "m103"),
        SKTexture(imageNamed: "m102")
    ]
    static let molta_derriere_atk = [
        SKTexture(imageNamed: "m113"),
        SKTexture(imageNamed: "m114"),
        SKTexture(imageNamed: "m115"),
        SKTexture(imageNamed: "m116"),
        SKTexture(imageNamed: "m117"),
        SKTexture(imageNamed: "m118"),
        SKTexture(imageNamed: "m119"),
        SKTexture(imageNamed: "m120"),
        ]
    
    
    // vlad
    //  dracula :
    
    static let vlad_devant_im = [
        SKTexture(imageNamed: "v1"),
        SKTexture(imageNamed: "v2"),
        SKTexture(imageNamed: "v3"),
        SKTexture(imageNamed: "v4"),
        SKTexture(imageNamed: "v5"),
        SKTexture(imageNamed: "v6"),
        SKTexture(imageNamed: "v7"),
        SKTexture(imageNamed: "v8")
    ]
    
    static let vlad_profil_im = [
        SKTexture(imageNamed: "v17"),
        SKTexture(imageNamed: "v18"),
        SKTexture(imageNamed: "v19"),
        SKTexture(imageNamed: "v20"),
        SKTexture(imageNamed: "v21"),
        SKTexture(imageNamed: "v22"),
        SKTexture(imageNamed: "v23"),
        SKTexture(imageNamed: "v24")
    ]
    static let vlad_derriere_im = [
        SKTexture(imageNamed: "v33"),
        SKTexture(imageNamed: "v34"),
        SKTexture(imageNamed: "v35"),
        SKTexture(imageNamed: "v36"),
        SKTexture(imageNamed: "v37"),
        SKTexture(imageNamed: "v38"),
        SKTexture(imageNamed: "v39"),
        SKTexture(imageNamed: "v40")
        
    ]
    // immobile
    static let vlad_devant = [
        SKTexture(imageNamed: "v41"),
        SKTexture(imageNamed: "v42"),
        SKTexture(imageNamed: "v43"),
        SKTexture(imageNamed: "v44"),
        SKTexture(imageNamed: "v45"),
        SKTexture(imageNamed: "v46"),
        SKTexture(imageNamed: "v47"),
        SKTexture(imageNamed: "v48")
        
    ]
    static let vlad_profil = [
        SKTexture(imageNamed: "v57"),
        SKTexture(imageNamed: "v58"),
        SKTexture(imageNamed: "v59"),
        SKTexture(imageNamed: "v60"),
        SKTexture(imageNamed: "v61"),
        SKTexture(imageNamed: "v62"),
        SKTexture(imageNamed: "v63"),
        SKTexture(imageNamed: "v64")
        
    ]
    static let vlad_derriere = [
        SKTexture(imageNamed: "v73"),
        SKTexture(imageNamed: "v74"),
        SKTexture(imageNamed: "v75"),
        SKTexture(imageNamed: "v76"),
        SKTexture(imageNamed: "v77"),
        SKTexture(imageNamed: "v78"),
        SKTexture(imageNamed: "v79"),
        SKTexture(imageNamed: "v80")
        
    ]
    // attaque :
    static let vlad_devant_atk = [
        SKTexture(imageNamed: "v81"),
        SKTexture(imageNamed: "v82"),
        SKTexture(imageNamed: "v83"),
        SKTexture(imageNamed: "v84"),
        SKTexture(imageNamed: "v85"),
        SKTexture(imageNamed: "v86"),
        SKTexture(imageNamed: "v87"),
        SKTexture(imageNamed: "v88")
    ]
    static let vlad_profil_atk = [
        SKTexture(imageNamed: "v97"),
        SKTexture(imageNamed: "v98"),
        SKTexture(imageNamed: "v99"),
        SKTexture(imageNamed: "v100"),
        SKTexture(imageNamed: "v101"),
        SKTexture(imageNamed: "v102"),
        SKTexture(imageNamed: "v103"),
        SKTexture(imageNamed: "v102"),
        SKTexture(imageNamed: "v101"),
        SKTexture(imageNamed: "v100")
    ]
    static let vlad_derriere_atk = [
        SKTexture(imageNamed: "v113"),
        SKTexture(imageNamed: "v114"),
        SKTexture(imageNamed: "v115"),
        SKTexture(imageNamed: "v116"),
        SKTexture(imageNamed: "v117"),
        SKTexture(imageNamed: "v118"),
        SKTexture(imageNamed: "v119"),
        SKTexture(imageNamed: "v120"),
    ]
    
    // roi des fantomes 
    //
    
    static let roi_devant_im = [
        SKTexture(imageNamed: "f1"),
        SKTexture(imageNamed: "f2"),
        SKTexture(imageNamed: "f3"),
        SKTexture(imageNamed: "f4"),
        SKTexture(imageNamed: "f5"),
        SKTexture(imageNamed: "f6"),
        SKTexture(imageNamed: "f7"),
        SKTexture(imageNamed: "f8")
    ]
    
    static let roi_profil_im = [
        SKTexture(imageNamed: "f9"),
        SKTexture(imageNamed: "f10"),
        SKTexture(imageNamed: "f11"),
        SKTexture(imageNamed: "f12"),
        SKTexture(imageNamed: "f13"),
        SKTexture(imageNamed: "f14"),
        SKTexture(imageNamed: "f15"),
        SKTexture(imageNamed: "f16")
    ]
    static let roi_derriere_im = [
        SKTexture(imageNamed: "f17"),
        SKTexture(imageNamed: "f18"),
        SKTexture(imageNamed: "f19"),
        SKTexture(imageNamed: "f20"),
        SKTexture(imageNamed: "f21"),
        SKTexture(imageNamed: "f22"),
        SKTexture(imageNamed: "f23"),
        SKTexture(imageNamed: "f24")
        
    ]
    // immobile
    static let roi_devant = [
        SKTexture(imageNamed: "f25"),
        SKTexture(imageNamed: "f26"),
        SKTexture(imageNamed: "f27"),
        SKTexture(imageNamed: "f28"),
        SKTexture(imageNamed: "f29"),
        SKTexture(imageNamed: "f30"),
        SKTexture(imageNamed: "f31"),
        SKTexture(imageNamed: "f32")
        
    ]
    static let roi_profil = [
        SKTexture(imageNamed: "f33"),
        SKTexture(imageNamed: "f34"),
        SKTexture(imageNamed: "f35"),
        SKTexture(imageNamed: "f36"),
        SKTexture(imageNamed: "f37"),
        SKTexture(imageNamed: "f38"),
        SKTexture(imageNamed: "f39"),
        SKTexture(imageNamed: "f40")
        
    ]
    static let roi_derriere = [
        SKTexture(imageNamed: "f41"),
        SKTexture(imageNamed: "f42"),
        SKTexture(imageNamed: "f43"),
        SKTexture(imageNamed: "f44"),
        SKTexture(imageNamed: "f45"),
        SKTexture(imageNamed: "f46"),
        SKTexture(imageNamed: "f47"),
        SKTexture(imageNamed: "f48")
        
    ]
    // attaque :
    static let roi_devant_atk = [
        SKTexture(imageNamed: "f49"),
        SKTexture(imageNamed: "f50"),
        SKTexture(imageNamed: "f51"),
        SKTexture(imageNamed: "f52"),
        SKTexture(imageNamed: "f53"),
        SKTexture(imageNamed: "f54"),
        SKTexture(imageNamed: "f55"),
    ]
    static let roi_profil_atk = [
        SKTexture(imageNamed: "f56"),
        SKTexture(imageNamed: "f57"),
        SKTexture(imageNamed: "f58"),
        SKTexture(imageNamed: "f59"),
        SKTexture(imageNamed: "f60"),
        SKTexture(imageNamed: "f61"),
        SKTexture(imageNamed: "f62")
    ]
    static let roi_derriere_atk = [
        SKTexture(imageNamed: "f63"),
        SKTexture(imageNamed: "f64"),
        SKTexture(imageNamed: "f65"),
        SKTexture(imageNamed: "f66"),
        SKTexture(imageNamed: "f67"),
        SKTexture(imageNamed: "f68"),
        SKTexture(imageNamed: "f69"),
        ]
    

    // grimfield
    
    static let grim_devant_im = [
        SKTexture(imageNamed: "g1"),
        SKTexture(imageNamed: "g2"),
        SKTexture(imageNamed: "g3"),
        SKTexture(imageNamed: "g4"),
        SKTexture(imageNamed: "g5"),
        SKTexture(imageNamed: "g6"),
        SKTexture(imageNamed: "g7"),
        SKTexture(imageNamed: "g8")
    ]
    
    static let grim_profil_im = [
        SKTexture(imageNamed: "g9"),
        SKTexture(imageNamed: "g10"),
        SKTexture(imageNamed: "g11"),
        SKTexture(imageNamed: "g12"),
        SKTexture(imageNamed: "g13"),
        SKTexture(imageNamed: "g14"),
        SKTexture(imageNamed: "g15"),
        SKTexture(imageNamed: "g16")
    ]
    static let grim_derriere_im = [
        SKTexture(imageNamed: "g17"),
        SKTexture(imageNamed: "g18"),
        SKTexture(imageNamed: "g19"),
        SKTexture(imageNamed: "g20"),
        SKTexture(imageNamed: "g21"),
        SKTexture(imageNamed: "g22"),
        SKTexture(imageNamed: "g23"),
        SKTexture(imageNamed: "g24")
        
    ]
    // immobile
    static let grim_devant = [
        SKTexture(imageNamed: "g25"),
        SKTexture(imageNamed: "g26"),
        SKTexture(imageNamed: "g27"),
        SKTexture(imageNamed: "g28"),
        SKTexture(imageNamed: "g29"),
        SKTexture(imageNamed: "g30"),
        SKTexture(imageNamed: "g31"),
        SKTexture(imageNamed: "g32")
        
    ]
    static let grim_profil = [
        SKTexture(imageNamed: "g33"),
        SKTexture(imageNamed: "g34"),
        SKTexture(imageNamed: "g35"),
        SKTexture(imageNamed: "g36"),
        SKTexture(imageNamed: "g37"),
        SKTexture(imageNamed: "g38"),
        SKTexture(imageNamed: "g39"),
        SKTexture(imageNamed: "g40")
        
    ]
    static let grim_derriere = [
        SKTexture(imageNamed: "g41"),
        SKTexture(imageNamed: "g42"),
        SKTexture(imageNamed: "g43"),
        SKTexture(imageNamed: "g44"),
        SKTexture(imageNamed: "g45"),
        SKTexture(imageNamed: "g46"),
        SKTexture(imageNamed: "g47"),
        SKTexture(imageNamed: "g48")
        
    ]
    // attaque :
    static let grim_devant_atk = [
        SKTexture(imageNamed: "g49"),
        SKTexture(imageNamed: "g50"),
        SKTexture(imageNamed: "g51"),
        SKTexture(imageNamed: "g52"),
        SKTexture(imageNamed: "g53"),
        SKTexture(imageNamed: "g54"),
        SKTexture(imageNamed: "g55"),
        ]
    static let grim_profil_atk = [
        SKTexture(imageNamed: "g56"),
        SKTexture(imageNamed: "g57"),
        SKTexture(imageNamed: "g58"),
        SKTexture(imageNamed: "g59"),
        SKTexture(imageNamed: "g60"),
        SKTexture(imageNamed: "g61"),
        SKTexture(imageNamed: "g62")
    ]
    static let grim_derriere_atk = [
        SKTexture(imageNamed: "g63"),
        SKTexture(imageNamed: "g64"),
        SKTexture(imageNamed: "g65"),
        SKTexture(imageNamed: "g66"),
        SKTexture(imageNamed: "g67"),
        SKTexture(imageNamed: "g68"),
        SKTexture(imageNamed: "g69"),
        ]
    
    
    // reine harpie ================
    
    static let harpie_devant_im = [
        SKTexture(imageNamed: "h1"),
        SKTexture(imageNamed: "h2"),
        SKTexture(imageNamed: "h3"),
        SKTexture(imageNamed: "h4"),
        SKTexture(imageNamed: "h5"),
        SKTexture(imageNamed: "h6"),
        SKTexture(imageNamed: "h7"),
        SKTexture(imageNamed: "h8")
    ]
    
    static let harpie_profil_im = [
        SKTexture(imageNamed: "h9"),
        SKTexture(imageNamed: "h10"),
        SKTexture(imageNamed: "h11"),
        SKTexture(imageNamed: "h12"),
        SKTexture(imageNamed: "h13"),
        SKTexture(imageNamed: "h14"),
        SKTexture(imageNamed: "h15"),
        SKTexture(imageNamed: "h16")
    ]
    static let harpie_derriere_im = [
        SKTexture(imageNamed: "h17"),
        SKTexture(imageNamed: "h18"),
        SKTexture(imageNamed: "h19"),
        SKTexture(imageNamed: "h20"),
        SKTexture(imageNamed: "h21"),
        SKTexture(imageNamed: "h22"),
        SKTexture(imageNamed: "h23"),
        SKTexture(imageNamed: "h24")
        
    ]
    // immobile
    static let harpie_devant = [
        SKTexture(imageNamed: "h25"),
        SKTexture(imageNamed: "h26"),
        SKTexture(imageNamed: "h27"),
        SKTexture(imageNamed: "h28"),
        SKTexture(imageNamed: "h29"),
        SKTexture(imageNamed: "h30"),
        SKTexture(imageNamed: "h31"),
        SKTexture(imageNamed: "h32")
        
    ]
    static let harpie_profil = [
        SKTexture(imageNamed: "h33"),
        SKTexture(imageNamed: "h34"),
        SKTexture(imageNamed: "h35"),
        SKTexture(imageNamed: "h36"),
        SKTexture(imageNamed: "h37"),
        SKTexture(imageNamed: "h38"),
        SKTexture(imageNamed: "h39"),
        SKTexture(imageNamed: "h40")
        
    ]
    static let harpie_derriere = [
        SKTexture(imageNamed: "h41"),
        SKTexture(imageNamed: "h42"),
        SKTexture(imageNamed: "h43"),
        SKTexture(imageNamed: "h44"),
        SKTexture(imageNamed: "h45"),
        SKTexture(imageNamed: "h46"),
        SKTexture(imageNamed: "h47"),
        SKTexture(imageNamed: "h48")
        
    ]
    // attaque :
    static let harpie_devant_atk = [
        SKTexture(imageNamed: "h49"),
        SKTexture(imageNamed: "h50"),
        SKTexture(imageNamed: "h51"),
        SKTexture(imageNamed: "h52"),
        SKTexture(imageNamed: "h53"),
        SKTexture(imageNamed: "h54"),
        SKTexture(imageNamed: "h55"),
        ]
    static let harpie_profil_atk = [
        SKTexture(imageNamed: "h56"),
        SKTexture(imageNamed: "h57"),
        SKTexture(imageNamed: "h58"),
        SKTexture(imageNamed: "h59"),
        SKTexture(imageNamed: "h60"),
        SKTexture(imageNamed: "h61"),
        SKTexture(imageNamed: "h62")
    ]
    static let harpie_derriere_atk = [
        SKTexture(imageNamed: "h63"),
        SKTexture(imageNamed: "h64"),
        SKTexture(imageNamed: "h65"),
        SKTexture(imageNamed: "h66"),
        SKTexture(imageNamed: "h67"),
        SKTexture(imageNamed: "h68"),
        SKTexture(imageNamed: "h69"),
        ]
    
    // sirenia ================
    
    static let sire_devant_im = [
        SKTexture(imageNamed: "s1"),
        SKTexture(imageNamed: "s2"),
        SKTexture(imageNamed: "s3"),
        SKTexture(imageNamed: "s4"),
        SKTexture(imageNamed: "s5"),
        SKTexture(imageNamed: "s6"),
        SKTexture(imageNamed: "s7"),
        SKTexture(imageNamed: "s8")
    ]
    
    static let sire_profil_im = [
        SKTexture(imageNamed: "s9"),
        SKTexture(imageNamed: "s10"),
        SKTexture(imageNamed: "s11"),
        SKTexture(imageNamed: "s12"),
        SKTexture(imageNamed: "s13"),
        SKTexture(imageNamed: "s14"),
        SKTexture(imageNamed: "s15"),
        SKTexture(imageNamed: "s16")
    ]
    static let sire_derriere_im = [
        SKTexture(imageNamed: "s17"),
        SKTexture(imageNamed: "s18"),
        SKTexture(imageNamed: "s19"),
        SKTexture(imageNamed: "s20"),
        SKTexture(imageNamed: "s21"),
        SKTexture(imageNamed: "s22"),
        SKTexture(imageNamed: "s23"),
        SKTexture(imageNamed: "s24")
        
    ]
    // immobile
    static let sire_devant = [
        SKTexture(imageNamed: "s25"),
        SKTexture(imageNamed: "s26"),
        SKTexture(imageNamed: "s27"),
        SKTexture(imageNamed: "s28"),
        SKTexture(imageNamed: "s29"),
        SKTexture(imageNamed: "s30"),
        SKTexture(imageNamed: "s31"),
        SKTexture(imageNamed: "s32")
        
    ]
    static let sire_profil = [
        SKTexture(imageNamed: "s33"),
        SKTexture(imageNamed: "s34"),
        SKTexture(imageNamed: "s35"),
        SKTexture(imageNamed: "s36"),
        SKTexture(imageNamed: "s37"),
        SKTexture(imageNamed: "s38"),
        SKTexture(imageNamed: "s39"),
        SKTexture(imageNamed: "s40")
        
    ]
    static let sire_derriere = [
        SKTexture(imageNamed: "s41"),
        SKTexture(imageNamed: "s42"),
        SKTexture(imageNamed: "s43"),
        SKTexture(imageNamed: "s44"),
        SKTexture(imageNamed: "s45"),
        SKTexture(imageNamed: "s46"),
        SKTexture(imageNamed: "s47"),
        SKTexture(imageNamed: "s48")
        
    ]
    // attaque :
    static let sire_devant_atk = [
        SKTexture(imageNamed: "s49"),
        SKTexture(imageNamed: "s50"),
        SKTexture(imageNamed: "s51"),
        SKTexture(imageNamed: "s52"),
        SKTexture(imageNamed: "s53"),
        SKTexture(imageNamed: "s54"),
        SKTexture(imageNamed: "s55"),
        ]
    static let sire_profil_atk = [
        SKTexture(imageNamed: "s56"),
        SKTexture(imageNamed: "s57"),
        SKTexture(imageNamed: "s58"),
        SKTexture(imageNamed: "s59"),
        SKTexture(imageNamed: "s60"),
        SKTexture(imageNamed: "s61"),
        SKTexture(imageNamed: "s62")
    ]
    static let sire_derriere_atk = [
        SKTexture(imageNamed: "s63"),
        SKTexture(imageNamed: "s64"),
        SKTexture(imageNamed: "s65"),
        SKTexture(imageNamed: "s66"),
        SKTexture(imageNamed: "s67"),
        SKTexture(imageNamed: "s68"),
        SKTexture(imageNamed: "s69"),
        ]
    
    
    // grimfield version demon
    
    static let grimd_devant_im = [
        SKTexture(imageNamed: "gd1"),
        SKTexture(imageNamed: "gd2"),
        SKTexture(imageNamed: "gd3"),
        SKTexture(imageNamed: "gd4"),
        SKTexture(imageNamed: "gd5"),
        SKTexture(imageNamed: "gd6"),
        SKTexture(imageNamed: "gd7"),
        SKTexture(imageNamed: "gd8")
    ]
    
    static let grimd_profil_im = [
        SKTexture(imageNamed: "gd9"),
        SKTexture(imageNamed: "gd10"),
        SKTexture(imageNamed: "gd11"),
        SKTexture(imageNamed: "gd12"),
        SKTexture(imageNamed: "gd13"),
        SKTexture(imageNamed: "gd14"),
        SKTexture(imageNamed: "gd15"),
        SKTexture(imageNamed: "gd16")
    ]
    static let grimd_derriere_im = [
        SKTexture(imageNamed: "gd17"),
        SKTexture(imageNamed: "gd18"),
        SKTexture(imageNamed: "gd19"),
        SKTexture(imageNamed: "gd20"),
        SKTexture(imageNamed: "gd21"),
        SKTexture(imageNamed: "gd22"),
        SKTexture(imageNamed: "gd23"),
        SKTexture(imageNamed: "gd24")
        
    ]
    // immobile
    static let grimd_devant = [
        SKTexture(imageNamed: "gd25"),
        SKTexture(imageNamed: "gd26"),
        SKTexture(imageNamed: "gd27"),
        SKTexture(imageNamed: "gd28"),
        SKTexture(imageNamed: "gd29"),
        SKTexture(imageNamed: "gd30"),
        SKTexture(imageNamed: "gd31"),
        SKTexture(imageNamed: "gd32")
        
    ]
    static let grimd_profil = [
        SKTexture(imageNamed: "gd33"),
        SKTexture(imageNamed: "gd34"),
        SKTexture(imageNamed: "gd35"),
        SKTexture(imageNamed: "gd36"),
        SKTexture(imageNamed: "gd37"),
        SKTexture(imageNamed: "gd38"),
        SKTexture(imageNamed: "gd39"),
        SKTexture(imageNamed: "gd40")
        
    ]
    static let grimd_derriere = [
        SKTexture(imageNamed: "gd41"),
        SKTexture(imageNamed: "gd42"),
        SKTexture(imageNamed: "gd43"),
        SKTexture(imageNamed: "gd44"),
        SKTexture(imageNamed: "gd45"),
        SKTexture(imageNamed: "gd46"),
        SKTexture(imageNamed: "gd47"),
        SKTexture(imageNamed: "gd48")
        
    ]
    // attaque :
    static let grimd_devant_atk = [
        SKTexture(imageNamed: "gd49"),
        SKTexture(imageNamed: "gd50"),
        SKTexture(imageNamed: "gd51"),
        SKTexture(imageNamed: "gd52"),
        SKTexture(imageNamed: "gd53"),
        SKTexture(imageNamed: "gd54"),
        SKTexture(imageNamed: "gd55"),
        SKTexture(imageNamed: "gd56")
        ]
    static let grimd_profil_atk = [
        SKTexture(imageNamed: "gd57"),
        SKTexture(imageNamed: "gd58"),
        SKTexture(imageNamed: "gd59"),
        SKTexture(imageNamed: "gd60"),
        SKTexture(imageNamed: "gd61"),
        SKTexture(imageNamed: "gd62"),
        SKTexture(imageNamed: "gd63"),
        SKTexture(imageNamed: "gd64")
    ]
    static let grimd_derriere_atk = [
        SKTexture(imageNamed: "gd65"),
        SKTexture(imageNamed: "gd66"),
        SKTexture(imageNamed: "gd67"),
        SKTexture(imageNamed: "gd68"),
        SKTexture(imageNamed: "gd69"),
        SKTexture(imageNamed: "gd70"),
        SKTexture(imageNamed: "gd71"),
        SKTexture(imageNamed: "gd72")
        ]
    
}













