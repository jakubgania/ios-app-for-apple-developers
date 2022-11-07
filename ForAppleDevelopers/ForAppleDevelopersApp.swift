//
//  ForAppleDevelopersApp.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 06.11.22.
//

import SwiftUI

@main
struct ForAppleDevelopersApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
