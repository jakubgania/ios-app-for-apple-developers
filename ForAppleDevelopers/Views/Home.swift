//
//  Home.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 07.11.22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelData.developers) { item in
                    NavigationLink {
                        Details(developer: item)
                    } label: {
                        Row(developer: item)
                    }
                }
            }
            .navigationTitle("Topics")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ModelData())
    }
}
