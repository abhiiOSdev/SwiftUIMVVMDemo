//
//  ProductListViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//
import Foundation
import Combine

class ProductListViewModel: ObservableObject {
  
  @Published var products: [Product]
  @Published var isLoading: Bool = false
  
  private let productController: ProductController
  let viewForSelectedProduct: (Product) -> ProductDetailView

  
  init(products: [Product] = [], productController: ProductController, viewForSelectedProduct: @escaping (Product) -> ProductDetailView) {
    self.products = products
    self.productController = productController
    self.viewForSelectedProduct = viewForSelectedProduct
  }
  
  
  func fetchProductList() {
    if products.count == 0 {
      self.isLoading = true
      APIManager.shared.fetchProductForUrl {[weak self] productData, responseFlag in
        if responseFlag {
          DispatchQueue.main.async {
            self?.products = productData!.products!
            self?.isLoading = false
          }
        }
        
        DispatchQueue.main.async {
          self?.isLoading = false
        }
        
      }
    }
    
  }
  
  func addOrRemoveProductFromCart(product: Product) {
    if productController.isProductInCartList(product) {
      productController.removeFromCart(product: product)
    } else {
      productController.addToCart(product: product)
    }
  }
  
  func addOrRemoveProductFromFavourite(product: Product) {
    if productController.isProductInFavouriteList(product) {
      productController.removeFromFavourite(product: product)
    } else {
      productController.addToFavourite(product: product)
    }
  }
  
  func isProductFavourite(product: Product)-> Bool {
    return productController.isProductInFavouriteList(product)
  }
  
}
