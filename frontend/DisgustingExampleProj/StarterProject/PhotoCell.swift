//
//  PhotoCell.swift
//  StarterProject
//
//  Created by Sacha Durand Saint Omer on 30/01/2017.
//  Copyright © 2017 freshOS. All rights reserved.
//

import UIKit
import Stevia

// This is our custom UITableViewCell.
// This is what replaces the heavy xml Storyboard file when you dev views in code.

// Get the full documentation at https://github.com/freshOS/Stevia

final class PhotoCell: UITableViewCell {

    let title = UILabel()
    let photo = UIImageView()

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // This adds our views to the cell's content view as needed
        // and prepares them for autolayout use.
        // This has the advantage of being very visual. Indeed, sv calls can be nested
        // and you see the view hierarchy right away.
        subviews {
            title
            photo
        }

        // Here we layout the cell.
        layout {
            16
            |-16-title-16-|
            16
            |-16-photo.heightEqualsWidth()-16-|
            16
        }

        // Configure visual elements
        title.numberOfLines = 0
        photo.backgroundColor = .lightGray
    }
}
