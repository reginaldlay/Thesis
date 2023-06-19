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
    var chosenLevel = CoreDataManager.shared.playerChosenLevel
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addLabel(fontName: "Futura Medium", name: "label_title", text: "Level \(chosenLevel+1)", fontSize: 24, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 340, zPos: 0)
        addImage(imageName: "button_move_up", name: "button_move_up", widthSize: 60, heightSize: 60, xPos: 0, yPos: -220, zPos: 0)
        addImage(imageName: "button_move_left", name: "button_move_left", widthSize: 60, heightSize: 60, xPos: -60, yPos: -280, zPos: 0)
        addImage(imageName: "button_pause", name: "button_pause", widthSize: 40, heightSize: 40, xPos: 0, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_right", name: "button_move_right", widthSize: 60, heightSize: 60, xPos: 60, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_down", name: "button_move_down", widthSize: 60, heightSize: 60, xPos: 0, yPos: -345, zPos: 0)
        
        arrangePuzzle(arrangingLevelNumber: chosenLevel)
        
        setUpSFXButton()
        setUpSFXStage()
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
                    if CoreDataManager.shared.playerCurrentSFXisOff == false {
                        soundSFXStage?.play()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        let rotationAction = SKAction.rotate(byAngle: CGFloat.pi / 2, duration: 0.3)
                        node.run(rotationAction)
                        
    //                    let desiredName = node.name ?? ""
    //                    checkPassable(levelNumber: currentLevel, exceptionalName: desiredName)
                    }
                }
            }
            
            if (node.name == "button_move_up") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXStage?.play()
                }
                
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
                
                checkWinCondition(checkingWinLevelNumber: chosenLevel)
            }
            else if (node.name == "button_move_left") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXStage?.play()
                }
                
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
                
                checkWinCondition(checkingWinLevelNumber: chosenLevel)
            }
            
            else if (node.name == "button_pause") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                makePausePopUp()
            }
            else if (node.name == "button_close") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                deletePausePopUp()
            }
            else if (node.name == "button_setting" || node.name == "label_setting") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                makeSettingPopUp()
                deletePausePopUp()
            }
            else if (node.name == "button_menu" || node.name == "label_menu") {
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
            else if (node.name == "button_back") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                deleteSettingPopUp()
                makePausePopUp()
            }
            else if (node.name == "button_bgm" || node.name == "label_bgm") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXButton?.play()
                }
                
                if CoreDataManager.shared.playerCurrentBGMisOff == false {
                    AudioManager.shared.stopBGM()
                    
                    bgmLabel.text = "BGM: OFF"
                    
                    CoreDataManager.shared.playerCurrentBGMisOff = true
                    CoreDataManager.shared.updateData()
                }
                else {
                    AudioManager.shared.playBGM()
                    
                    bgmLabel.text = "BGM: ON"
                    
                    CoreDataManager.shared.playerCurrentBGMisOff = false
                    CoreDataManager.shared.updateData()
                }
            }
            else if (node.name == "button_sfx" || node.name == "label_sfx") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    sfxLabel.text = "SFX: OFF"
                    
                    CoreDataManager.shared.playerCurrentSFXisOff = true
                    CoreDataManager.shared.updateData()
                }
                else {
                    soundSFXButton?.play()
                    
                    sfxLabel.text = "SFX: ON"
                    
                    CoreDataManager.shared.playerCurrentSFXisOff = false
                    CoreDataManager.shared.updateData()
                }
            }
            
            else if (node.name == "button_move_right") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXStage?.play()
                }
                
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
                
                checkWinCondition(checkingWinLevelNumber: chosenLevel)
            }
            else if (node.name == "button_move_down") {
                if CoreDataManager.shared.playerCurrentSFXisOff == false {
                    soundSFXStage?.play()
                }
                
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
                
                checkWinCondition(checkingWinLevelNumber: chosenLevel)
            }
            
        }
    }
}

//functions
extension StageController {
    
    func moveToFinishScene() {
        if CoreDataManager.shared.playerCurrentSFXisOff == false {
            soundSFXStage?.play()
        }
        
        if chosenLevel == CoreDataManager.shared.playerCurrentLevel {
            CoreDataManager.shared.playerCurrentLevel = chosenLevel + 1

            CoreDataManager.shared.updateData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if let nextScene = SKScene(fileNamed: "FinishScene") {
                self.scene?.scaleMode = .aspectFill
                self.scene?.view?.presentScene(nextScene)
            }
        }
    }
    
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
    
    func checkWinCondition(checkingWinLevelNumber: Int32) {
        switch checkingWinLevelNumber {
        case 0:
            if newCharacterX == -49 && newCharacterY == 98 {
                moveToFinishScene()
            }
            
        case 1:
            if newCharacterX == 49 && newCharacterY == 98 {
                moveToFinishScene()
            }
            
        case 2:
            if newCharacterX == 0 && newCharacterY == -49 {
                moveToFinishScene()
            }
            
        default:
            break
        }
    }
    
    /*
    func checkPassable(levelNumber: Int32, exceptionalName: String) {
        if let puzzleIndex = stagePuzzleAssets.firstIndex(where: { $0.puzzleAsset.name == exceptionalName }) {
            stagePuzzleAssets[puzzleIndex].puzzleDirection += 1

            if stagePuzzleAssets[puzzleIndex].puzzleDirection > 4 {
                stagePuzzleAssets[puzzleIndex].puzzleDirection = 1
            }

            switch levelNumber {
            case 0:
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

            case 1:
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
    */
    
}
