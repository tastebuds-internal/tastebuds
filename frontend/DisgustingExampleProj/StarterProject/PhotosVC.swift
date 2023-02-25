//
//  PhotosVC.swift
//  StarterProject
//
//  Created by Sacha Durand Saint Omer on 30/01/2017.
//  Copyright © 2017 freshOS. All rights reserved.
//

import UIKit

final class PhotosVC: UIViewController {

    // Since we're not using storyboards, we need to use our custom View throught
    // the `loadView` function.
    // Here we decide to call our custome view `v`. It's simple and straighforward.
    private let v = PhotosView()
    override func loadView() { view = v }

    // We need to store an array of Photos
    var reviews = [Review]()

    override func viewDidLoad() {
        super.viewDidLoad()

        v.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)

        // After the view loads, we set ourselves as the delegate of the Tableview.
        v.tableView.dataSource = self
        v.header.backgroundColor = .green

        // And we fetch the photos.
        refresh()


        _ = NSLocalizedString("Letsgo", comment: "")
    }

    @objc
    private func refresh() {
        Task.init {
            do {
                let reviewDict = try await Review.fetchReviews(rantId: "")
                self.reviews = reviewDict["reviews"] ?? []
                print("Fetched \(self.reviews.count) reviews.")
            } catch {
                print("Fetching reviews failed with error \(error)")
            }
            // In any case, reload the tableView
            self.v.header.reloadInputViews()
            self.v.tableView.reloadData()
            self.v.refreshControl.endRefreshing()
        }
    }
}

extension PhotosVC: UITableViewDataSource {

    func header(_ header: UITextView) -> UITextView {
        let header = Header() as Header
        let h = HeaderContent(title: "tastebuds", subtitle: "taste the friendbow")
        header.render(with: h)
        return header
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell {
            let review = reviews[indexPath.row]
            cell.render(with: review) // Here we use a render helper to keep our code that populates the
            // Cell separated, this keeps things nice and clean.
            return cell
        }
        return UITableViewCell()
    }
}
