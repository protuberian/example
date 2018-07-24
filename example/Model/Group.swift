//
//  Group.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import Foundation

class Group: Codable {
    var name: String
    var items: [Item]

    init(name: String, items: [Item] = []) {
        self.name = name
        self.items = items
    }
}
