//
//  ReviewRow.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import SwiftUI

struct ReviewRow: View {
    var review: Review
    var body: some View {
        VStack {
//            Divider()
            HStack {
                ProfilePhoto(width: 40, height: 40).padding(.left, 3)
                Text(review.user?.first_name ?? "")
                    .font(.body)
                    .border(.gray).padding(.left, 10)
                Text(review.user?.last_name ?? "")
                    .font(.body)
                    .border(.gray)

                Spacer()
            }
            Text(review.text_content.prefix(50) + "...")
                .font(.subheadline)
        }.padding()
    }
}

let review = Review(id: 5, created_at: "2/11/23", text_content: "Okay so this is a real review that has a ton of text," +
           " but im not sure how this is going to show up in the ui. blah blah this is boring", user: user1)

struct ReviewRow_Previews: PreviewProvider {

    static var previews: some View {
        ReviewRow(review: review)
    }
}
