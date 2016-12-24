# ParticleOfSpriteKit

#Particle
炎や水といった自然界の曖昧なものを、CG技術を使った小さな粒子の集合によって表現する手法です。

##【実装内容】
###SpriteKitのルールに則りSKSceneの配下にSKViewを配置する構造にする
StoryboardでViewControllerのrootViewの下にviewを追加し、
継承クラスを*SKView*とする。


###ViewControllerのviewWillAppearの中でSKSceneを生成＆配置
`override func viewWillAppear(_ animated: Bool) {
    let scene = BaseSKScene(size: skView.bounds.size)
    skView.presentScene(scene)
}
`

###SKSceneでskViewを呼び出す
SKSceneクラスを継承したクラスを生成し、
仕様するParticleファイルを指定してviewの階層に追加する。
didMove関数はViewControllerのviewWillAppearから呼び出された際に走る。
`
override func didMove(to view: SKView) {
	func emitParticle()
}
    
func emitParticle() {
        
    guard let testParticlePath = Bundle.main.path(forResource: "snowParticle", ofType: "sks") else {
            return
    }
        
    let snowParticle = NSKeyedUnarchiver.unarchiveObject(withFile: testParticlePath) as! SKEmitterNode
    snowParticle.position = CGPoint(x: self.frame.midX, y: self.frame.maxY)
    self.addChild(snowParticle)
}
`

