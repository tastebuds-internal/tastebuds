//
//  ReviewDetail.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import SwiftUI


struct ProfileDetail: View {
    let user: User
    var body: some View {
        VStack {
            VStack {
                ProfilePhoto(width: 150, height: 150)
                HStack {
                    Text(review.user?.first_name ?? "")
                        .padding(.left, 20)
                    Text(review.user?.last_name ?? "")
                        .padding(.left, 5)
                }
                if (review.user != nil) {
                    Text("tasty since: \(review.user!.created_at)")
                        .font(.italic(.subheadline)())
                }

            }
            .padding(.top, 30)
            Spacer()
        }
    }
}

let user12 = User(
    id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
    first_name: "geoff",
    last_name: "finnigan",
    created_at: "02/26/2023"
)

let reviewData = Review(
    id: 5,
    created_at: "2/11/23",
    text_content: "Okay so this is a real review that has a ton of text," +
           " but im not sure how this is going to show up in the ui. blah" +
           " blah this is boring",
    user: user12
)

struct ProfileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetail(user: user12)
    }
}
