//
//  CoreDataManager.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import Foundation
import CoreData
class CoreDataManager{
    static let shared = CoreDataManager()
    let container:NSPersistentContainer
    var viewContext:NSManagedObjectContext{
        return container.viewContext
    }
    private init(){
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("error container \(error)")
            }
        }
    }
    func save(){
        do{
           try viewContext.save()
        }catch{
            viewContext.rollback()
            fatalError("error save \(error.localizedDescription)")
        }
    }
    
    func fetch()->[Product]{
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        do{
            return try viewContext.fetch(request)
        }catch{
            fatalError("error fetch \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchProductForID(id:NSManagedObjectID)->Product?{
        do{
            return try viewContext.existingObject(with: id) as? Product
        }catch{
            return nil
        }
    }
    
    func delete(product:Product){
        viewContext.delete(product)
        save()
    }
}
