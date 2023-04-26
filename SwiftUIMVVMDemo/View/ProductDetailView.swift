//
//  ProductDetailView.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import SwiftUI

struct ProductDetailView: View {
  @ObservedObject var viewModel: ProductDetailViewModel
  @EnvironmentObject var heartsProvider: HeartsProvider
  
  var body: some View {
    VStack(alignment: .center, spacing: 2){
      ZStack(alignment: .topTrailing) {
        URLImageView(urlString: viewModel.imageUrl)
        
        HeartButton(isLikded: heartsProvider.isHearted(id:viewModel.productID),
                    function:{
          heartsProvider.toggle(id: viewModel.productID)
          viewModel.addOrRemoveProductFromFavourite()
        })
        .frame(width: 60, height: 60)
      }
      RatingView(rating: viewModel.rating, label: "Rating: \(viewModel.rating)")
      Text(viewModel.title).bold()
      Text(viewModel.price).bold()
      
      Spacer()
      
    }
  }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//      ProductDetailView(viewModel: ProductDetailViewModel(product: Product(), productController: ProductController()))
//    }
//}
