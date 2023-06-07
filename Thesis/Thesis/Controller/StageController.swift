//
//  StageController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class StageController: StageManager {
    
    var newCharacterX: CGFloat = 0.0
    var newCharacterY: CGFloat = 0.0
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addLabel(fontName: "Futura Medium", name: "label_title", text: "Level 1", fontSize: 24, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 340, zPos: 0)
        addImage(imageName: "button_move_up", name: "button_move_up", widthSize: 60, heightSize: 60, xPos: 0, yPos: -220, zPos: 0)
        addImage(imageName: "button_move_left", name: "button_move_left", widthSize: 60, heightSize: 60, xPos: -60, yPos: -280, zPos: 0)
        addImage(imageName: "button_pause", name: "button_pause", widthSize: 40, heightSize: 40, xPos: 0, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_right", name: "button_move_right", widthSize: 60, heightSize: 60, xPos: 60, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_down", name: "button_move_down", widthSize: 60, heightSize: 60, xPos: 0, yPos: -345, zPos: 0)
        
        arrangePuzzle(arrangingLevelNumber: 1)
        print(stagePuzzleCharacter?.position)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            let currentCharacterX = stagePuzzleCharacter?.position.x
            let currentCharacterY = stagePuzzleCharacter?.position.y
            
            for index in 1...56 {
                if node.name == "ss\(index)" {
                    let rotationAction = SKAction.rotate(byAngle: CGFloat.pi / 2, duration: 0.3)
                    node.run(rotationAction)
                }
            }
            
            if (node.name == "button_move_up") {
                newCharacterY = (currentCharacterY ?? .zero) + 49.0
                let moveCharacter = SKAction.moveTo(y: newCharacterY, duration: 0.1)
                stagePuzzleCharacter?.run(moveCharacter)
                
                if newCharacterX == -49 && newCharacterY == 98 {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("menangg")
                }
                else {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("nooo")
                }
            }
            else if (node.name == "button_move_left") {
                newCharacterX = (currentCharacterX ?? .zero) - 49.0
                let moveCharacter = SKAction.moveTo(x: newCharacterX, duration: 0.1)
                stagePuzzleCharacter?.run(moveCharacter)
                
                if newCharacterX == -49 && newCharacterY == 98 {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("menangg")
                }
                else {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("nooo")
                }
            }
            else if (node.name == "button_pause") {
                //
            }
            else if (node.name == "button_move_right") {
                newCharacterX = (currentCharacterX ?? .zero) + 49.0
                let moveCharacter = SKAction.moveTo(x: newCharacterX, duration: 0.1)
                stagePuzzleCharacter?.run(moveCharacter)
                
                if newCharacterX == -49 && newCharacterY == 98 {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("menangg")
                }
                else {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("nooo")
                }
            }
            else if (node.name == "button_move_down") {
                newCharacterY = (currentCharacterY ?? .zero) - 49.0
                let moveCharacter = SKAction.moveTo(y: newCharacterY, duration: 0.1)
                stagePuzzleCharacter?.run(moveCharacter)
                
                if newCharacterX == -49 && newCharacterY == 98 {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("menangg")
                }
                else {
                    print(newCharacterX)
                    print(newCharacterY)
                    print("nooo")
                }
            }
            
        }
    }
}
