//
//  HomeServiceProtocol.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 31/08/24.
//

import Foundation

protocol HomeServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getNowPlaying(endpoint: NetworkFactory) async throws -> PaginationResponseModel<MovieResponseModel>
}

final class HomeService: HomeServiceProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getNowPlaying(endpoint: NetworkFactory) async throws -> PaginationResponseModel<MovieResponseModel> {
        try await networker.taskAsync(type: PaginationResponseModel<MovieResponseModel>.self, endPoint: endpoint, isMultipart: false)
    }
}
