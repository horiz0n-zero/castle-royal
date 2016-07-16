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
    
    static let anim_vladBim = SKTexture(imageNamed: "vladEclat")
    static let anim_vlad_projectile = SKTexture(imageNamed: "vladProjectile")

    
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
    static let molta_semi_devant = [
        SKTexture(imageNamed: "m49"),
        SKTexture(imageNamed: "m50"),
        SKTexture(imageNamed: "m51"),
        SKTexture(imageNamed: "m52"),
        SKTexture(imageNamed: "m53"),
        SKTexture(imageNamed: "m54"),
        SKTexture(imageNamed: "m55"),
        SKTexture(imageNamed: "m56")
        
    ]
    static let molta_profil = [
        SKTexture(imageNamed: "m57"),
        SKTexture(imageNamed: "m58"),
        SKTexture(imageNamed: "m59"),
        SKTexture(imageNamed: "m60"),
        SKTexture(imageNamed: "m61"),
        SKTexture(imageNamed: "m62"),
        SKTexture(imageNamed: "m63"),
        SKTexture(imageNamed: "m64")
        
    ]
    static let molta_semi_derriere = [
        SKTexture(imageNamed: "m65"),
        SKTexture(imageNamed: "m66"),
        SKTexture(imageNamed: "m67"),
        SKTexture(imageNamed: "m68"),
        SKTexture(imageNamed: "m69"),
        SKTexture(imageNamed: "m70"),
        SKTexture(imageNamed: "m71"),
        SKTexture(imageNamed: "m72")
        
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
        SKTexture(imageNamed: "m88")
        ]
    static let molta_profil_atk = [
        SKTexture(imageNamed: "m97"),
        SKTexture(imageNamed: "m98"),
        SKTexture(imageNamed: "m99"),
        SKTexture(imageNamed: "m100"),
        SKTexture(imageNamed: "m101"),
        SKTexture(imageNamed: "m102"),
        SKTexture(imageNamed: "m103"),
        SKTexture(imageNamed: "m104")
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
        SKTexture(imageNamed: "v103")
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

}













