//
//  SKScene.swift
//  Particle
//
//  Created by 田山　由理 on 2016/12/24.
//  Copyright © 2016年 Yuri Tayama. All rights reserved.
//

import SpriteKit

class BaseSKScene : SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.clear
        //little trick for iPad
        self.scaleMode = .resizeFill
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseSKScene.emitParticle(_:)), name: NSNotification.Name(rawValue: "didPressMagicButton"), object: nil)
    }
    
    func emitParticle(_ notification: Foundation.Notification) {
        
        guard let testParticlePath = Bundle.main.path(forResource: "Particle", ofType: "sks") else {
            return
        }
        
        let testParticle = NSKeyedUnarchiver.unarchiveObject(withFile: testParticlePath) as! SKEmitterNode
        testParticle.position = CGPoint(x: self.frame.midX, y: self.frame.maxY)
        self.addChild(testParticle)
    }
}
