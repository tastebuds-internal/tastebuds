
extension Photo {
    static func fetchProfilePhoto(userId uid: String) async throws -> Photo {
        return try await api.fetchProfilePhoto(userId: uid)
    }

//    static func fetchReviewPhotos(userId uid: String) async throws -> [Photo] {
//        return try await api.fetchReviewPhotos(rantId: uid)
//    }

    static func fetchRestaurantPhotos(rantId uid: String) async throws -> [Photo] {
        return try await api.fetchRestaurantPhotos(rantId: uid)
    }
}
