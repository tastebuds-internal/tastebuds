//
//  ReviewList.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import SwiftUI

struct ReviewList: View {
    var reviews: [Review]
    var body: some View {
        NavigationView {
            List(reviews) { review in
                NavigationLink {
                    ReviewDetail(review: review)
                } label: {
                    ReviewRow(review: review)
                }
            }
            Spacer()
        }
//        .navigationTitle("Reviews")
    }
}


/* TEST DATA */
let data = [
    Review(id: 1, created_at: "2/12/23", text_content: "this is a review text"),  //, user: user1),
    Review(id: 2, created_at: "2/20/23", text_content: "this is a review text 131212"), // , user: user2),
    Review(id: 3, created_at: "2/21/23", text_content: "review text"), // , user: user1),
    Review(id: 4, created_at: "2/3/23", text_content: "this is a review text"), // , user: user3),
    Review(id: 5, created_at: "2/11/23", text_content: "Okay so this is a real review that has a ton of text," +
           " but im not sure how this is going to show up in the ui. blah blah this is boring"), //, user: user1),
    Review(id: 6, created_at: "2/2/23", text_content: "this is a review text"), // , user: user2),
]

struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList(reviews: data)
    }
}
