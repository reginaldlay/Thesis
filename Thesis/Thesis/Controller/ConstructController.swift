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
    
    //tutorial pop up
    let tutorialRectangle = SKShapeNode(rectOf: CGSize(width: 390, height: 844)) //z 2
    let tutorialCanvas = SKSpriteNode(imageNamed: "background_base")
    let tutorialCloseButton = SKSpriteNode(imageNamed: "button_close")
    let tutorialLabelTitle = SKLabelNode(fontNamed: "Futura Medium")
    let tutorialLabelStep1 = SKLabelNode(fontNamed: "Futura Medium")
    let tutorialImageStep1 = SKSpriteNode(imageNamed: "stage_character")
    let tutorialLabelStep2 = SKLabelNode(fontNamed: "Futura Medium")
    let tutorialImageStep2 = SKSpriteNode(imageNamed: "stage_shape_finish")
    let tutorialLabelStep3 = SKLabelNode(fontNamed: "Futura Medium")
    let tutorialImageStep3a = SKSpriteNode(imageNamed: "stage_shape_l")
    let tutorialImageStep3b = SKSpriteNode(imageNamed: "stage_shape_long")
    let tutorialImageStep3c = SKSpriteNode(imageNamed: "stage_shape_t")
    let tutorialImageStep3d = SKSpriteNode(imageNamed: "stage_shape_plus")
    let tutorialLabelStep4 = SKLabelNode(fontNamed: "Futura Medium")
    let tutorialImageStep4a = SKSpriteNode(imageNamed: "button_move_up")
    let tutorialImageStep4b = SKSpriteNode(imageNamed: "button_move_left")
    let tutorialImageStep4c = SKSpriteNode(imageNamed: "button_move_right")
    let tutorialImageStep4d = SKSpriteNode(imageNamed: "button_move_down")
    let tutorialLabelStep5 = SKLabelNode(fontNamed: "Futura Medium")
    let tutorialImageStep5 = SKSpriteNode(imageNamed: "button_pause")
    
    //pause pop up
    let pauseRectangle = SKShapeNode(rectOf: CGSize(width: 390, height: 844))
    let pauseCloseButton = SKSpriteNode(imageNamed: "button_close")
    let tutorialButton = SKSpriteNode(imageNamed: "button_stage_pause")
    let tutorialLabel = SKLabelNode(fontNamed: "Futura Medium")
    let settingButton = SKSpriteNode(imageNamed: "button_stage_pause")
    let settingLabel = SKLabelNode(fontNamed: "Futura Medium")
    let menuButton = SKSpriteNode(imageNamed: "button_stage_pause")
    let menuLabel = SKLabelNode(fontNamed: "Futura Medium")
    
    //setting pop up
    let settingRectangle = SKShapeNode(rectOf: CGSize(width: 390, height: 844))
    let settingBackButton = SKSpriteNode(imageNamed: "button_tutorial_back")
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
        pauseRectangle.fillColor = UIColor.gray.withAlphaComponent(0.9)
        addChild(pauseRectangle)
        
        pauseCloseButton.name = "button_close"
        pauseCloseButton.size = CGSize(width: 50, height: 50)
        pauseCloseButton.position = CGPoint(x: -140, y: 320)
        pauseCloseButton.zPosition = 3
        addChild(pauseCloseButton)
        
        tutorialButton.name = "button_tutorial"
        tutorialButton.size = CGSize(width: 200, height: 120)
        tutorialButton.position = CGPoint(x: 0, y: 180)
        tutorialButton.zPosition = 3
        addChild(tutorialButton)
        
        tutorialLabel.name = "label_tutorial"
        tutorialLabel.text = "Tutorial"
        tutorialLabel.fontSize = 28
        tutorialLabel.fontColor = .black
        tutorialLabel.horizontalAlignmentMode = .center
        tutorialLabel.position = CGPoint(x: 0, y: 173)
        tutorialLabel.zPosition = 4
        addChild(tutorialLabel)
        
        settingButton.name = "button_setting"
        settingButton.size = CGSize(width: 200, height: 120)
        settingButton.position = CGPoint(x: 0, y: 0)
        settingButton.zPosition = 3
        addChild(settingButton)
        
        settingLabel.name = "label_setting"
        settingLabel.text = "Setting"
        settingLabel.fontSize = 28
        settingLabel.fontColor = .black
        settingLabel.horizontalAlignmentMode = .center
        settingLabel.position = CGPoint(x: 0, y: -5)
        settingLabel.zPosition = 4
        addChild(settingLabel)
        
        menuButton.name = "button_menu"
        menuButton.size = CGSize(width: 200, height: 120)
        menuButton.position = CGPoint(x: 0, y: -180)
        menuButton.zPosition = 3
        addChild(menuButton)
        
        menuLabel.name = "label_menu"
        menuLabel.text = "Back to Menu"
        menuLabel.fontSize = 25
        menuLabel.fontColor = .black
        menuLabel.horizontalAlignmentMode = .center
        menuLabel.position = CGPoint(x: 0, y: -186)
        menuLabel.zPosition = 4
        addChild(menuLabel)
    }
    
    func deletePausePopUp() {
        pauseRectangle.removeFromParent()
        pauseCloseButton.removeFromParent()
        tutorialButton.removeFromParent()
        tutorialLabel.removeFromParent()
        menuButton.removeFromParent()
        menuLabel.removeFromParent()
        settingButton.removeFromParent()
        settingLabel.removeFromParent()
    }
    
    func makeTutorialPopUp() {
        tutorialRectangle.position = CGPoint(x: 0, y: 0)
        tutorialRectangle.zPosition = 2
        tutorialRectangle.fillColor = UIColor.gray.withAlphaComponent(0.9)
        addChild(tutorialRectangle)
        
        tutorialCanvas.size = CGSize(width: 330, height: 700)
        tutorialCanvas.position = CGPoint(x: 0, y: 0)
        tutorialCanvas.zPosition = 3
        addChild(tutorialCanvas)
        
        tutorialCloseButton.name = "button_tutorial_close"
        tutorialCloseButton.size = CGSize(width: 40, height: 40)
        tutorialCloseButton.position = CGPoint(x: -125, y: 310)
        tutorialCloseButton.zPosition = 4
        addChild(tutorialCloseButton)
        
        tutorialLabelTitle.text = "How to play?"
        tutorialLabelTitle.fontSize = 26
        tutorialLabelTitle.fontColor = .black
        tutorialLabelTitle.horizontalAlignmentMode = .center
        tutorialLabelTitle.position = CGPoint(x: 0, y: 240)
        tutorialLabelTitle.zPosition = 4
        addChild(tutorialLabelTitle)
        
        tutorialLabelStep1.text = "1. This is your cute ordinary ball!"
        tutorialLabelStep1.fontSize = 14
        tutorialLabelStep1.fontColor = .black
        tutorialLabelStep1.horizontalAlignmentMode = .center
        tutorialLabelStep1.position = CGPoint(x: 0, y: 180)
        tutorialLabelStep1.zPosition = 4
        addChild(tutorialLabelStep1)
        
        tutorialImageStep1.size = CGSize(width: 30, height: 30)
        tutorialImageStep1.position = CGPoint(x: 0, y: 150)
        tutorialImageStep1.zPosition = 4
        addChild(tutorialImageStep1)
        
        tutorialLabelStep2.text = "2. Bring the ball to finish square"
        tutorialLabelStep2.fontSize = 14
        tutorialLabelStep2.fontColor = .black
        tutorialLabelStep2.horizontalAlignmentMode = .center
        tutorialLabelStep2.position = CGPoint(x: 0, y: 100)
        tutorialLabelStep2.zPosition = 4
        addChild(tutorialLabelStep2)
        
        tutorialImageStep2.size = CGSize(width: 30, height: 30)
        tutorialImageStep2.position = CGPoint(x: 0, y: 70)
        tutorialImageStep2.zPosition = 4
        addChild(tutorialImageStep2)
        
        tutorialLabelStep3.text = "3. You can tap the bridge to connect them"
        tutorialLabelStep3.fontSize = 14
        tutorialLabelStep3.fontColor = .black
        tutorialLabelStep3.horizontalAlignmentMode = .center
        tutorialLabelStep3.position = CGPoint(x: 0, y: 20)
        tutorialLabelStep3.zPosition = 4
        addChild(tutorialLabelStep3)
        
        tutorialImageStep3a.size = CGSize(width: 30, height: 30)
        tutorialImageStep3a.position = CGPoint(x: -60, y: -10)
        tutorialImageStep3a.zPosition = 4
        addChild(tutorialImageStep3a)
        
        tutorialImageStep3b.size = CGSize(width: 30, height: 30)
        tutorialImageStep3b.position = CGPoint(x: -20, y: -10)
        tutorialImageStep3b.zPosition = 4
        addChild(tutorialImageStep3b)
        
        tutorialImageStep3c.size = CGSize(width: 30, height: 30)
        tutorialImageStep3c.position = CGPoint(x: 20, y: -10)
        tutorialImageStep3c.zPosition = 4
        addChild(tutorialImageStep3c)
        
        tutorialImageStep3d.size = CGSize(width: 30, height: 30)
        tutorialImageStep3d.position = CGPoint(x: 60, y: -10)
        tutorialImageStep3d.zPosition = 4
        addChild(tutorialImageStep3d)
        
        tutorialLabelStep4.text = "4. Move the ball by tapping the movement button"
        tutorialLabelStep4.fontSize = 13
        tutorialLabelStep4.fontColor = .black
        tutorialLabelStep4.horizontalAlignmentMode = .center
        tutorialLabelStep4.position = CGPoint(x: 0, y: -60)
        tutorialLabelStep4.zPosition = 4
        addChild(tutorialLabelStep4)
        
        tutorialImageStep4a.size = CGSize(width: 30, height: 30)
        tutorialImageStep4a.position = CGPoint(x: 0, y: -90)
        tutorialImageStep4a.zPosition = 4
        addChild(tutorialImageStep4a)
        
        tutorialImageStep4b.size = CGSize(width: 30, height: 30)
        tutorialImageStep4b.position = CGPoint(x: -30, y: -120)
        tutorialImageStep4b.zPosition = 4
        addChild(tutorialImageStep4b)
        
        tutorialImageStep4c.size = CGSize(width: 30, height: 30)
        tutorialImageStep4c.position = CGPoint(x: 30, y: -120)
        tutorialImageStep4c.zPosition = 4
        addChild(tutorialImageStep4c)
        
        tutorialImageStep4d.size = CGSize(width: 30, height: 30)
        tutorialImageStep4d.position = CGPoint(x: 0, y: -150)
        tutorialImageStep4d.zPosition = 4
        addChild(tutorialImageStep4d)
        
        tutorialLabelStep5.text = "5. Find me again in here ^^"
        tutorialLabelStep5.fontSize = 14
        tutorialLabelStep5.fontColor = .black
        tutorialLabelStep5.horizontalAlignmentMode = .center
        tutorialLabelStep5.position = CGPoint(x: 0, y: -200)
        tutorialLabelStep5.zPosition = 4
        addChild(tutorialLabelStep5)
        
        tutorialImageStep5.size = CGSize(width: 30, height: 30)
        tutorialImageStep5.position = CGPoint(x: 0, y: -230)
        tutorialImageStep5.zPosition = 4
        addChild(tutorialImageStep5)
    }
    
    func deleteTutorialPopUp() {
        tutorialRectangle.removeFromParent()
        tutorialCanvas.removeFromParent()
        tutorialCloseButton.removeFromParent()
        tutorialLabelTitle.removeFromParent()
        tutorialLabelStep1.removeFromParent()
        tutorialImageStep1.removeFromParent()
        tutorialLabelStep2.removeFromParent()
        tutorialImageStep2.removeFromParent()
        tutorialLabelStep3.removeFromParent()
        tutorialImageStep3a.removeFromParent()
        tutorialImageStep3b.removeFromParent()
        tutorialImageStep3c.removeFromParent()
        tutorialImageStep3d.removeFromParent()
        tutorialLabelStep4.removeFromParent()
        tutorialImageStep4a.removeFromParent()
        tutorialImageStep4b.removeFromParent()
        tutorialImageStep4c.removeFromParent()
        tutorialImageStep4d.removeFromParent()
        tutorialLabelStep5.removeFromParent()
        tutorialImageStep5.removeFromParent()
    }
    
    func makeSettingPopUp() {
        settingRectangle.position = CGPoint(x: 0, y: 0)
        settingRectangle.zPosition = 2
        settingRectangle.fillColor = UIColor.gray.withAlphaComponent(0.9)
        addChild(settingRectangle)
        
        settingBackButton.name = "button_back"
        settingBackButton.size = CGSize(width: 55, height: 50)
        settingBackButton.position = CGPoint(x: -140, y: 320)
        settingBackButton.zPosition = 3
        addChild(settingBackButton)
        
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
        bgmLabel.fontColor = .white
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
        sfxLabel.fontColor = .white
        sfxLabel.horizontalAlignmentMode = .center
        sfxLabel.position = CGPoint(x: 0, y: -108)
        sfxLabel.zPosition = 4
        addChild(sfxLabel)
        
        showCopyright(zPos: 3)
    }
    
    func deleteSettingPopUp() {
        settingRectangle.removeFromParent()
        settingBackButton.removeFromParent()
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
        settingBGMLabel.fontColor = .white
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
        settingSFXLabel.fontColor = .white
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
