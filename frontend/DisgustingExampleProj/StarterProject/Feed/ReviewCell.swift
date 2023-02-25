//
//  Review.swift
//  StarterProject
//
//  Created by Griffin Tarpenning on 2/24/23.
//  Copyright © 2023 freshOS. All rights reserved.
//

import Foundation
import UIKit
import Stevia


final class ReviewCell: UITableViewCell {

    let title = UILabel()
    let text = UITextField()

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // This adds our views to the cell's content view as needed
        // and prepares them for autolayout use.
        // This has the advantage of being very visual. Indeed, sv calls can be nested
        // and you see the view hierarchy right away.
        subviews {
            title
            text
        }

        // Here we layout the cell.
        layout {
            16
            |-16-title-16-|
            12
            |-16-text-16-|
            16
        }

        // Configure visual elements
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.font = UIFont.systemFont(ofSize: 12)

    }
}

extension ReviewCell {

    func render(with r: Review) {
        title.text = r.user.first_name + " " + r.user.last_name
        text.text = r.text_content
    }
}
