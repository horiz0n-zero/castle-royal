# castle-royal
simple game inspired by clash royal but with a touch of castle clash written in swift using spritekit

![alt tag](https://github.com/horiz0n-zero/castle-royal/blob/master/castle%20royal/Assets.xcassets/intro.imageset/IMG_0034.jpg)
<br/>
<br/>
<br/>
##Only support ipad, <br/>
*if you want to fix this use self.frame(size) and set a specific size to all node.* <br/>
<br/>
Who to add a new hero and set his abilitie ?<br/>
<br/>
First add textures into textures.swift.<br/>
<br/>
After in hero.swift add a new hero :<br/>
<br/>
class Hero_name: heroSprite { // hero name <br/>
    <br/>
    <br/>
    init() { <br/>
        <br/>
        super.init(texture: textures.vlad_devant[0], color: UIColor.cyanColor(), size: CGSize(width: information.solwidth*0.85, height: information.solwidth*0.85))<br/>
        action = String(NSUUID.init())<br/>
        self.useAutoResize = true // if false the size given at the top will be set but it can create animation error, use true if you have textures trouble. <br/>
        self.t_devant = textures.harpie_devant // make sure you set texture before call func that use texture ! <br/>
        self.t_profil = textures.harpie_profil<br/>
        self.t_derrier = textures.harpie_derriere<br/>
        self.t_devantATK = textures.harpie_devant_atk<br/>
        self.t_profilATK = textures.harpie_profil_atk<br/>
        self.t_derrierATK = textures.harpie_derriere_atk<br/>
        self.t_profilIMO  = textures.harpie_profil_im<br/>
        self.t_derrierIMO = textures.harpie_derriere_im<br/>
        self.t_devantIMO = textures.harpie_devant_im<br/>
        self.heroType = hero.harpie // herotype use in abilities and attack you have to set this or create a new type in structures.swift<br/>
        self.zPosition = 200<br/>
        self.devantIMMO()<br/>
        self.pv = 600 // lifepoint<br/>
        self.degat = 175 // attack point<br/>
        self.initLabel()<br/>
        self.flying = true // flying or not ? this variable is currently unused <br/>
    }<br/>
    <br/>
    required init?(coder aDecoder: NSCoder) {<br/>
        fatalError("init(coder:) has not been implemented")<br/>
    }<br/>
    <br/>
}<br/>
