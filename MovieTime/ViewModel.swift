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
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var heroTitle = Title.previewTitles[0]
    
    func getTitles() async {
        homeStatus = .fetching
        if trendingMovies.isEmpty {
            do{
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTVs = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let trMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let trTVs = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTVs
                topRatedMovies = try await trMovies
                topRatedTV = try await trTVs
                homeStatus = .success
                
                if let title = trendingMovies.randomElement(){
                    heroTitle = title
                }
                
            }catch {
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
        } else{
            homeStatus = .success
        }
    }
}
