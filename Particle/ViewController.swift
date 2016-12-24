//
//  ViewController.swift
//  Particle
//
//  Created by 田山　由理 on 2016/12/24.
//  Copyright © 2016年 Yuri Tayama. All rights reserved.
//

import UIKit
import SpriteKit
import Spring

class ViewController: UIViewController {

    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var presentAnimView: SpringView!
    @IBOutlet weak var magicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let scene = BaseSKScene(size: skView.bounds.size)
        skView.presentScene(scene)
    }
    
    @IBAction func didPressMagicButton(_ sender: AnyObject) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "didPressMagicButton"), object: self)
        self.presentAnimView.animate()
        
        var timer:Timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1.5,
            target: self,
            selector: #selector(ViewController.chageImage),
            userInfo: nil,
            repeats: false)
        
    }

    func chageImage() {
        let openBoxImg = UIImage(named: "presentBoxOpen")
        self.magicButton.setImage(openBoxImg, for: .normal)
        
    }
    
}

