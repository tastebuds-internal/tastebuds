//
//  Review+Api.swift
//  StarterProject
//
//  Created by Griffin Tarpenning on 2/24/23.
//  Copyright © 2023 freshOS. All rights reserved.
//

import Foundation


extension Review {
    static func fetchReviews(rantId uid: String) async throws -> Dictionary<String, [Review]> {
        return try await api.fetchReviews(userId: uid)
    }

}
