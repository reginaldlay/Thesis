//
//  AchievementController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class AchievementController: ConstructController {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "button_back", name: "button_back", widthSize: 55, heightSize: 50, xPos: -140, yPos: 320, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "achievement_label", text: "Your Achievements", fontSize: 26, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 185, zPos: 0)
        addImage(imageName: "achievement_locked_1", name: "achievement_1", widthSize: 70, heightSize: 110, xPos: -109, yPos: 80, zPos: 0)
        addImage(imageName: "achievement_locked_10", name: "achievement_10", widthSize: 86, heightSize: 110, xPos: 0, yPos: 80, zPos: 0)
        addImage(imageName: "achievement_locked_50", name: "achievement_50", widthSize: 87, heightSize: 110, xPos: 109, yPos: 80, zPos: 0)
        addImage(imageName: "achievement_locked_100", name: "achievement_100", widthSize: 92, heightSize: 110, xPos: -109, yPos: -50, zPos: 0)
        addImage(imageName: "achievement_locked_300", name: "achievement_300", widthSize: 94, heightSize: 110, xPos: 0, yPos: -50, zPos: 0)
        addImage(imageName: "achievement_locked_500", name: "achievement_500", widthSize: 93, heightSize: 110, xPos: 109, yPos: -50, zPos: 0)
        addImage(imageName: "achievement_locked_1000", name: "achievement_1000", widthSize: 98, heightSize: 110, xPos: -109, yPos: -180, zPos: 0)
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
    
}
