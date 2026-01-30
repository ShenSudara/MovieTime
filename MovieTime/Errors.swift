//
//  Errors.swift
//  MovieTime
//
//  Created by Ashen Sudaraka on 2026-01-30.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "The file containing the API configuration was not found."
        case let .dataLoadingFailed(underlyingError):
            return "Failed to load the API configuration data: \(underlyingError.localizedDescription)"
        case let .decodingFailed(underlyingError):
            return "Failed to decode the API configuration data: \(underlyingError.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Failed to parse URL response: \(error.localizedDescription)"
        case .missingConfig:
            return "Missing API configuration."
        case .urlBuildFailed:
            return "Failed to build a URL."
        }
    }
}
