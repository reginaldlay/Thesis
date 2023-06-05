//
//  StageController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class StageController: StageManager {
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addLabel(fontName: "Futura Medium", name: "label_title", text: "Level 1", fontSize: 24, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 340, zPos: 0)
        addImage(imageName: "button_move_up", name: "button_move_up", widthSize: 60, heightSize: 60, xPos: 0, yPos: -220, zPos: 0)
        addImage(imageName: "button_move_left", name: "button_move_left", widthSize: 60, heightSize: 60, xPos: -60, yPos: -280, zPos: 0)
        addImage(imageName: "button_pause", name: "button_pause", widthSize: 40, heightSize: 40, xPos: 0, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_right", name: "button_move_right", widthSize: 60, heightSize: 60, xPos: 60, yPos: -280, zPos: 0)
        addImage(imageName: "button_move_down", name: "button_move_down", widthSize: 60, heightSize: 60, xPos: 0, yPos: -345, zPos: 0)
        
        arrangePuzzle(levelNumber: 1)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            for index in 1...56 {
                if node.name == "ss\(index)" {
                    let rotationAction = SKAction.rotate(byAngle: CGFloat.pi / 2, duration: 0.5)
                    node.run(rotationAction)
                }
            }
            
            if (node.name == "button_move_up") {
                //
            }
            else if (node.name == "button_move_left") {
                //
            }
            else if (node.name == "button_pause") {
                //
            }
            else if (node.name == "button_move_right") {
                //
            }
            else if (node.name == "button_move_down") {
                //
            }
            
        }
    }
    
    func addImage(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let stageAsset = SKSpriteNode(imageNamed: imageName)
        stageAsset.name = name
        stageAsset.size = CGSize(width: widthSize, height: heightSize)
        stageAsset.position = CGPoint(x: xPos, y: yPos)
        stageAsset.zPosition = zPos
        addChild(stageAsset)
    }
    
    func addLabel(fontName: String, name: String, text: String, fontSize: CGFloat, fontColor: UIColor, xAlignment: SKLabelHorizontalAlignmentMode, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let stageLabel = SKLabelNode(fontNamed: fontName)
        stageLabel.name = name
        stageLabel.text = text
        stageLabel.fontSize = fontSize
        stageLabel.fontColor = fontColor
        stageLabel.horizontalAlignmentMode = xAlignment
        stageLabel.position = CGPoint(x: xPos, y: yPos)
        stageLabel.zPosition = zPos
        addChild(stageLabel)
    }
}
