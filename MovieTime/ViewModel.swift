//
//  ViewModel.swift
//  MovieTime
//
//  Created by Ashen Sudaraka on 2026-01-30.
//

import Foundation

@Observable
class ViewModel{
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do{
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        }catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
