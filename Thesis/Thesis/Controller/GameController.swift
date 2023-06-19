//
//  GameScene.swift
//  Thesis
//
//  Created by Reginald Lay on 23/04/23.
//

import CoreData
import SpriteKit
import GameplayKit

class GameController: ConstructController {
    
    override func didMove(to view: SKView) {
//        CoreDataManager.shared.deleteData()
        readPlayerData()
        
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "logo", name: "logo", widthSize: 300, heightSize: 300, xPos: 0, yPos: 0, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "label_ptc", text: "Press to continue...", fontSize: 25, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -310, zPos: 0)
        
        setUpSFXButton()
        
        if CoreDataManager.shared.playerCurrentBGMisOff == false {
            AudioManager.shared.playBGM()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "background_base" || node.name == "logo" || node.name == "label_ptc") {
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
        }
    }
    
}
