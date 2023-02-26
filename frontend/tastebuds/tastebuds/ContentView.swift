//
//  ContentView.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/25/23.
//

import SwiftUI


struct Header: View {
    var body: some View {
        VStack {
            Text("tastebuds")
                .font(.title)
            Text("taste the friendbow")
                .font(.subheadline)
//                .padding(.bottom, 50)
        }
    }
}


struct ContentView: View {

    /* TEMP DATA */
    var user1 = User(
        id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
        first_name: "Jeremy",
        last_name: "Trilling"
    )
    var user2 = User(
        id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
        first_name: "Samantha",
        last_name: "Bong"
    )
    var user3 = User(
        id: UUID(uuidString: "af467260-d28d-4d4f-8f56-8082ec02686d")!,
        first_name: "Drilling",
        last_name: "For-gold"
    )

    var data = [
        Review(id: 1, created_at: "2/12/23", text_content: "this is a review text"),  //, user: user1),
        Review(id: 2, created_at: "2/20/23", text_content: "this is a review text 131212"), // , user: user2),
        Review(id: 3, created_at: "2/21/23", text_content: "review text"), // , user: user1),
        Review(id: 4, created_at: "2/3/23", text_content: "this is a review text"), // , user: user3),
        Review(id: 5, created_at: "2/11/23", text_content: "Okay so this is a real review that has a ton of text," +
               " but im not sure how this is going to show up in the ui. blah blah this is boring"), //, user: user1),
        Review(id: 6, created_at: "2/2/23", text_content: "this is a review text"), // , user: user2),
    ]


    var body: some View {
        VStack {
            Header()
            Spacer()

            VStack {
                ForEach(data) { item in
                    Divider()
                    HStack {
                        Text(String(item.id))
                            .padding(.left, 20)
                        Text(item.created_at)
                            .font(.body)
                            .border(.gray)
                    }
                    Text(item.text_content)
                        .font(.subheadline)
                        .padding(.bottom, 40)
                        .padding(.left, 10)
                        .padding(.right, 10)
//                    Rectangle().fill(.black).frame(width: 200, height: 2, alignment: .center)
                }
            }
            Divider()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
