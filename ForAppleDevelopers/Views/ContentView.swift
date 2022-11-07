//
//  ContentView.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 06.11.22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .technologies
    
    enum Tab {
        case technologies
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Technologies", systemImage: "list.dash")
                }
                .tag(Tab.technologies)
            
            About()
                .tabItem {
                    Label("About", systemImage: "info.circle.fill")
                }
                .tag(Tab.list)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
