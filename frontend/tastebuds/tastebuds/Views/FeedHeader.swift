//
//  FeedHeader.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import SwiftUI

struct FeedHeader: View {
    var body: some View {
        VStack {
            Text("tastebuds")
                .font(.title)
            Text("taste the friendbow")
                .font(.subheadline)
        }
    }
}

struct FeedHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeader()
    }
}
