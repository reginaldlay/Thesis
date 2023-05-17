//
//  PlayController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class PlayController: SKScene {
    
    override func didMove(to view: SKView) {
        addImage(imageName: "background_base", name: "background_base", widthSize: 390, heightSize: 844, xPos: 0, yPos: 0, zPos: -1)
        addImage(imageName: "background_header", name: "background_header", widthSize: 125, heightSize: 120, xPos: -132.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "background_subheader", name: "background_subheader", widthSize: 275, heightSize: 120, xPos: 57.5, yPos: 327.5, zPos: 0)
        addImage(imageName: "background_level_number", name: "background_level_number", widthSize: 200, heightSize: 120, xPos: 0, yPos: -44, zPos: 0)
        addImage(imageName: "button_previous", name: "button_previous", widthSize: 48, heightSize: 48, xPos: -135, yPos: -44, zPos: 0)
        addImage(imageName: "button_next", name: "button_next", widthSize: 48, heightSize: 48, xPos: 135, yPos: -44, zPos: 0)
        addLabel(fontName: "Futura Medium", name: "level_name", text: "Level 1", fontSize: 25, fontColor: .black, xAlignment: .center, xPos: 0, yPos: -50, zPos: 1)
        addLabel(fontName: "Futura Medium", name: "level_choose", text: "Choose your level!", fontSize: 32, fontColor: .black, xAlignment: .center, xPos: 0, yPos: 80, zPos: 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //TBC
    }
    
    func addImage(imageName: String, name: String, widthSize: CGFloat, heightSize: CGFloat, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let playAsset = SKSpriteNode(imageNamed: imageName)
        playAsset.name = name
        playAsset.size = CGSize(width: widthSize, height: heightSize)
        playAsset.position = CGPoint(x: xPos, y: yPos)
        playAsset.zPosition = zPos
        addChild(playAsset)
    }
    
    func addLabel(fontName: String, name: String, text: String, fontSize: CGFloat, fontColor: UIColor, xAlignment: SKLabelHorizontalAlignmentMode, xPos: CGFloat, yPos: CGFloat, zPos: CGFloat) {
        let playLabel = SKLabelNode(fontNamed: fontName)
        playLabel.name = name
        playLabel.text = text
        playLabel.fontSize = fontSize
        playLabel.fontColor = fontColor
        playLabel.horizontalAlignmentMode = xAlignment
        playLabel.position = CGPoint(x: xPos, y: yPos)
        playLabel.zPosition = zPos
        addChild(playLabel)
    }
    
}
