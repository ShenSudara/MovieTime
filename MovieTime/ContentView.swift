//
//  ContentView.swift
//  MovieTime
//
//  Created by Ashen Sudaraka on 2026-01-22.
// 01:39:50

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: Constants.homeIconString){
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString){
                Text(Constants.upcomingString)
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString){
                Text(Constants.searchString)
            }
            Tab(Constants.downloadsString, systemImage: Constants.downloadsIconString){
                Text(Constants.downloadsString)
            }
        }.onAppear{
            if let config = APIConfig.shared{
                print(config.tmdbBaseURL)
                print(config.tmdbAPIKey)
            }
        }
    }
}

#Preview {
    ContentView()
}
