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
    var currentLevel: Int = 1
    
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
}

//touches
extension StageController {
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
                    
                    let desiredName = node.name ?? ""
                    
                    checkPassable(levelNumber: 1, exceptionalName: desiredName)

                }
            }
            
            if (node.name == "button_move_up") {
                if !characterTouchBorder {
                    newCharacterY = (currentCharacterY ?? .zero) + 49.0

                    checkBorder()
                    
                    if characterTouchBorder {
                        newCharacterY = newCharacterY - 49
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(y: newCharacterY, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingWinLevelNumber: 1)
            }
            else if (node.name == "button_move_left") {
                if !characterTouchBorder {
                    newCharacterX = (currentCharacterX ?? .zero) - 49.0
                    
                    checkBorder()
                    
                    if characterTouchBorder {
                        newCharacterX = newCharacterX + 49
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(x: newCharacterX, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingWinLevelNumber: 1)
            }
            else if (node.name == "button_pause") {
                //
            }
            else if (node.name == "button_move_right") {
                if !characterTouchBorder {
                    newCharacterX = (currentCharacterX ?? .zero) + 49.0
                    
                    checkBorder()
                    
                    if characterTouchBorder {
                        newCharacterX = newCharacterX - 49
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(x: newCharacterX, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingWinLevelNumber: 1)
            }
            else if (node.name == "button_move_down") {
                if !characterTouchBorder {
                    newCharacterY = (currentCharacterY ?? .zero) - 49.0
                    
                    checkBorder()
                    
                    if characterTouchBorder {
                        newCharacterY = newCharacterY + 49
                    }
                    else {
                        let moveCharacter = SKAction.moveTo(y: newCharacterY, duration: 0.1)
                        stagePuzzleCharacter?.run(moveCharacter)
                    }
                }
                characterTouchBorder = false
                
                checkWinCondition(checkingWinLevelNumber: 1)
            }
            
        }
    }
}

//functions
extension StageController {
    func checkBorder() {
        for index in 1...stagePuzzleAssets.count {
            if newCharacterX == stagePuzzleAssets[index-1].puzzleAsset.position.x && newCharacterY == stagePuzzleAssets[index-1].puzzleAsset.position.y {
                characterTouchBorder = false
                break
            }
            else {
                characterTouchBorder = true
            }
        }
    }
    
    func checkWinCondition(checkingWinLevelNumber: Int) {
        switch checkingWinLevelNumber {
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
    
    func checkPassable(levelNumber: Int, exceptionalName: String) {
        if let puzzleIndex = stagePuzzleAssets.firstIndex(where: { $0.puzzleAsset.name == exceptionalName }) {
            stagePuzzleAssets[puzzleIndex].puzzleDirection += 1
                
            if stagePuzzleAssets[puzzleIndex].puzzleDirection > 4 {
                stagePuzzleAssets[puzzleIndex].puzzleDirection = 1
            }
            
            switch levelNumber {
            case 1:
                if exceptionalName == "ss25" {
                    if stagePuzzleAssets[puzzleIndex].puzzleDirection % 2 == 0 {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = true
                        print("if if: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                    else {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = false
                        print("if else: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                }
                else {
                    if stagePuzzleAssets[puzzleIndex].puzzleDirection == stagePuzzleAssets[puzzleIndex].puzzleTrueDirection {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = true
                        print("else if: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                    else {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = false
                        print("else else: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                }
                
            case 2:
                if exceptionalName == "ss23" {
                    if stagePuzzleAssets[puzzleIndex].puzzleDirection % 2 == 0 {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = true
                        print("if if 1: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                    else {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = false
                        print("if else 1: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                }
                else if exceptionalName == "ss31" || exceptionalName == "ss32" {
                    if stagePuzzleAssets[puzzleIndex].puzzleDirection == 1 || stagePuzzleAssets[puzzleIndex].puzzleDirection == 3 {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = true
                        print("if if 2: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                    else {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = false
                        print("if else 2: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                }
                else {
                    if stagePuzzleAssets[puzzleIndex].puzzleDirection == stagePuzzleAssets[puzzleIndex].puzzleTrueDirection {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = true
                        print("else if: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                    else {
                        stagePuzzleAssets[puzzleIndex].puzzleBoolDirection = false
                        print("else else: \(stagePuzzleAssets[puzzleIndex].puzzleBoolDirection)")
                    }
                }
                
            default:
                break
            }
        }
    }
}
