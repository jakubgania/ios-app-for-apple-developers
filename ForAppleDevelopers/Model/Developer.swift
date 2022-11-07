//
//  DeveloperResource.swift
//  ForAppleDevelopers
//
//  Created by Jakub Gania on 06.11.22.
//

import Foundation
import SwiftUI

struct Developer: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var images: [String]?
    var externalURL: String
}
