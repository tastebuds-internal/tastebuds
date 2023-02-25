//
//  Header.swift
//  StarterProject
//
//  Created by Griffin Tarpenning on 2/24/23.
//  Copyright © 2023 freshOS. All rights reserved.
//

import Foundation
import UIKit
import Stevia


final class Header: UITextView {

    let title = UILabel()
    let subtitle = UITextField()

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    override init(frame: CGRect, textContainer: NSTextContainer?) {
            super.init(frame: frame, textContainer: textContainer)

        // This adds our views to the cell's content view as needed
        // and prepares them for autolayout use.
        // This has the advantage of being very visual. Indeed, sv calls can be nested
        // and you see the view hierarchy right away.
        subviews {
            title
            subtitle
        }

        // Here we layout the cell.
        layout {
            8
            |-16-title-16-|
            4
            |-16-subtitle-16-|
            16
        }

        // Configure visual elements
        title.numberOfLines = 0
        subtitle.textColor = .gray
    }
}


struct HeaderContent {
    var title = "tastebuds"
    var subtitle = "taste the friendbow"
}


extension Header {
    func render(with h: HeaderContent) {
        title.text = h.title
        subtitle.text = h.subtitle
    }
}
