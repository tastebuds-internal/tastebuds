//
//  ProfilePhoto.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import SwiftUI


struct ProfilePhoto: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        HStack {
            Image("spread")
                .resizable()
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
    }
}

struct ProfilePhoto_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhoto(width: 100, height: 100)
    }
}
