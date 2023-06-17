//
//  CoreDataManager.swift
//  Thesis
//
//  Created by Reginald Lay on 12/06/23.
//

import CoreData
import Foundation
import SpriteKit
import UIKit

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer!
    let viewContext: NSManagedObjectContext!
    
    var playerCurrentBGM: Bool = true
    var playerCurrentLevel: Int32 = 0
    var playerCurrentSFX: Bool = true
    
    static let shared = CoreDataManager()
    
    init () {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        persistentContainer = appDelegate?.persistentContainer
        viewContext = persistentContainer.viewContext
    }
    
    func readData() -> Player {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        
        do {
            try print(persistentContainer.viewContext.fetch(fetchRequest))
            return try persistentContainer.viewContext.fetch(fetchRequest).last ?? Player(context: persistentContainer.viewContext)
        } catch {
            return Player(context: persistentContainer.viewContext)
        }
    }
    
    func saveData() {
        let player = Player(context: persistentContainer.viewContext)
        player.currentBGM = playerCurrentBGM
        player.currentLevel = playerCurrentLevel
        player.currentSFX = playerCurrentSFX
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save data \(error)")
        }
    }
    
    func deleteData() {
        guard let url = persistentContainer.persistentStoreDescriptions.first?.url
        else {
            return
        }

        let persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        
        do {
            try persistentStoreCoordinator.destroyPersistentStore(at: url, ofType: NSSQLiteStoreType, options: nil)
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            print("Attempted to clear persistent store: " + error.localizedDescription)
        }
    }
    
    func updateData() {
        deleteData()
        saveData()
    }
    
}
