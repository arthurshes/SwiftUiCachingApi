//
//  ProductModel.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import Foundation
struct ProductArrays:Decodable{
    let products:[Products]
}
struct Products:Identifiable,Decodable{
    let id:Int
    let title:String
    let brand:String
    let images:[String]
}
