//
//  product controller.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import Combine
import Foundation

class ProductController: ObservableObject {
  
  @Published private(set) var favouriteProductList: [ProductToBeAdded] = []
  @Published private(set) var productInCartList: [ProductToBeAdded] = []
  
  func addToFavourite( product: Product) {
    add(productList: &favouriteProductList, product: product)
  }
  
  func removeFromFavourite( product: Product) {
    remove(productList: &favouriteProductList, product: product)
  }
  
  func addToCart( product: Product) {
    add(productList: &productInCartList, product: product)
  }
  
  func removeFromCart( product: Product) {
    remove(productList: &productInCartList, product: product)
  }
  
  func isProductInCartList(_ product: Product) -> Bool {
    return productInCartList.contains { $0.product.title == product.title }
  }
  
  func isProductInFavouriteList(_ product: Product) -> Bool {
    return favouriteProductList.contains { $0.product.id == product.id }
  }
  
  private func add( productList: inout [ProductToBeAdded], product: Product) {
    productList.append(ProductToBeAdded(product: product, added: Date()))
  }
  
  private func remove( productList: inout [ProductToBeAdded], product: Product) {
    productList = productList.filter { $0.product.id != product.id }
  }
  
}
