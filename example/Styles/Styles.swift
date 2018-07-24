//
//  Styles.swift
//  example
//
//  Created by Denis G. Kim on 24.07.2018.
//  Copyright © 2018 Denis G. Kim. All rights reserved.
//

import Foundation
import UIKit

struct LabelStyle {
    let font: UIFont
    let leadingMargin: CGFloat
    let trailingMargin: CGFloat
    let alignment: NSTextAlignment
}

class BaseStyle {
    let backgroundColor: UIColor
    let selectedBackgroundColor: UIColor
    let labelStyle: LabelStyle

    init(backgroundColor: UIColor, selectedBackgroundColor: UIColor, labelStyle: LabelStyle) {
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.labelStyle = labelStyle
    }
}

class GroupHeaderStyle: BaseStyle {
    static let regular: GroupHeaderStyle = {
        let labelStyle = LabelStyle(font: UIFont(name: "Roboto-Light", size: 16)!,
                                    leadingMargin: 36,
                                    trailingMargin: 16,
                                    alignment: .left)
        return GroupHeaderStyle(backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), selectedBackgroundColor: #colorLiteral(red: 0.7294117647, green: 0.7294117647, blue: 0.7294117647, alpha: 1), labelStyle: labelStyle)
    }()
}

class ItemCellStyle: BaseStyle {
    static let regular: ItemCellStyle = {
        let labelStyle = LabelStyle(font: UIFont(name: "Roboto-Light", size: 16)!,
                                    leadingMargin: 36,
                                    trailingMargin: 16,
                                    alignment: .left)
        return ItemCellStyle(backgroundColor: #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1), selectedBackgroundColor: #colorLiteral(red: 0.7294117647, green: 0.7294117647, blue: 0.7294117647, alpha: 1), labelStyle: labelStyle)
    }()
}

struct TableViewStyle {
    let groupHeight: CGFloat
    let itemHeight: CGFloat

    static let regular = TableViewStyle(groupHeight: 48, itemHeight: 48)
}
