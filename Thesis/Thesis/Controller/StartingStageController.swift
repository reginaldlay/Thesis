//
//  StartingStageController.swift
//  Thesis
//
//  Created by Reginald Lay on 10/05/23.
//

import SpriteKit
import GameplayKit

class StartingStageController: SKScene {
    
    override func didMove(to view: SKView) {
        let startingStageAsset = SKSpriteNode(imageNamed: "background_base")
        startingStageAsset.name = "background_base"
        startingStageAsset.size = CGSize(width: 390, height: 844)
        startingStageAsset.position = CGPoint(x: 0, y: 0)
        startingStageAsset.zPosition = -1
        addChild(startingStageAsset)
        
        let startingStageLabel = SKLabelNode(fontNamed: "Futura Medium")
        startingStageLabel.name = "label_level"
        startingStageLabel.text = "Level 1"
        startingStageLabel.fontSize = 30
        startingStageLabel.fontColor = .black
        startingStageLabel.horizontalAlignmentMode = .center
        startingStageLabel.position = CGPoint(x: 0, y: 0)
        startingStageLabel.zPosition = 0
        addChild(startingStageLabel)
    }
    
}
