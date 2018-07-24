//
//  DataManager.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import Foundation

class DataManager {
    static var shared = DataManager()
    private(set) var data: [Group] = []

    init() {

        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("data.json")

        do {
            if !FileManager.default.fileExists(atPath: fileURL.path) || true {
                try createDummyData(url: fileURL)
            }

            let content = try Data(contentsOf: fileURL)
            data = try JSONDecoder().decode([Group].self, from: content)
        } catch let error {
            print("Error occured: \(error.localizedDescription)")
        }
    }

    private func createDummyData(url: URL) throws {
        let groupsCount = arc4random()%5+7
        var groups: [Group] = []

        for groupIndex in 0..<groupsCount {
            if arc4random()%2 == 0 {
                continue
            }
            var items: [Item] = []
            let itemsInGroup = arc4random()%3+4

            for itemIndex in 0..<itemsInGroup {
                items.append(Item(name: "Item #\(itemIndex)"))
            }

            groups.append(Group(name: "Group #\(groupIndex)", items: items))
        }

        let data = try JSONEncoder().encode(groups)
        try data.write(to: url)
    }
}
