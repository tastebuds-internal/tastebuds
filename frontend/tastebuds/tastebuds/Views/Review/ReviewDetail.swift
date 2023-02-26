//
//  ReviewDetail.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import SwiftUI
import MapKit

struct ReviewDetail: View {
    let review: Review
    var body: some View {
        VStack {
            HStack {
                ProfilePhoto(width: 50, height: 50)
                    .padding(.top, 10)
                    .padding(.left, 20)
                    .padding(.right, 20)
                Text(review.user?.first_name ?? "")
                    .font(.title)
                Text(review.user?.last_name ?? "")
                    .font(.title)
                Spacer()
            }
            VStack {
                Text(review.user?.created_at ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()
                Text(review.text_content)
                    .font(.body)
                    .padding()
                MapView(coordinate: CLLocationCoordinate2D(latitude: 37.772, longitude: -122.44))
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                Spacer()
            }
        }
    }
}



let reviewData1 = Review(
    id: 5,
    created_at: "2/11/23",
    text_content: "Okay so this is a real review that has a ton of text," +
        " but im not sure how this is going to show up in the ui. blah" +
        " blah this is boring. I guess this it the best kind of review," +
        " because I have no idea what I am doing... square circle diamond wow.",
    user: user12
)

struct ReviewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetail(review: reviewData1)
    }
}
