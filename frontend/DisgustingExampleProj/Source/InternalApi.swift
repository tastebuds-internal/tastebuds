import Foundation

let NETWORK_TIMEOUT = 15.0


final class InternalApi: ApiInterface {

    let endpoint: String = "http://127.0.0.1:5000"
    let userId = "af467260-d28d-4d4f-8f56-8082ec02686d"

    init() {
        // Do logging here

    }

    func fetchUsers(userId uid: String) async throws -> [User] {
        let url = URL(string: endpoint + "/users/\(uid)")!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode([User].self, from: data)
    }

    func fetchRestaurants(userId uid: String) async throws -> [Restaurant] {
        let url = URL(string: endpoint + "/rants/\(uid)")!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode([Restaurant].self, from: data)
    }

    func fetchReviews(userId uid: String) async throws -> Dictionary<String, [Review]> {
        let url = URL(string: endpoint + "/api/v1/feed")!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(Dictionary<String, [Review]>.self, from: data)
    }

    func fetchRelationships(userId uid: String) async throws -> [Relationship] {
        let url = URL(string: endpoint + "/ships/\(uid)")!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode([Relationship].self, from: data)
    }

    func fetchRestaurantPhotos(rantId uid: String) async throws -> [Photo] {
//        let url = URL(string: endpoint + "/rantphotos/\(uid)")!
        let url = URL(string: "https://picsum.photos/200")!
        let (data, _) = try await URLSession.shared.data(from: url)
//        return try [Photo(from: data)]

        return try JSONDecoder().decode([Photo].self, from: data)
    }

//    func fetchRestaurantPhotos(rantId uid: String) async throws -> [Photo] {
//        let url = URL(string: "https://picsum.photos/200")!
//        return
//
//    }

    func fetchProfilePhoto(userId uid: String) async throws -> Photo {
        let url = URL(string: endpoint + "/prophotos/\(uid)")!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(Photo.self, from: data)
    }

//    func postProfilePhoto(data d: Photo, userId uid: String) async throws -> Data {
//        <#code#>
//    }

}
