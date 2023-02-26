//
//  Api.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/26/23.
//

import Foundation


protocol ApiInterface {

    func fetchUsers(userId uid: String) async throws -> [User]
    func fetchRestaurants(userId uid: String) async throws -> [Restaurant]
    func fetchReviews(userId uid: String) async throws -> Dictionary<String, [Review]>
    func fetchRelationships(userId uid: String) async throws -> [Relationship]

    func fetchRestaurantPhotos(rantId uid: String) async throws -> [Photo]

    func fetchProfilePhoto(userId uid: String) async throws -> Photo
//    func postProfilePhoto(data d: Photo, userId uid: String) async throws -> Data
}

var api: ApiInterface!
