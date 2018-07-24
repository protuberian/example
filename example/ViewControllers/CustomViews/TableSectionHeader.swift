//
//  TableSectionHeader.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import UIKit

class TableSectionHeader: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelLeading: NSLayoutConstraint!
    @IBOutlet weak var labelTrailing: NSLayoutConstraint!
    
    var action: (() -> Void)?

    var selected: Bool = false {
        didSet {
            backgroundColor = selected ? selectedBackgroundColor : normalBackgroundColor
        }
    }

    private var normalBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    private var selectedBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    static func instantiate() -> TableSectionHeader {
        return UINib(nibName: "TableSectionHeader", bundle: nil).instantiate(withOwner: nil)[0] as! TableSectionHeader
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let button = UIButton(frame: bounds)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        addSubview(button)
    }

    func applyStyle(style: GroupHeaderStyle) {
        normalBackgroundColor = style.backgroundColor
        selectedBackgroundColor = style.selectedBackgroundColor

        labelLeading.constant = style.labelStyle.leadingMargin
        labelTrailing.constant = style.labelStyle.trailingMargin
        label.font = style.labelStyle.font
        label.textAlignment = style.labelStyle.alignment
    }

    @objc func buttonTap() {
        action?()
    }
}
