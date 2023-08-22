//
//  StageManager.swift
//  Thesis
//
//  Created by Reginald Lay on 05/06/23.
//

import Foundation
import SpriteKit

class StageManager: ConstructController {
    
    var stagePuzzleAssets: [(puzzleAsset: SKSpriteNode, puzzleDirection: Int, puzzleTrueDirection: Int, puzzleBoolDirection: Bool)] = []
    var stagePuzzleCharacter: SKSpriteNode? = nil
    
    func getCharacterPositionX() -> CGFloat {
        return stagePuzzleCharacter?.position.x ?? .zero
    }
    
    func getCharacterPositionY() -> CGFloat {
        return stagePuzzleCharacter?.position.y ?? .zero
    }
    
    func arrangePuzzle(arrangingLevelNumber: Int32) {
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
        case 0:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss19", xPos: 49, yPos: 0, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addCharacter(xPos: 49, yPos: 0)
            
        case 1:
            addPuzzle(puzzleName: "stage_shape_start", name: "ss10", xPos: -49, yPos: -49, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss16", xPos: -98, yPos: 0, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss17", xPos: -49, yPos: 0, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss23", xPos: -98, yPos: 49, rotatePuzzle: 3, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 4, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 1, trueDirection: 1, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 2, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addCharacter(xPos: -49, yPos: -49)
            
        case 2:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss24", xPos: -49, yPos: 49, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss26", xPos: 49, yPos: 49, rotatePuzzle: 4, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss40", xPos: 49, yPos: 147, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addCharacter(xPos: 49, yPos: 147)
            
        case 3:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss19", xPos: 49, yPos: 0, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss20", xPos: 98, yPos: 0, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss26", xPos: 49, yPos: 49, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss38", xPos: -49, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss43", xPos: -147, yPos: 196, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss44", xPos: -98, yPos: 196, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss45", xPos: -49, yPos: 196, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addCharacter(xPos: -147, yPos: 196)
            
        case 4:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss17", xPos: -49, yPos: 0, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 1, trueDirection: 1, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss19", xPos: 49, yPos: 0, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss20", xPos: 98, yPos: 0, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss21", xPos: 147, yPos: 0, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss24", xPos: -49, yPos: 49, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss28", xPos: 147, yPos: 49, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss35", xPos: 147, yPos: 98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss38", xPos: -49, yPos: 147, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss39", xPos: 0, yPos: 147, rotatePuzzle: 1, trueDirection: 1, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss40", xPos: 49, yPos: 147, rotatePuzzle: 4, trueDirection: 2, boolDirection: false)
            addCharacter(xPos: 147, yPos: 98)
            
        case 5:
            addPuzzle(puzzleName: "stage_shape_start", name: "ss2", xPos: -98, yPos: -98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss8", xPos: -147, yPos: -49, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_t", name: "ss9", xPos: -98, yPos: -49, rotatePuzzle: 4, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss10", xPos: -49, yPos: -49, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss15", xPos: -147, yPos: 0, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss17", xPos: -49, yPos: 0, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss22", xPos: -147, yPos: 49, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss29", xPos: -147, yPos: 98, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss36", xPos: -147, yPos: 147, rotatePuzzle: 4, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss37", xPos: -98, yPos: 147, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss38", xPos: -49, yPos: 147, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss39", xPos: 0, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addCharacter(xPos: -98, yPos: -98)
            
        case 6:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss17", xPos: -49, yPos: 0, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss19", xPos: 49, yPos: 0, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss23", xPos: -98, yPos: 49, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss24", xPos: -49, yPos: 49, rotatePuzzle: 3, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_t", name: "ss26", xPos: 49, yPos: 49, rotatePuzzle: 1, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss27", xPos: 98, yPos: 49, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss29", xPos: -147, yPos: 98, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 4, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 1, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss36", xPos: -147, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss38", xPos: -49, yPos: 147, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss39", xPos: 0, yPos: 147, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss43", xPos: -147, yPos: 196, rotatePuzzle: 4, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss44", xPos: -98, yPos: 196, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss45", xPos: -49, yPos: 196, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addCharacter(xPos: 98, yPos: 49)
            
        case 7:
            addPuzzle(puzzleName: "stage_shape_l", name: "ss9", xPos: -98, yPos: -49, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss10", xPos: -49, yPos: -49, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss11", xPos: 0, yPos: -49, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss15", xPos: -147, yPos: 0, rotatePuzzle: 1, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss16", xPos: -98, yPos: 0, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 1, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss22", xPos: -147, yPos: 49, rotatePuzzle: 2, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 1, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss26", xPos: 49, yPos: 49, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss29", xPos: -147, yPos: 98, rotatePuzzle: 4, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss37", xPos: -98, yPos: 147, rotatePuzzle: 1, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss39", xPos: 0, yPos: 147, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss40", xPos: 49, yPos: 147, rotatePuzzle: 3, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss44", xPos: -98, yPos: 196, rotatePuzzle: 1, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss45", xPos: -49, yPos: 196, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss46", xPos: 0, yPos: 196, rotatePuzzle: 3, trueDirection: 2, boolDirection: false)
            addCharacter(xPos: -49, yPos: 196)
            
        case 8:
            addPuzzle(puzzleName: "stage_shape_start", name: "ss11", xPos: 0, yPos: -49, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 2, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss31", xPos: -49, yPos: 98, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_plus", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss34", xPos: 98, yPos: 98, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss37", xPos: -98, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss39", xPos: 0, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss41", xPos: 98, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss44", xPos: -98, yPos: 196, rotatePuzzle: 1, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss45", xPos: -49, yPos: 196, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss46", xPos: 0, yPos: 196, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss47", xPos: 49, yPos: 196, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss48", xPos: 98, yPos: 196, rotatePuzzle: 4, trueDirection: 2, boolDirection: false)
            addCharacter(xPos: 0, yPos: -49)
            
        case 9:
            addPuzzle(puzzleName: "stage_shape_finish", name: "ss11", xPos: 0, yPos: -49, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss12", xPos: 49, yPos: -49, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss13", xPos: 98, yPos: -49, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss18", xPos: 0, yPos: 0, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss20", xPos: 98, yPos: 0, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss23", xPos: -98, yPos: 49, rotatePuzzle: 3, trueDirection: 4, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss24", xPos: -49, yPos: 49, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_t", name: "ss25", xPos: 0, yPos: 49, rotatePuzzle: 3, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss27", xPos: 98, yPos: 49, rotatePuzzle: 2, trueDirection: 2, boolDirection: true)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss30", xPos: -98, yPos: 98, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_t", name: "ss32", xPos: 0, yPos: 98, rotatePuzzle: 1, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss33", xPos: 49, yPos: 98, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss34", xPos: 98, yPos: 98, rotatePuzzle: 3, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss37", xPos: -98, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss39", xPos: 0, yPos: 147, rotatePuzzle: 1, trueDirection: 2, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_l", name: "ss44", xPos: -98, yPos: 196, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_long", name: "ss45", xPos: -49, yPos: 196, rotatePuzzle: 2, trueDirection: 3, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_t", name: "ss46", xPos: 0, yPos: 196, rotatePuzzle: 2, trueDirection: 1, boolDirection: false)
            addPuzzle(puzzleName: "stage_shape_start", name: "ss53", xPos: 0, yPos: 245, rotatePuzzle: 4, trueDirection: 4, boolDirection: true)
            addCharacter(xPos: 0, yPos: 245)
            
        default:
            break
        }
        
    }
    
    func addPuzzle(puzzleName: String, name: String, xPos: CGFloat, yPos: CGFloat, rotatePuzzle: Int, trueDirection: Int, boolDirection: Bool) {
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
        
        let puzzleTuple = (puzzleAsset: stagePuzzleAsset, puzzleDirection: rotatePuzzle, puzzleTrueDirection: trueDirection, puzzleBoolDirection: boolDirection)
        stagePuzzleAssets.append(puzzleTuple)
        
        addChild(stagePuzzleAsset)
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
            print("nil from addCharacter func StageManager.swift")
        }
    }
    
}
