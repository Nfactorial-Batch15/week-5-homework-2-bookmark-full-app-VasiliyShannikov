//
//  LinkModel.swift
//  BookmarksUIKit
//
//  Created by Vasiliy Shannikov on 22.01.2022.
//

import Foundation

class LinkModel: Decodable, Encodable {
    var name: String
    var link: String
    
    init(name: String, link: String) {
        self.name = name
        self.link = link
    }
}
