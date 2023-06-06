//
//  FinishController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class FinishController: ConstructController {
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addLabel(fontName: "Futura Medium", name: "label_finish_level", text: "Level 1 Clear", fontSize: 20, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 0, zPos: 0)
        addImage(imageName: "button_back_to_menu", name: "button_back_to_menu", widthSize: 150, heightSize: 75, xPos: -85, yPos: -240, zPos: 0)
        addImage(imageName: "button_next_level", name: "button_next_level", widthSize: 150, heightSize: 75, xPos: 85, yPos: -240, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "label_back_to_menu", text: "Back to Menu", fontSize: 18, fontColor: .black, xAlignment: .center, xPos: -85, yPos: -242, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "label_next_level", text: "Next Level", fontSize: 18, fontColor: .black, xAlignment: .center, xPos: 85, yPos: -242, zPos: 1)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "button_back_to_menu") {
                if let nextScene = SKScene(fileNamed: "PlayScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "label_back_to_menu") {
                if let nextScene = SKScene(fileNamed: "PlayScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            
            else if (node.name == "button_next_level") {
                if let nextScene = SKScene(fileNamed: "StageScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
            else if (node.name == "label_next_level") {
                if let nextScene = SKScene(fileNamed: "StageScene") {
                    self.scene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(nextScene)
                }
            }
        }
    }
}
