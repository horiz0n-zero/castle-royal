//
//  GameViewController.swift
//  castle royal
//
//  Created by Antoine FeuFeu on 15/07/2016.
//  Copyright (c) 2016 Antoine FeuFeu. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let vue = self.view as! SKView
        information = InformationGeneral(frame: vue.frame, audioNode: nil, animationNode: nil)
        let scene = GameScene(size: vue.frame.size)
        scene.scaleMode = .AspectFill
        vue.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    return .Portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
