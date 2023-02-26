//
//  ContentView.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/25/23.
//

import SwiftUI


/* TEMP DATA */
var user1 = User(
    id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
    first_name: "Jeremy",
    last_name: "Trilling",
    created_at: "02/23/2023"
)
var user2 = User(
    id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
    first_name: "Samantha",
    last_name: "Bong",
    created_at: "02/23/2023"
)
var user3 = User(
    id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
    first_name: "Drilling",
    last_name: "For-gold",
    created_at: "02/23/2023"
)

var revdata = [
    Review(
        id: 51,
        created_at: "2/11/23",
        text_content: "Okay so this is a real review that has a ton of text," +
            " but im not sure how this is going to show up in the ui. blah" +
            " blah this is boring. I guess this it the best kind of review," +
            " because I have no idea what I am doing... square circle diamond wow.",
        user: user12
    ),
    Review(id: 1, created_at: "2/12/23", text_content: "this is a review text", user: user1),
    Review(id: 2, created_at: "2/20/23", text_content: "this is a review text 131212", user: user2),
    Review(id: 3, created_at: "2/21/23", text_content: "review text", user: user1),
    Review(id: 4, created_at: "2/3/23", text_content: "this is a review text", user: user3),
    Review(id: 5, created_at: "2/11/23",
           text_content: "Okay so this is a real review that has a ton of text," +
           " but im not sure how this is going to show up in the ui. blah blah this is boring", user: user1),
    Review(id: 6, created_at: "2/2/23", text_content: "this is a review text", user: user2),
]


struct ContentView: View {
    var body: some View {
        VStack {
            FeedHeader()
            ReviewList(reviews: revdata)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
