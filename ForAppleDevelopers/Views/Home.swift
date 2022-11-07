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
                Section {
                    Text("List of technologies and tools.")
                    Text("Read more by clicking on the list item!")
                }
                ForEach(modelData.developers) { item in
                    NavigationLink {
                        Details(developer: item)
                    } label: {
                        Row(developer: item)
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ModelData())
    }
}
