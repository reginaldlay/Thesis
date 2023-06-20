//
//  LandingController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class LandingController: ConstructController {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "button_landing", name: "button_start", widthSize: 200, heightSize: 120, xPos: 0, yPos: 180, zPos: 0)
        addImage(imageName: "button_landing", name: "button_achievement", widthSize: 200, heightSize: 120, xPos: 0, yPos: 0, zPos: 0)
        addImage(imageName: "button_landing", name: "button_setting", widthSize: 200, heightSize: 120, xPos: 0, yPos: -180, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "label_start", text: "Start", fontSize: 28, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 173, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "label_achievement", text: "Achievement", fontSize: 27, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -5, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "label_setting", text: "Setting", fontSize: 28, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -186, zPos: 1)
        
        setUpSFXButton()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "button_start" || node.name == "label_start") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if let nextScene = SKScene(fileNamed: "PlayScene") {
                        self.scene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(nextScene)
                    }
                }
            }
            else if (node.name == "button_achievement" || node.name == "label_achievement") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if let nextScene = SKScene(fileNamed: "AchievementScene") {
                        self.scene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(nextScene)
                    }
                }
            }
            else if (node.name == "button_setting" || node.name == "label_setting") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if let nextScene = SKScene(fileNamed: "SettingScene") {
                        self.scene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(nextScene)
                    }
                }
            }
        }
    }
}
