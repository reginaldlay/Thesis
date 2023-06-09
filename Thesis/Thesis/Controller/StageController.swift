//
//  StageController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class StageController: StageManager {
    
    var newCharacterX: CGFloat {
        get {
            return getCharacterPositionX()
        }
        set {
            stagePuzzleCharacter?.position.x = newValue
        }
    }
    var newCharacterY: CGFloat {
        get {
            return getCharacterPositionY()
        }
        set {
            stagePuzzleCharacter?.position.y = newValue
        }
    }
    
    var characterTouchBorder: Bool = false
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addLabel(fontName: "Futura Medium", name: "label_title", text: "Level 1", fontSize: 24, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 340, zPos: 0)
        addImage(imageName: "button_move_up", name: "button_move_up", widthSize: 60, heightSize: 60, xPos: 0, yPos: -220, zPos: 0)
        addImage(imageName: "button_move_left", name: "button_move_left", widthSize: 60, heightSize: 60, xPos: -60, yPos: -280, zPos: 0)
        addImage(imageName: "button_pause", name: "button_pause", widthSize: 40, heightSize: 40, xPos: 0, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_right", name: "button_move_right", widthSize: 60, heightSize: 60, xPos: 60, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_down", name: "button_move_down", widthSize: 60, heightSize: 60, xPos: 0, yPos: -345, zPos: 0)
        
        arrangePuzzle(arrangingLevelNumber: 1)
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
                if !characterTouchBorder {
                    newCharacterY = (currentCharacterY ?? .zero) + 49.0
                    
                    checkBorderLevel()
                    
                    if characterTouchBorder {
                        print("if: \(newCharacterY)")
                        newCharacterY = newCharacterY - 49
                        print("new if: \(newCharacterY)")
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(y: newCharacterY, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                        print("else: \(newCharacterY)")
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingLevelNumber: 1)
            }
            else if (node.name == "button_move_left") {
                if !characterTouchBorder {
                    newCharacterX = (currentCharacterX ?? .zero) - 49.0
                    
                    checkBorderLevel()
                    
                    if characterTouchBorder {
                        print("if: \(newCharacterX)")
                        newCharacterX = newCharacterX + 49
                        print("new if: \(newCharacterX)")
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(x: newCharacterX, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                        print("else: \(newCharacterX)")
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingLevelNumber: 1)
            }
            else if (node.name == "button_pause") {
                //
            }
            else if (node.name == "button_move_right") {
                if !characterTouchBorder {
                    newCharacterX = (currentCharacterX ?? .zero) + 49.0
                    
                    checkBorderLevel()
                    
                    if characterTouchBorder {
                        print("if: \(newCharacterX)")
                        newCharacterX = newCharacterX - 49
                        print("new if: \(newCharacterX)")
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(x: newCharacterX, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                        print("else: \(newCharacterX)")
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingLevelNumber: 1)
            }
            else if (node.name == "button_move_down") {
                if !characterTouchBorder {
                    newCharacterY = (currentCharacterY ?? .zero) - 49.0
                    
                    checkBorderLevel()
                    
                    if characterTouchBorder {
                        print("if: \(newCharacterY)")
                        newCharacterY = newCharacterY + 49
                        print("new if: \(newCharacterY)")
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(y: newCharacterY, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                        print("else: \(newCharacterY)")
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingLevelNumber: 1)
            }
            
        }
    }
    
    func checkBorderLevel() {
        for index in 1...stagePuzzleAssets.count {
            if newCharacterX == stagePuzzleAssets[index-1].position.x && newCharacterY == stagePuzzleAssets[index-1].position.y {
                characterTouchBorder = false
                print("FALSE")
                break
            }
            else {
                characterTouchBorder = true
                print("TRUE")
            }
        }
    }
    
    func checkWinCondition(checkingLevelNumber: Int) {
        switch checkingLevelNumber {
        case 1:
            if newCharacterX == -49 && newCharacterY == 98 {
                print("menanggg")
            }
            else {
                print("no menangg")
            }
            
        case 2:
            if newCharacterX == 49 && newCharacterY == 98 {
                print("menanggg")
            }
            else {
                print("nooo")
            }
            
        default:
            break
        }
    }
    
}
