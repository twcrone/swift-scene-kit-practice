
import Foundation

import SpriteKit

class OverlaySKScene: SKScene {
    
    let _gameScene: GameSCNScene!
    var moveBtn: SKSpriteNode!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(size: CGSize, gameScene: GameSCNScene) {
        super.init(size: size)
        
        _gameScene = gameScene
        
        moveBtn = SKSpriteNode(imageNamed: "playBtn")
        moveBtn.position = CGPoint(x: size.width * 0.15, y: size.height * 0.2)
        self.addChild(moveBtn)
        moveBtn.name = "moveBtn"
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let _node:SKNode = self.nodeAtPoint(location)
        
            if(_node.name == "moveBtn") {
                _gameScene.moveBox()
            }
            else {
                _gameScene.reverse()
            }
        }
    }
    
}
