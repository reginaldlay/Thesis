//
//  GameScene.swift
//  Thesis
//
//  Created by Reginald Lay on 23/04/23.
//

import SpriteKit
import GameplayKit

class GameController: SKScene {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "logo", name: "logo", widthSize: 300, heightSize: 300, xPos: 0, yPos: 0, zPos: 0)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: self)
//            let node = self.atPoint(location)
//        }
//    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "touch_screen") {
                if let nextScene = SKScene(fileNamed: "LandingScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
        }
    }
    
    func addImage(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let gameAsset = SKSpriteNode(imageNamed: imageName)
        gameAsset.name = name
        gameAsset.size = CGSize(width: widthSize, height: heightSize)
        gameAsset.position = CGPoint(x: xPos, y: yPos)
        gameAsset.zPosition = zPos
        addChild(gameAsset)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
