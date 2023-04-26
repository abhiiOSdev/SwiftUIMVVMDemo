//
//  SwiftUIMVVMDemoApp.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import SwiftUI

@main
struct SwiftUIMVVMDemoApp: App {
  
  private let viewModelFactory = ViewModelFactory()
  
  var body: some Scene {
    WindowGroup {
      TabView {
        
        NavigationView {
          ProductListView(viewModel: viewModelFactory.makeProductListViewModel()) // dependecy injection
            .navigationTitle("Wines")
        }
        .tabItem { Label("All Wines", systemImage: "list.bullet")}
        
        NavigationView {
          FavouriteListView(viewModel: viewModelFactory.makeToFavouriteListViewModel()) // dependecy injection
            .navigationTitle("Favourite")
        }
        .tabItem { Label("Favourite", systemImage: "star") }
        
      }
      .environmentObject(HeartsProvider()) // dependency injection using EnvironmentObject
    }
    
  }
}
