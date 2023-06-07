//
//  StageManager.swift
//  Thesis
//
//  Created by Reginald Lay on 05/06/23.
//

import Foundation
import SpriteKit

class StageManager: ConstructController {
    
    var stagePuzzleAssets: [SKSpriteNode] = []
    var stagePuzzleCharacter: SKSpriteNode? = nil
    
    func arrangePuzzle(arrangingLevelNumber: Int) {
        /*
         
         245  [50]   [51]   [52]   [53]   [54]   [55]   [56]
         196  [43]   [44]   [45]   [46]   [47]   [48]   [49]
         147  [36]   [37]   [38]   [39]   [40]   [41]   [42]
          98  [29]   [30]   [31]   [32]   [33]   [34]   [35]
          49  [22]   [23]   [24]   [25]   [26]   [27]   [28]
           0  [15]   [16]   [17]   [18]   [19]   [20]   [21]
         -49  [08]   [09]   [10]   [11]   [12]   [13]   [14]
         -98  [01]   [02]   [03]   [04]   [05]   [06]   [07]
              -147   -98    -49     0      49     98    147
         */
        
        switch arrangingLevelNumber {
        case 1:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 2)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss19", xPos: 49, yPos: 0, rotatePuzzle: 4)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 1)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 4)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 1)
            addCharacter(xPos: 49, yPos: 0)
            
        case 2:
            addPuzzle(puzzleName: "stage_shape_start", name: "ss10", xPos: -49, yPos: -49, rotatePuzzle: 4)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss17", xPos: -49, yPos: 0, rotatePuzzle: 1)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss16", xPos: -98, yPos: 0, rotatePuzzle: 2)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss23", xPos: -98, yPos: 49, rotatePuzzle: 3)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 4)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 1)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 2)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 4)
            addCharacter(xPos: -49, yPos: -49)
            
        default:
            break
        }
        
    }
    
    func addPuzzle(puzzleName: String, name: String, xPos: CGFloat, yPos: CGFloat, rotatePuzzle: Int) {
        let stagePuzzleAsset = SKSpriteNode(imageNamed: puzzleName)
        stagePuzzleAsset.name = name
        stagePuzzleAsset.size = CGSize(width: 49, height: 49)
        stagePuzzleAsset.position = CGPoint(x: xPos, y: yPos)
        stagePuzzleAsset.zPosition = 0
        
        //1 = 90, 2 = 180, 3 = 270, 4 = 360
        let rotationAction = SKAction.rotate(byAngle: CGFloat.pi / 2, duration: 0.5)
        for _ in 1...rotatePuzzle {
            stagePuzzleAsset.run(rotationAction)
        }
        
        addChild(stagePuzzleAsset)
        stagePuzzleAssets.append(stagePuzzleAsset)
    }
    
    func addCharacter(xPos: CGFloat, yPos: CGFloat) {
        stagePuzzleCharacter = SKSpriteNode(imageNamed: "stage_character")
        stagePuzzleCharacter?.name = "stage_character"
        stagePuzzleCharacter?.size = CGSize(width: 27, height: 27)
        stagePuzzleCharacter?.position = CGPoint(x: xPos, y: yPos)
        stagePuzzleCharacter?.zPosition = 1
        
        if let puzzleCharacter = stagePuzzleCharacter {
            addChild(puzzleCharacter)
        }
        else {
            print("nil")
        }
    }
    
}
