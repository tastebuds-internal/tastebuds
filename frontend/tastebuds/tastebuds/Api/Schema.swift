//
//  Schema.swift
//  StarterProject
//
//  Created by Griffin Tarpenning on 2/25/23.
//

import Foundation
import SwiftUI
import CoreLocation


struct User: Codable {
    var id: UUID
    var first_name: String
    var last_name: String

    var created_at: String
}

struct Restaurant: Codable {
    var id: UUID
    var name: String

    private var coordinates: Coordinates
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Review: Codable, Identifiable {
//    var id: UUID
    var id: Int
    var created_at: String
    var text_content: String

    var user: User?
    var restaurant: Restaurant?

    var photos: [Photo]?

}

struct Relationship: Codable {
    var userId: UUID
    var followingId: String
}

struct Photo: Codable {
    var id: UUID
    var title = ""
    var imageUrl = URL(string:"http://")!

    var image: Image {
        Image(imageUrl.absoluteString)
    }
}
