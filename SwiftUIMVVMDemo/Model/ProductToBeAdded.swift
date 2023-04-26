//
//  ProductToFavourite.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import Foundation

struct ProductToBeAdded {
  let product: Product
  let added: Date
}

extension ProductToBeAdded: Identifiable {
  var id: String { product.id! }
}
