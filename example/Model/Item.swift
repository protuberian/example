//
//  Item.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import Foundation

class Item: Codable {
    var name: String
    init(name: String) {
        self.name = name
    }
}
