//
//  CoreDataImpl.swift
//  Expense Adjuster
//
//  Created by Егор Михайлов on 11.01.2023.
//

import Foundation
import CoreData


class CoreDataImpl: Codable{
    private let modelName: String
    
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores{_, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    
    func saveContext(){
        guard managedContext.hasChanges else {return}
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
