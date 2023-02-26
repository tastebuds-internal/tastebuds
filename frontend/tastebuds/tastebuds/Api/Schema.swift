//
//  Schema.swift
//  StarterProject
//
//  Created by Griffin Tarpenning on 2/25/23.
//

import Foundation

struct User: Codable {
    var id: UUID
    var first_name: String
    var last_name: String
}

struct Restaurant: Codable {
    var id: UUID
    var name: String
}

struct Review: Codable, Identifiable {
//    var id: UUID
    var id: Int
    var created_at: String
    var text_content: String

    var user: User?
    var restaurant: Restaurant?

}

struct Relationship: Codable {
    var userId: UUID
    var followingId: String
}

struct Photo: Codable {
    var id: UUID
    var title = ""
    var imageUrl = URL(string:"http://")!

    var blob: Data
}
