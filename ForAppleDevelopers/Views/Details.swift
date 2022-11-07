//
//  Details.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 07.11.22.
//

import SwiftUI

struct Details: View {
    @EnvironmentObject var modelData: ModelData
    var developer: Developer
    
//    let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)

    var host: String {
        let str = developer.externalURL
        let url = URL(string: str)
        return url?.host() ?? "none"
    }
    
    var gallerySection: Bool {
//        return developer.images != nil ? true : false
        return developer.images != nil
    }
    
    var body: some View {
        ScrollView {
            Text(developer.name)
                .font(.title.bold())
                .frame(maxWidth: .infinity, minHeight: 200)
                .background(.white)
            
            VStack(alignment: .leading) {
                Text("Description")
                
                Text(developer.description)
                    .padding(.top)
                    .padding(.bottom)
                
                Divider()
                
                if gallerySection {
                    Text("Gallery")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach((developer.images)!, id: \.self ) { item in
                                VStack(alignment: .leading) {
                                    Image(item)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.trailing)
                                        .frame(height: 160)
                                    
                                    Text("Source: Apple")
//                                        .foregroundColor(.gray)
                                        .font(.caption)
                                }
                                
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Divider()
                }
                
                Text("External URL")
                    .padding(.top)
                
                Text("You can read more on the website below.")
                    .padding(.bottom)
                
                HStack {
                    Link("View this link", destination: URL(string: developer.externalURL)!)
                    Image(systemName: "link")
                        .symbolRenderingMode(.multicolor)
                }
                
                Text(host)
                    .padding(.top, 1)
                    .font(.subheadline)
                    .foregroundColor(.gray)

            }
            .padding(.leading)
            .padding(.trailing)
                
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Details_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Details(developer: modelData.developers[0])
            .environmentObject(modelData)
    }
}
