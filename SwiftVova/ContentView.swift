//
//  ContentView.swift
//  SwiftVova
//
//  Created by Артур Шестаков on 08.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ApiView().tabItem {
                Image(systemName: "house")
                Text("Api")
            }
            CoreDataView().tabItem {
                Image(systemName: "house")
                Text("CoreData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
