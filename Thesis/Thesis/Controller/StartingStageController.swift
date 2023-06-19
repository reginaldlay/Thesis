//
//  StartingStageController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class StartingStageController: ConstructController {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addLabel(fontName: "Futura Medium", name: "label_level", text: "Level \(CoreDataManager.shared.playerChosenLevel+1)", fontSize: 30, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 0, zPos: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if let nextScene = SKScene(fileNamed: "StageScene") {
                self.scene?.scaleMode = .aspectFill
                self.scene?.view?.presentScene(nextScene, transition: SKTransition.fade(withDuration: 4))
            }
        }
    }
    
}
