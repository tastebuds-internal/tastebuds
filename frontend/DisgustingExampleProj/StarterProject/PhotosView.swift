//
//  PhotosView.swift
//  StarterProject
//
//  Created by Sacha Durand Saint Omer on 30/01/2017.
//  Copyright © 2017 freshOS. All rights reserved.
//

import UIKit
import Stevia

// This is our custom View.
// This is what replaces the heavy xml Storyboard file when you dev views in code.

// Get the full documentation at https://github.com/freshOS/Stevia

final class PhotosView: UIView {

    let refreshControl = UIRefreshControl()
    let tableView = UITableView()
//    let toolbar = UIToolbar()
    let header = UITextView()

    convenience init() {
        self.init(frame: .zero)

        // Here we use Stevia to make our constraints more readable and maintainable.
        subviews {
            header
            tableView
//            toolbar
        }

        // header
        header.fillContainer()
        header.isEditable = false

        // table
        tableView.fillContainer()
        tableView.addSubview(refreshControl)

        // Configure Tablview
        tableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        tableView.estimatedRowHeight = 200 // Enable self-sizing cells
    }
}
