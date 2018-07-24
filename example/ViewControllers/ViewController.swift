//
//  ViewController.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var data = DataManager.shared.data.filter { $0.items.count > 0 }
    var longPressRecognizer: UILongPressGestureRecognizer!
    var expandedGroups: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = TableViewStyle.regular.itemHeight

        longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        tableView.addGestureRecognizer(longPressRecognizer)
    }

    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if case .began = sender.state {
            let location = sender.location(in: tableView)
            let indexPath = tableView.indexPathForRow(at: location) ?? IndexPath(row: 0, section: 0)
            guard let cell = tableView.cellForRow(at: indexPath) else { return }

            if cell.frame.contains(location) {
                alert(indexPath: indexPath)
            } else {
                rotate(clockwise: indexPath.section % 2 == 0)
            }
        }
    }

    private func alert(indexPath: IndexPath) {
        let vc = UIAlertController(title: data[indexPath.section].name,
                                   message: data[indexPath.section].items[indexPath.row].name,
                                   preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
    }

    private func rotate(clockwise: Bool) {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]

        let invert: Double = clockwise ? 1 : -1
        let values: [Double] = [0,
                                .pi*1/2*invert,
                                .pi*2/2*invert,
                                .pi*3/2*invert,
                                .pi*4/2*invert]
        animation.values = values


        tableView.layer.add(animation, forKey: nil)
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let expanded = expandedGroups.contains(section)
        return expanded ? data[section].items.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.updateWithItem(item: data[indexPath.section].items[indexPath.item])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewStyle.regular.groupHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableSectionHeader.instantiate()
        header.applyStyle(style: .regular)
        header.selected = expandedGroups.contains(section)
        header.label.text = data[section].name
        header.action = {
            if let index = self.expandedGroups.index(of: section) {
                self.expandedGroups.remove(at: index)
                header.selected = false
            } else {
                self.expandedGroups.append(section)
                header.selected = true
            }
            tableView.reloadSections([section], with: .automatic)
        }
        return header
    }
}
