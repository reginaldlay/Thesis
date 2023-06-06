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
        addImage(imageName: "background_level_number", name: "background_level_number", widthSize: 200, heightSize: 120, xPos: 0, yPos: 0, zPos: 0)
        addImage(imageName: "button_previous", name: "button_previous", widthSize: 48, heightSize: 48, xPos: -135, yPos: 0, zPos: 0)
        addImage(imageName: "button_next", name: "button_next", widthSize: 48, heightSize: 48, xPos: 135, yPos: 0, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "level_name", text: "Level 1", fontSize: 25, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -6, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "level_choose", text: "Choose your level!", fontSize: 30, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 124, zPos: 0)
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
