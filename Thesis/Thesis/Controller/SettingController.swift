//
//  SettingController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import GameplayKit
import SpriteKit

class SettingController: ConstructController {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "button_back", name: "button_back", widthSize: 55, heightSize: 50, xPos: -140, yPos: 320, zPos: 0)
        addImage(imageName: "button_landing", name: "button_bgm", widthSize: 200, heightSize: 120, xPos: 0, yPos: 100, zPos: 0)
        addImage(imageName: "button_stage_pause", name: "button_sfx", widthSize: 200, heightSize: 120, xPos: 0, yPos: -100, zPos: 0)
        showSettingLabel()
        showCopyright(zPos: 0)
        
        setUpSFXButton()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if node.name == "button_back" {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if let nextScene = SKScene(fileNamed: "LandingScene") {
                        self.scene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(nextScene)
                    }
                }
            }
            else if (node.name == "button_bgm" || node.name == "label_bgm") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                if CoreDataManager.shared.playerCurrentBGMisOff == false {
                    AudioManager.shared.stopBGM()
                    
                    settingBGMLabel.text = "BGM: OFF"
                    
                    CoreDataManager.shared.playerCurrentBGMisOff = true
                    CoreDataManager.shared.updateData()
                }
                else {
                    AudioManager.shared.playBGM()
                    
                    settingBGMLabel.text = "BGM: ON"
                    
                    CoreDataManager.shared.playerCurrentBGMisOff = false
                    CoreDataManager.shared.updateData()
                }
            }
            else if (node.name == "button_sfx" || node.name == "label_sfx") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    settingSFXLabel.text = "SFX: OFF"
                    
                    CoreDataManager.shared.playerCurrentSFXisOff = true
                    CoreDataManager.shared.updateData()
                }
                else {
                    soundSFXButton?.play()
                    
                    settingSFXLabel.text = "SFX: ON"
                    
                    CoreDataManager.shared.playerCurrentSFXisOff = false
                    CoreDataManager.shared.updateData()
                }
            }
        }
    }
    
}
