//
//  ConstructController.swift
//  Thesis
//
//  Created by Reginald Lay on 06/06/23.
//

import Foundation
import SpriteKit

class ConstructController: SKScene {
    
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
    
}
