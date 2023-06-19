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
        
        showAchievement()
        
        setUpSFXButton()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "button_back") {
                if CoreDataManager.shared.playerCurrentSFX == true {
                    soundSFXButton?.play()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if let nextScene = SKScene(fileNamed: "LandingScene") {
                        self.scene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(nextScene)
                    }
                }
            }
        }
    }
    
}
