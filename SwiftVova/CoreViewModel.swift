//
//  CoreViewModel.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import Foundation
import CoreData
class CoreViewModel:ObservableObject{
    @Published var productsCoreArray: [CoreViewStruct] = []
    
    func fetchData(){
        productsCoreArray = CoreDataManager.shared.fetch().map(CoreViewStruct.init)
    }
    func delete(product:CoreViewStruct){
        let existonProduct = CoreDataManager.shared.fetchProductForID(id: product.id)
        if let existonProduct = existonProduct {
            CoreDataManager.shared.delete(product: existonProduct)
        }
    }
}
struct CoreViewStruct{
    let product: Product
    var title:String{
        return product.title ?? ""
    }
    var brand:String{
        return product.brand ?? ""
    }
    var imageUrl:String{
        return product.image ?? ""
    }
    
    var id:NSManagedObjectID{
        return product.objectID
    }
}
