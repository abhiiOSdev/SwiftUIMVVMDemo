//
//  ProductListView.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import SwiftUI

struct ProductListView: View {
  @ObservedObject var viewModel: ProductListViewModel
  @EnvironmentObject var heartsProvider: HeartsProvider
  
  var body: some View {
    VStack{
      if viewModel.isLoading {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
      }
      List (viewModel.products, id: \.self){
        product in
        NavigationLink {
          viewModel.viewForSelectedProduct(product)
        } label: {
          VStack(alignment: .center){
            ZStack(alignment: .topTrailing) {
              URLImageView(urlString: product.imageURL ?? " ")
              
              HeartButton(isLikded: heartsProvider.isHearted(id: product.id!),
                          function:{
                heartsProvider.toggle(id: product.id!)
                viewModel.addOrRemoveProductFromFavourite(product: product)
              })
              .frame(width: 60, height: 60)
            }
            Text(product.title!).bold()
            Text("\(product.saleUnitPrice!)").bold()
          }.padding(3)

        }.background(Color.green)
      }.onAppear {
        
        viewModel.fetchProductList()
      }
    }
  }

}

