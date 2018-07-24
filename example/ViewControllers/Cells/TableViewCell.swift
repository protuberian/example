//
//  TableViewCell.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelLeading: NSLayoutConstraint!
    @IBOutlet weak var labelTrailing: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle(style: .regular)
    }

    private func applyStyle(style: ItemCellStyle) {
        contentView.backgroundColor = style.backgroundColor

        let view = UIView()
        view.backgroundColor = style.selectedBackgroundColor
        selectedBackgroundView = view
        
        labelLeading.constant = style.labelStyle.leadingMargin
        labelTrailing.constant = style.labelStyle.trailingMargin
        label.font = style.labelStyle.font
        label.textAlignment = style.labelStyle.alignment
    }

    func updateWithItem(item: Item) {
        label.text = item.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
