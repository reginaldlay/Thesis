//
//  LandingController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class LandingController: SKScene {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background", name: "background", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "header_background", name: "header_background", widthSize: 125, heightSize: 120, xPos: -132.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "subheader_background", name: "subheader_background", widthSize: 275, heightSize: 120, xPos: 57.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "landing_button", name: "start_button", widthSize: 200, heightSize: 120, xPos: 0, yPos: 100, zPos: 0)
        addImage(imageName: "landing_button", name: "achievement_button", widthSize: 200, heightSize: 120, xPos: 0, yPos: -80, zPos: 0)
        addImage(imageName: "landing_button", name: "setting_button", widthSize: 200, heightSize: 120, xPos: 0, yPos: -260, zPos: 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "start_button") {
                if let nextScene = SKScene(fileNamed: "PlayScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "start_label") {
                if let nextScene = SKScene(fileNamed: "PlayScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            
            else if (node.name == "achievement_button") {
                if let nextScene = SKScene(fileNamed: "AchievementScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "achievement_label") {
                if let nextScene = SKScene(fileNamed: "AchievementScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            
            else if (node.name == "setting_button") {
                if let nextScene = SKScene(fileNamed: "SettingScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "setting_label") {
                if let nextScene = SKScene(fileNamed: "SettingScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
        }
    }
    
    func addImage(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let landingAsset = SKSpriteNode(imageNamed: imageName)
        landingAsset.name = name
        landingAsset.size = CGSize(width: widthSize, height: heightSize)
        landingAsset.position = CGPoint(x: xPos, y: yPos)
        landingAsset.zPosition = zPos
        addChild(landingAsset)
    }
    
    /*
    func addText(textName: String, name: String, fontName: String, fontSize: CGFloat, fontColor: UIColor, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let landingAsset = SKLabelNode(text: textName)
        landingAsset.name = name
        landingAsset.fontName = fontName
        landingAsset.fontSize = fontSize
        landingAsset.fontColor = fontColor
        landingAsset.position = CGPoint(x: xPos, y: yPos)
        landingAsset.zPosition = zPos
        addChild(landingAsset)
    }
    */
}
