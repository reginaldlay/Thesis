//
//  PlayController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class PlayController: ConstructController {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "button_back", name: "button_back", widthSize: 55, heightSize: 50, xPos: -140, yPos: 320, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "level_choose", text: "Choose your level!", fontSize: 30, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 124, zPos: 0)
        addImage(imageName: "button_previous", name: "button_previous", widthSize: 48, heightSize: 48, xPos: -135, yPos: 0, zPos: 0)
        addImage(imageName: "background_level_number", name: "background_level_number", widthSize: 200, heightSize: 120, xPos: 0, yPos: 0, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "level_name", text: "Level \(CoreDataManager.shared.playerChosenLevel+1)", fontSize: 25, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -6, zPos: 1)
        addImage(imageName: "button_next", name: "button_next", widthSize: 48, heightSize: 48, xPos: 135, yPos: 0, zPos: 0)
        
        checkVisibleButton()
        
        setUpSFXButton()
    }   
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "button_back") {
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
            else if (node.name == "background_level_number" || node.name == "level_name") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if let nextScene = SKScene(fileNamed: "StartingStageScene") {
                        self.scene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(nextScene, transition: SKTransition.fade(withDuration: 4))
                    }
                }
            }
            else if (node.name == "button_previous") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                CoreDataManager.shared.playerChosenLevel -= 1
                
                changeLevelName()
                checkVisibleButton()
            }
            else if (node.name == "button_next") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                CoreDataManager.shared.playerChosenLevel += 1
                
                changeLevelName()
                checkVisibleButton()
            }
        }
    }
    
}

//functions
extension PlayController {
    
    func checkVisibleButton() {
        if CoreDataManager.shared.readData().currentLevel == 0 {
            childNode(withName: "button_previous")?.isHidden = true
            childNode(withName: "button_next")?.isHidden = true
        }
        else {
            if CoreDataManager.shared.playerChosenLevel == 0 {
                childNode(withName: "button_previous")?.isHidden = true
                childNode(withName: "button_next")?.isHidden = false
            }
            else if CoreDataManager.shared.playerChosenLevel == CoreDataManager.shared.playerCurrentLevel {
                childNode(withName: "button_previous")?.isHidden = false
                childNode(withName: "button_next")?.isHidden = true
            }
            else {
                childNode(withName: "button_previous")?.isHidden = false
                childNode(withName: "button_next")?.isHidden = false
            }
        }
    }
    
    func changeLevelName() {
        childNode(withName: "level_name")?.removeFromParent()
        addLabel(fontName: "Futura Medium", name: "level_name", text: "Level \(CoreDataManager.shared.playerChosenLevel+1)", fontSize: 25, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -6, zPos: 1)
    }
    
}
