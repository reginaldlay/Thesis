//
//  ConstructController.swift
//  Thesis
//
//  Created by Reginald Lay on 06/06/23.
//

import AVFoundation
import Foundation
import SpriteKit

class ConstructController: SKScene {
    
    //pause pop up
    let pauseRectangle = SKShapeNode(rectOf: CGSize(width: 390, height: 844))
    let closeButton = SKSpriteNode(imageNamed: "button_close")
    let settingButton = SKSpriteNode(imageNamed: "button_stage_pause")
    let settingLabel = SKLabelNode(fontNamed: "Futura Medium")
    let menuButton = SKSpriteNode(imageNamed: "button_stage_pause")
    let menuLabel = SKLabelNode(fontNamed: "Futura Medium")
    
    //setting pop up
    let settingRectangle = SKShapeNode(rectOf: CGSize(width: 390, height: 844))
    let backButton = SKSpriteNode(imageNamed: "button_back")
    let bgmButton = SKSpriteNode(imageNamed: "button_landing")
    let bgmLabel = SKLabelNode(fontNamed: "Futura Medium")
    let sfxButton = SKSpriteNode(imageNamed: "button_stage_pause")
    let sfxLabel = SKLabelNode(fontNamed: "Futura Medium")
    
    //setting page
    let settingBGMLabel = SKLabelNode(fontNamed: "Futura Medium")
    let settingSFXLabel = SKLabelNode(fontNamed: "Futura Medium")
    
    //copyright
    let cr1 = SKLabelNode(fontNamed: "Futura Medium")
    let cr2 = SKLabelNode(fontNamed: "Futura Medium")
    
    //audio
    var soundSFXButton: AVAudioPlayer?
    var soundSFXStage: AVAudioPlayer?
    
    func examine() {
        print("CDM.s.playerChosenLevel = \(CoreDataManager.shared.playerChosenLevel)")
        print("CDM.s.rD.chosenLevel = \(CoreDataManager.shared.readData().chosenLevel)")
        print("CDM.s.playerCurrentLevel = \(CoreDataManager.shared.playerCurrentLevel)")
        print("CDM.s.rD.currentLevel = \(CoreDataManager.shared.readData().currentLevel)")
        print("CDM.s.playerCurrentBGMisOff = \(CoreDataManager.shared.playerCurrentBGMisOff)")
        print("CDM.s.rD.currentBGMisOff = \(CoreDataManager.shared.readData().currentBGMisOff)")
        print("CDM.s.playerCurrentSFXisOff = \(CoreDataManager.shared.playerCurrentSFXisOff)")
        print("CDM.s.rD.currentSFXisOff = \(CoreDataManager.shared.readData().currentSFXisOff)")
        print("====================================================================================")
    }
    
    func readPlayerData() {
        CoreDataManager.shared.playerChosenLevel = CoreDataManager.shared.readData().currentLevel
        CoreDataManager.shared.playerCurrentLevel = CoreDataManager.shared.readData().currentLevel
        CoreDataManager.shared.playerCurrentBGMisOff = CoreDataManager.shared.readData().currentBGMisOff
        CoreDataManager.shared.playerCurrentSFXisOff = CoreDataManager.shared.readData().currentSFXisOff
    }
    
    func addImage(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let sceneImage = SKSpriteNode(imageNamed: imageName)
        sceneImage.name = name
        sceneImage.size = CGSize(width: widthSize, height: heightSize)
        sceneImage.position = CGPoint(x: xPos, y: yPos)
        sceneImage.zPosition = zPos
        addChild(sceneImage)
    }
    
    func addLabel(fontName: String, name: String, text: String, fontSize: CGFloat, fontColor: UIColor, xAlignment: SKLabelHorizontalAlignmentMode, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let sceneLabel = SKLabelNode(fontNamed: fontName)
        sceneLabel.name = name
        sceneLabel.text = text
        sceneLabel.fontSize = fontSize
        sceneLabel.fontColor = fontColor
        sceneLabel.horizontalAlignmentMode = xAlignment
        sceneLabel.position = CGPoint(x: xPos, y: yPos)
        sceneLabel.zPosition = zPos
        addChild(sceneLabel)
    }
    
    func makePausePopUp() {
        pauseRectangle.position = CGPoint(x: 0, y: 0)
        pauseRectangle.zPosition = 2
        pauseRectangle.fillColor = UIColor.gray.withAlphaComponent(0.7)
        addChild(pauseRectangle)
        
        closeButton.name = "button_close"
        closeButton.size = CGSize(width: 50, height: 50)
        closeButton.position = CGPoint(x: -140, y: 320)
        closeButton.zPosition = 3
        addChild(closeButton)
        
        settingButton.name = "button_setting"
        settingButton.size = CGSize(width: 200, height: 120)
        settingButton.position = CGPoint(x: 0, y: 100)
        settingButton.zPosition = 3
        addChild(settingButton)
        
        settingLabel.name = "label_setting"
        settingLabel.text = "Setting"
        settingLabel.fontSize = 30
        settingLabel.fontColor = .black
        settingLabel.horizontalAlignmentMode = .center
        settingLabel.position = CGPoint(x: 0, y: 94)
        settingLabel.zPosition = 4
        addChild(settingLabel)
        
        menuButton.name = "button_menu"
        menuButton.size = CGSize(width: 200, height: 120)
        menuButton.position = CGPoint(x: 0, y: -101)
        menuButton.zPosition = 3
        addChild(menuButton)
        
        menuLabel.name = "label_menu"
        menuLabel.text = "Back to Menu"
        menuLabel.fontSize = 26
        menuLabel.fontColor = .black
        menuLabel.horizontalAlignmentMode = .center
        menuLabel.position = CGPoint(x: 0, y: -105)
        menuLabel.zPosition = 4
        addChild(menuLabel)
    }
    
    func deletePausePopUp() {
        pauseRectangle.removeFromParent()
        closeButton.removeFromParent()
        menuButton.removeFromParent()
        menuLabel.removeFromParent()
        settingButton.removeFromParent()
        settingLabel.removeFromParent()
    }
    
    func makeSettingPopUp() {
        settingRectangle.position = CGPoint(x: 0, y: 0)
        settingRectangle.zPosition = 2
        settingRectangle.fillColor = UIColor.gray.withAlphaComponent(0.7)
        addChild(settingRectangle)
        
        backButton.name = "button_back"
        backButton.size = CGSize(width: 55, height: 50)
        backButton.position = CGPoint(x: -140, y: 320)
        backButton.zPosition = 3
        addChild(backButton)
        
        bgmButton.name = "button_bgm"
        bgmButton.size = CGSize(width: 200, height: 120)
        bgmButton.position = CGPoint(x: 0, y: 100)
        bgmButton.zPosition = 3
        addChild(bgmButton)
        
        bgmLabel.name = "label_bgm"
        if CoreDataManager.shared.playerCurrentBGMisOff == false {
            bgmLabel.text = "BGM: ON"
        }
        else {
            bgmLabel.text = "BGM: OFF"
        }
        bgmLabel.fontSize = 30
        bgmLabel.fontColor = .black
        bgmLabel.horizontalAlignmentMode = .center
        bgmLabel.position = CGPoint(x: 0, y: 94)
        bgmLabel.zPosition = 4
        addChild(bgmLabel)
        
        sfxButton.name = "button_sfx"
        sfxButton.size = CGSize(width: 200, height: 120)
        sfxButton.position = CGPoint(x: 0, y: -100)
        sfxButton.zPosition = 3
        addChild(sfxButton)
        
        sfxLabel.name = "label_sfx"
        if CoreDataManager.shared.playerCurrentSFXisOff == false {
            sfxLabel.text = "SFX: ON"
        }
        else {
            sfxLabel.text = "SFX: OFF"
        }
        sfxLabel.fontSize = 30
        sfxLabel.fontColor = .black
        sfxLabel.horizontalAlignmentMode = .center
        sfxLabel.position = CGPoint(x: 0, y: -108)
        sfxLabel.zPosition = 4
        addChild(sfxLabel)
        
        showCopyright(zPos: 3)
    }
    
    func deleteSettingPopUp() {
        settingRectangle.removeFromParent()
        backButton.removeFromParent()
        bgmButton.removeFromParent()
        bgmLabel.removeFromParent()
        sfxButton.removeFromParent()
        sfxLabel.removeFromParent()
        deleteCopyright()
    }
    
    func setUpSFXButton() {
        let audioPathButton = Bundle.main.path(forResource: "SFX_button", ofType: "mp3")
        let audioURLButton = URL(fileURLWithPath: audioPathButton!)
        do {
            soundSFXButton = try AVAudioPlayer(contentsOf: audioURLButton)
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
        soundSFXButton?.prepareToPlay()
    }
    
    func setUpSFXStage() {
        let soundURLStage = Bundle.main.url(forResource: "SFX_stage", withExtension: "mp3")
        do {
            soundSFXStage = try AVAudioPlayer(contentsOf: soundURLStage!)
            soundSFXStage?.prepareToPlay()
        }
        catch {
            print("Failed to load sound: \(error.localizedDescription)")
        }
    }
    
    func showAchievement() {
        if CoreDataManager.shared.playerCurrentLevel >= 1 {
            addImage(imageName: "achievement_unlocked_1", name: "achievement_unlocked_1", widthSize: 70, heightSize: 110, xPos: -109, yPos: 80, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_1", name: "achievement_locked_1", widthSize: 70, heightSize: 110, xPos: -109, yPos: 80, zPos: 0)
        }
        
        if CoreDataManager.shared.playerCurrentLevel >= 10 {
            addImage(imageName: "achievement_unlocked_10", name: "achievement_unlocked_10", widthSize: 86, heightSize: 110, xPos: 0, yPos: 80, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_10", name: "achievement_locked_10", widthSize: 86, heightSize: 110, xPos: 0, yPos: 80, zPos: 0)
        }
        
        if CoreDataManager.shared.playerCurrentLevel >= 50 {
            addImage(imageName: "achievement_unlocked_50", name: "achievement_unlocked_50", widthSize: 87, heightSize: 110, xPos: 109, yPos: 80, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_50", name: "achievement_locked_50", widthSize: 87, heightSize: 110, xPos: 109, yPos: 80, zPos: 0)
        }
        
        if CoreDataManager.shared.playerCurrentLevel >= 100 {
            addImage(imageName: "achievement_unlocked_100", name: "achievement_unlocked_100", widthSize: 92, heightSize: 110, xPos: -109, yPos: -50, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_100", name: "achievement_locked_100", widthSize: 92, heightSize: 110, xPos: -109, yPos: -50, zPos: 0)
        }
        
        if CoreDataManager.shared.playerCurrentLevel >= 300 {
            addImage(imageName: "achievement_unlocked_300", name: "achievement_unlocked_300", widthSize: 94, heightSize: 110, xPos: 0, yPos: -50, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_300", name: "achievement_locked_300", widthSize: 94, heightSize: 110, xPos: 0, yPos: -50, zPos: 0)
        }
        
        if CoreDataManager.shared.playerCurrentLevel >= 500 {
            addImage(imageName: "achievement_unlocked_500", name: "achievement_unlocked_500", widthSize: 93, heightSize: 110, xPos: 109, yPos: -50, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_500", name: "achievement_locked_500", widthSize: 93, heightSize: 110, xPos: 109, yPos: -50, zPos: 0)
        }
        
        if CoreDataManager.shared.playerCurrentLevel >= 1000 {
            addImage(imageName: "achievement_unlocked_1000", name: "achievement_unlocked_1000", widthSize: 98, heightSize: 110, xPos: -109, yPos: -180, zPos: 0)
        }
        else {
            addImage(imageName: "achievement_locked_1000", name: "achievement_locked_1000", widthSize: 98, heightSize: 110, xPos: -109, yPos: -180, zPos: 0)
        }
    }
    
    func showSettingLabel() {
        settingBGMLabel.name = "label_bgm"
        if CoreDataManager.shared.playerCurrentBGMisOff == false {
            settingBGMLabel.text = "BGM: ON"
        }
        else {
            settingBGMLabel.text = "BGM: OFF"
        }
        settingBGMLabel.fontSize = 30
        settingBGMLabel.color = .black
        settingBGMLabel.horizontalAlignmentMode = .center
        settingBGMLabel.position = CGPoint(x: 0, y: 94)
        settingBGMLabel.zPosition = 1
        addChild(settingBGMLabel)
        
        settingSFXLabel.name = "label_sfx"
        if CoreDataManager.shared.playerCurrentSFXisOff == false {
            settingSFXLabel.text = "SFX: ON"
        }
        else {
            settingSFXLabel.text = "SFX: OFF"
        }
        settingSFXLabel.fontSize = 30
        settingSFXLabel.color = .black
        settingSFXLabel.horizontalAlignmentMode = .center
        settingSFXLabel.position = CGPoint(x: 0, y: -108)
        settingSFXLabel.zPosition = 1
        addChild(settingSFXLabel)
    }
    
    func showCopyright(zPos: CGFloat) {
        cr1.text = "Thank you for Onycs for making this wonderful music"
        cr1.fontSize = 12
        cr1.fontColor = .black
        cr1.horizontalAlignmentMode = .center
        cr1.position = CGPoint(x: 0, y: -330)
        cr1.zPosition = zPos
        addChild(cr1)
        
        cr2.text = "BGM: Dreamcatcher by Onycs"
        cr2.fontSize = 12
        cr2.fontColor = .black
        cr2.horizontalAlignmentMode = .center
        cr2.position = CGPoint(x: 0, y: -350)
        cr2.zPosition = zPos
        addChild(cr2)
    }
    
    func deleteCopyright() {
        cr1.removeFromParent()
        cr2.removeFromParent()
    }
    
}
