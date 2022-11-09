//
//  Details.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 07.11.22.
//

import SwiftUI
import LinkPresentation

struct Details: View {
    @EnvironmentObject var modelData: ModelData
    var developer: Developer

    var host: String {
        let str = developer.externalURL
        let url = URL(string: str)
        return url?.host() ?? "none"
    }
    
    var gallerySection: Bool {
        return developer.images != nil
    }
    
    @State var isShown = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                if isShown {
                    Text(developer.name)
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .background(.white)
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 1).delay(0.32), value: isShown)
            .onAppear() {
                self.isShown.toggle()
            }
                
            
            VStack(alignment: .leading) {
                Text("Description")
                    .bold()
                
                Text(developer.description)
                    .padding(.top)
                    .padding(.bottom)
                
                Divider()
                
                if gallerySection {
                    Text("Gallery")
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach((developer.images)!, id: \.self ) { item in
                                VStack(alignment: .leading) {
                                    Image(item)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
//                                        .padding(.trailing)
                                        .cornerRadius(12)
                                        .frame(height: 180)
                                    
                                    Text("Source: Apple")
                                        .font(.caption)
                                }
                                .padding(.trailing)
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Divider()
                }
                
                Text("External URL")
                    .bold()
                    .padding(.top)
                    .padding(.bottom)
                
                Text("You can read more on the website below.")
                    .padding(.bottom)
                
                HStack {
                    Link("View this link", destination: URL(string: developer.externalURL)!)
                    Image(systemName: "link")
                        .symbolRenderingMode(.multicolor)
                }
                
                Text(host)
                    .padding(.top, 1)
                    .padding(.bottom, 30)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
//                let url = URL(string: "https://developer.apple.pl")!
//                let linkPreview = LPLinkView()
//                let provider = LPMetadataProvider()
//                provider.startFetchingMetadata(for: url) { (metaData, error) in
//                    guard let data = metaData, error == nil else {
//                        return
//                    }
//                    DispatchQueue.main.async {
//                        linkPreview.metadata = data
//                        self?.view.addSubview(linkPreview)
//                        linkPreview.frame = CGRect(x:0, y:0, width: 250, height: 250)
//                        linkPreview.center = self?.view.center ?? .zero
//                        self.view.addSubview(linkPreview)
//                        linkPreview.sizeToFit()
//                    }
//                }

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
