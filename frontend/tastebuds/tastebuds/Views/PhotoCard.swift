//
//  PhotoCard.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/25/23.
//

import SwiftUI

struct PhotoCard: View {
    var body: some View {
        HStack {
            Image("spread")
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .shadow(radius: 7)
                .frame(width: 200, height: 200)
        }
    }
}

struct PhotoCard_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCard()
    }
}
