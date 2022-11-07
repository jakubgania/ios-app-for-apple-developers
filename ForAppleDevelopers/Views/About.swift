//
//  About.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 07.11.22.
//

import SwiftUI

struct About: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Technologies and Tools")
                    .padding(.top)
                    .font(.title.bold())
        
                Text("For Apple Developers")
                    .padding(.bottom)
        
                Text("About")
                    .font(.title2.bold())
        
                Text("A collection of various information and resources about the technologies and platforms used to develop applications for Apple devices.")
                    .font(.subheadline)
            }
            .padding()
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
