//
//  FavouriteListView.swift
//  SwiftUIMVVMDemo
//
//  Created Abhishek Karkar  on 04/25/23.
//

import SwiftUI

struct FavouriteListView: View {
  @ObservedObject var viewModel: ToFavouriteListViewModel
  @EnvironmentObject var heartsProvider: HeartsProvider
  var body: some View {
    
    List(viewModel.products) { item in
      NavigationLink {
        viewModel.viewForSelectedProduct(item.product)
      } label: {
        ProductRow(product: item.product, heartsProvider: _heartsProvider, function: {
          viewModel.addOrRemoveProductFromFavourite(product: item.product)
        }).padding(3)
      }
    }
    
  }
  
}


