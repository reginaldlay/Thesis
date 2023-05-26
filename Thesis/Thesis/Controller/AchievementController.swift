//
//  AchievementController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class AchievementController: SKScene {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "background_header", name: "background_header", widthSize: 125, heightSize: 120, xPos: -132.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "background_subheader", name: "background_subheader", widthSize: 275, heightSize: 120, xPos: 57.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "button_back", name: "button_back", widthSize: 55, heightSize: 50, xPos: -140, yPos: 230, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "achievement_label", text: "Your Achievements", fontSize: 26, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 170, zPos: 0)
        addImage(imageName: "achievement_locked_1", name: "achievement_1", widthSize: 70, heightSize: 110, xPos: -109, yPos: 50, zPos: 0)
        addImage(imageName: "achievement_locked_10", name: "achievement_10", widthSize: 86, heightSize: 110, xPos: 0, yPos: 50, zPos: 0)
        addImage(imageName: "achievement_locked_50", name: "achievement_50", widthSize: 87, heightSize: 110, xPos: 109, yPos: 50, zPos: 0)
        addImage(imageName: "achievement_locked_100", name: "achievement_100", widthSize: 92, heightSize: 110, xPos: -109, yPos: -80, zPos: 0)
        addImage(imageName: "achievement_locked_300", name: "achievement_300", widthSize: 94, heightSize: 110, xPos: 0, yPos: -80, zPos: 0)
        addImage(imageName: "achievement_locked_500", name: "achievement_500", widthSize: 93, heightSize: 110, xPos: 109, yPos: -80, zPos: 0)
        addImage(imageName: "achievement_locked_1000", name: "achievement_1000", widthSize: 98, heightSize: 110, xPos: -109, yPos: -210, zPos: 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "button_back") {
                if let nextScene = SKScene(fileNamed: "LandingScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
        }
    }
    
    func addImage(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let achievementAsset = SKSpriteNode(imageNamed: imageName)
        achievementAsset.name = name
        achievementAsset.size = CGSize(width: widthSize, height: heightSize)
        achievementAsset.position = CGPoint(x: xPos, y: yPos)
        achievementAsset.zPosition = zPos
        addChild(achievementAsset)
    }
    
    func addLabel(fontName: String, name: String, text: String, fontSize: CGFloat, fontColor: UIColor, xAlignment: SKLabelHorizontalAlignmentMode, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let achievementLabel = SKLabelNode(fontNamed: fontName)
        achievementLabel.name = name
        achievementLabel.text = text
        achievementLabel.fontSize = fontSize
        achievementLabel.fontColor = fontColor
        achievementLabel.horizontalAlignmentMode = xAlignment
        achievementLabel.position = CGPoint(x: xPos, y: yPos)
        achievementLabel.zPosition = zPos
        addChild(achievementLabel)
    }
    
}
