//
//  ApiView.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import SwiftUI

struct ApiView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.productArray,id: \.id){
                    product in
                    HStack{
                        AsyncImage(url: URL(string: product.images[0])){
                            image in
                            image.resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxWidth:100,
                                maxHeight: 100)
                        }placeholder: {
                            Text("Loading")
                        }
                        Text("\(product.title)")
                        Button("Save"){
                            viewModel.save(product: product)
                        }
                    }
                    Text("\(product.brand)")
                }
            }
        }
        .padding()
        .task {
            do{
                try await viewModel.fetchApi()
            }catch{
                fatalError("\(error.localizedDescription)")
            }
        }
    }
}

struct ApiView_Previews: PreviewProvider {
    static var previews: some View {
        ApiView()
    }
}
