//
//  Row.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 07.11.22.
//

import SwiftUI

struct Row: View {
    var developer: Developer
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(developer.name)
                    .padding(.bottom, 0.2)
                    .font(.title3.bold())
                
                Text("Read more")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var developers = ModelData().developers
    
    static var previews: some View {
        Row(developer: developers[0])
    }
}
