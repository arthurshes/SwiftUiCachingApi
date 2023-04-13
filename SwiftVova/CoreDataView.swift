//
//  CoreDataView.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import SwiftUI

struct CoreDataView: View {
    @StateObject private var viewModel = CoreViewModel()
    private func delete(at indexSet:IndexSet){
        indexSet.forEach { index in
            let deleteProd = viewModel.productsCoreArray[index]
            viewModel.delete(product: deleteProd)
        }
        viewModel.fetchData()
    }
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.productsCoreArray,id: \.id){
                    product in
                    HStack{
                        AsyncImage(url: URL(string: product.imageUrl)){
                            image in
                            image.resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxWidth:100,
                                       maxHeight: 100)
                        }placeholder: {
                            Text("Loading")
                        }
                        Text("\(product.title)")
                    }
                    Text("\(product.brand)")
                }
                .onDelete(perform: delete)
            }
        }.onAppear(perform: viewModel.fetchData)
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
