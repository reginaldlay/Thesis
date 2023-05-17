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
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "background_header", name: "background_header", widthSize: 125, heightSize: 120, xPos: -132.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "background_subheader", name: "background_subheader", widthSize: 275, heightSize: 120, xPos: 57.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "button_landing", name: "button_start", widthSize: 200, heightSize: 120, xPos: 0, yPos: 100, zPos: 0)
        addImage(imageName: "button_landing", name: "button_achievement", widthSize: 200, heightSize: 120, xPos: 0, yPos: -80, zPos: 0)
        addImage(imageName: "button_landing", name: "button_setting", widthSize: 200, heightSize: 120, xPos: 0, yPos: -260, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "label_start", text: "Start", fontSize: 36, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 90, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "label_achievement", text: "Achievement", fontSize: 27, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -85, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "label_setting", text: "Setting", fontSize: 36, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -270, zPos: 1)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "button_start") {
                if let nextScene = SKScene(fileNamed: "PlayScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "label_start") {
                if let nextScene = SKScene(fileNamed: "PlayScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            
            else if (node.name == "button_achievement") {
                if let nextScene = SKScene(fileNamed: "AchievementScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "label_achievement") {
                if let nextScene = SKScene(fileNamed: "AchievementScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            
            else if (node.name == "button_setting") {
                if let nextScene = SKScene(fileNamed: "SettingScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "label_setting") {
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
    
    func addLabel(fontName: String, name: String, text: String, fontSize: CGFloat, fontColor: UIColor, xAlignment: SKLabelHorizontalAlignmentMode, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let landingLabel = SKLabelNode(fontNamed: fontName)
        landingLabel.name = name
        landingLabel.text = text
        landingLabel.fontSize = fontSize
        landingLabel.fontColor = fontColor
        landingLabel.horizontalAlignmentMode = xAlignment
        landingLabel.position = CGPoint(x: xPos, y: yPos)
        landingLabel.zPosition = zPos
        addChild(landingLabel)
    }
}
