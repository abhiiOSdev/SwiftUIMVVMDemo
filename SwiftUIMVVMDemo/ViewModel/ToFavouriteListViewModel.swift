//
//  ToFavouriteListViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import Combine

class ToFavouriteListViewModel: ObservableObject {
  
  @Published var products: [ProductToBeAdded]
  
  var productController: ProductController
  let viewForSelectedProduct: (Product) -> ProductDetailView
  
  private var cancellables = Set<AnyCancellable>()
  
  init(productController: ProductController, viewForSelectedProduct: @escaping (Product) -> ProductDetailView) {
    self.productController = productController
    self.viewForSelectedProduct = viewForSelectedProduct
    products = productController.favouriteProductList
    
    productController.$favouriteProductList.sink { [weak self] in
      self?.products = $0
    }
    .store(in: &cancellables)
  }
  
  func addOrRemoveProductFromFavourite(product: Product) {
    if productController.isProductInFavouriteList(product) {
      productController.removeFromFavourite(product: product)
    } else {
      productController.addToFavourite(product: product)
    }
  }
}
