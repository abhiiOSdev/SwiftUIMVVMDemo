//
//  ProductDetailViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import Combine

class ProductDetailViewModel: ObservableObject {
  
  let title: String
  let price: String
  let productID: String
  let imageUrl: String
  let rating: Int
  
  @Published var addOrRemoveProductTextFromCart: String
  @Published var addOrRemoveProductTextFromFavourite: String
  
  private let product: Product
  private let productController: ProductController
  
  init(product: Product, productController: ProductController) {
    self.title = product.title!
    self.price = String(product.saleUnitPrice!)
    self.productID = product.id!
    self.imageUrl = product.imageURL!
    self.rating = Int(product.ratingCount!)
    self.product = product
    self.productController = productController
    
      // This method is defined in a private extension below to DRY the code without having to
      // define a static function that could be accessed here when self is not yet available.
    addOrRemoveProductTextFromCart = productController.textForAddOrRemoveCartButton(for: product)
    addOrRemoveProductTextFromFavourite = productController.textForAddOrRemoveFavouriteButton(for: product)
  }
  
  func addOrRemoveProductFromCart() {
    if productController.isProductInCartList(product) {
      productController.removeFromCart(product: product)
    } else {
      productController.addToCart(product: product)
    }
    addOrRemoveProductTextFromCart = productController.textForAddOrRemoveCartButton(for: product)
  }
  
  func addOrRemoveProductFromFavourite() {
    if productController.isProductInFavouriteList(product) {
      productController.removeFromFavourite(product: product)
    } else {
      productController.addToFavourite(product: product)
    }
    
    addOrRemoveProductTextFromCart = productController.textForAddOrRemoveFavouriteButton(for: product)
  }
}

private extension ProductController {
  
  func textForAddOrRemoveCartButton(for product: Product) -> String {
    isProductInCartList(product) ? "Remove from cart list" : "Add to cart list"
  }
  
  func textForAddOrRemoveFavouriteButton(for product: Product) -> String {
    isProductInFavouriteList(product) ? "Remove from favourite list" : "Add to favourite list"
  }
}

