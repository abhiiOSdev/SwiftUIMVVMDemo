//
//  EcomProduct.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import Foundation
  // This file was generated from JSON Schema using quicktype, do not modify it directly.
  // To parse the JSON, add this file to your project and do:
  //
  //   let ecomProduct = try? newJSONDecoder().decode(EcomProduct.self, from: jsonData)

import Foundation

  // MARK: - EcomProduct
struct EcomProduct: Codable, Hashable {
  let products: [Product]?
  
  enum CodingKeys: String, CodingKey {
    case products = "products"
  }
}

  // MARK: - Product
struct Product: Codable, Hashable {
  let citrusID: String?
  let title: String?
  let id: String?
  let imageURL: String?
  let price: [Price]?
  let brand: String?
  let badges: [String]?
  let ratingCount: Double?
  let messages: Messages?
  let isAddToCartEnable: Bool
  let addToCartButtonText: AddToCartButtonText?
  let isInTrolley: Bool
  let isInWishlist: Bool
  let purchaseTypes: [PurchaseTypeElement]?
  let isFindMeEnable: Bool
  let saleUnitPrice: Double?
  let totalReviewCount: Int?
  let isDeliveryOnly: Bool
  let isDirectFromSupplier: Bool
  
  enum CodingKeys: String, CodingKey {
    case citrusID = "citrusId"
    case title = "title"
    case id = "id"
    case imageURL = "imageURL"
    case price = "price"
    case brand = "brand"
    case badges = "badges"
    case ratingCount = "ratingCount"
    case messages = "messages"
    case isAddToCartEnable = "isAddToCartEnable"
    case addToCartButtonText = "addToCartButtonText"
    case isInTrolley = "isInTrolley"
    case isInWishlist = "isInWishlist"
    case purchaseTypes = "purchaseTypes"
    case isFindMeEnable = "isFindMeEnable"
    case saleUnitPrice = "saleUnitPrice"
    case totalReviewCount = "totalReviewCount"
    case isDeliveryOnly = "isDeliveryOnly"
    case isDirectFromSupplier = "isDirectFromSupplier"
  }
}

enum AddToCartButtonText: String, Codable, Hashable {
  case addToCart = "Add to cart"
  case editQuantity = "Edit quantity"
}

  // MARK: - Messages
struct Messages: Codable, Hashable {
  let secondaryMessage: String?
  let sash: Sash?
  let promotionalMessage: String?
  
  enum CodingKeys: String, CodingKey {
    case secondaryMessage = "secondaryMessage"
    case sash = "sash"
    case promotionalMessage = "promotionalMessage"
  }
}

  // MARK: - Sash
struct Sash: Codable, Hashable {
}

  // MARK: - Price
struct Price: Codable, Hashable {
  let message: Message?
  let value: Double?
  let isOfferPrice: Bool?
  
  enum CodingKeys: String, CodingKey {
    case message = "message"
    case value = "value"
    case isOfferPrice = "isOfferPrice"
  }
}

enum Message: String, Codable {
  case inAnySix = "in any six"
  case perBottle = "per bottle"
}

  // MARK: - PurchaseTypeElement
struct PurchaseTypeElement: Codable, Hashable {
  let purchaseType: PurchaseTypeEnum?
  let displayName: DisplayName?
  let unitPrice: Double?
  let minQtyLimit: Int?
  let maxQtyLimit: Int?
  let cartQty: Int?
  
  enum CodingKeys: String, CodingKey {
    case purchaseType = "purchaseType"
    case displayName = "displayName"
    case unitPrice = "unitPrice"
    case minQtyLimit = "minQtyLimit"
    case maxQtyLimit = "maxQtyLimit"
    case cartQty = "cartQty"
  }
}

enum DisplayName: String, Codable, Hashable {
  case case6 = "case (6)"
  case each = "each"
  case perBottle = "per bottle"
  case perCaseOf6 = "per case of 6"
}

enum PurchaseTypeEnum: String, Codable, Hashable {
  case bottle = "Bottle"
  case purchaseTypeCase = "Case"
}
