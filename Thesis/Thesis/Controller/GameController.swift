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
        addNode(imageName: "background", name: "background", widthSize: 750, heightSize: 1334, xPos: 0, yPos: 0, zPos: -1)
        addNode(imageName: "logo", name: "logo", widthSize: 500, heightSize: 500, xPos: 0, yPos: 0, zPos: 0)
        
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
    
    func addNode(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let homeAsset = SKSpriteNode(imageNamed: imageName)
        homeAsset.name = name
        homeAsset.size = CGSize(width: widthSize, height: heightSize)
        homeAsset.position = CGPoint(x: xPos, y: yPos)
        homeAsset.zPosition = zPos
        addChild(homeAsset)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
