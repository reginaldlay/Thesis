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
        addLabel(fontName: "Futura Medium", name: "label_ptc", text: "Press to continue...", fontSize: 25, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -310, zPos: 0)
        
        //touch area
        let touchArea = SKSpriteNode()
        touchArea.name = "touch_area"
        touchArea.size = CGSize(width: 390, height: 844)
        touchArea.color = .clear
        touchArea.position = CGPoint(x: 0, y: 0)
        touchArea.zPosition = 1
        addChild(touchArea)
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
            
            if (node.name == "touch_area") {
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
    
    func addLabel(fontName: String, name: String, text: String, fontSize: CGFloat, fontColor: UIColor, xAlignment: SKLabelHorizontalAlignmentMode, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let gameLabel = SKLabelNode(fontNamed: fontName)
        gameLabel.name = name
        gameLabel.text = text
        gameLabel.fontSize = fontSize
        gameLabel.fontColor = fontColor
        gameLabel.horizontalAlignmentMode = xAlignment
        gameLabel.position = CGPoint(x: xPos, y: yPos)
        gameLabel.zPosition = zPos
        addChild(gameLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
