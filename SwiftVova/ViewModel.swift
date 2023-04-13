//
//  ViewModel.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import Foundation
class ViewModel:ObservableObject{
    let url = URL(string: "https://dummyjson.com/products")!
    @Published var productArray:[Products] = []
    func fetchApi() async throws {
     
            let (data,response) = try await URLSession.shared.data(from: url)
        let responses = try JSONDecoder().decode(ProductArrays.self, from: data)
        self.productArray = responses.products
        
    }
    func save(product:Products){
        let producte = Product(context: CoreDataManager.shared.viewContext)
        producte.title = product.title
        producte.brand = product.brand
        producte.image = product.images[0]
        CoreDataManager.shared.save()
    }
  
}

