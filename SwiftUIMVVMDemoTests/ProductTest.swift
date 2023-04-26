//
//  ProductListTest.swift
//  SwiftUIMVVMDemoTests
//
//  Created by Abhishek Karkar on 1/2/23.
//

import XCTest
import Combine

class ProductListTest: XCTestCase {
  
  private var cancellables = Set<AnyCancellable>()
  private var controller: ProductController!
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      controller = ProductController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      controller = nil
    }

  func test_productList_isValid()  {
    let emptyProductList = Product(citrusID: nil, title: nil, id: nil, imageURL: nil, price: [], brand: nil, badges: [], ratingCount: nil, messages: nil, isAddToCartEnable: false, addToCartButtonText: nil, isInTrolley: false, isInWishlist: false, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: nil, totalReviewCount: nil, isDeliveryOnly: false, isDirectFromSupplier: false)

      XCTAssertFalse(emptyProductList.isAddToCartEnable)
      XCTAssertFalse(emptyProductList.isInTrolley)
      XCTAssertFalse(emptyProductList.isInWishlist)
      XCTAssertFalse(emptyProductList.isFindMeEnable)
      XCTAssertFalse(emptyProductList.isDeliveryOnly)
      XCTAssertFalse(emptyProductList.isDirectFromSupplier)
  }
  
  
  func test_AddOrRemoveProductAdd_WhenProductIsNotInFavouriteList() {
    let product = makeSUT(isAddToCart: false,
                      isDeliveryOnly: true,
                      isDirectFromSupplier: false,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    let viewModel = ProductDetailViewModel(product: product, productController: controller)
    
    XCTAssertFalse(controller.isProductInFavouriteList(product))
    
    XCTAssertEqual(viewModel.addOrRemoveProductTextFromFavourite, "Add to favourite list")
  }
  
  func test_AddOrRemoveProductRemove_WhenProductIsInFavouriteList() {
    let product = makeSUT(isAddToCart: false,
                          isDeliveryOnly: true,
                          isDirectFromSupplier: false,
                          isFindMeEnable: false,
                          isInTrolley: false,
                          isInWishlist: false)
    
    controller.addToFavourite(product: product)
    XCTAssertTrue(controller.isProductInFavouriteList(product))
    
    let viewModel = ProductDetailViewModel(product: product, productController: controller)
    
    XCTAssertEqual(viewModel.addOrRemoveProductTextFromFavourite, "Remove from favourite list")
  }
  
  
  func test_isProductInCartAvailable() {
    let sut = makeSUT(isAddToCart: true,
                      isDeliveryOnly: false,
                      isDirectFromSupplier: false,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertTrue(sut.isAddToCartEnable)
  }
  
  func test_isProductDeveliveryOnlyAvailable() {
    let sut = makeSUT(isAddToCart: false,
                      isDeliveryOnly: true,
                      isDirectFromSupplier: false,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertFalse(sut.isDeliveryOnly)
  }
  
  func test_isProductDirectFromSupplierAvailable() {
    let sut = makeSUT(isAddToCart: false,
                      isDeliveryOnly: false,
                      isDirectFromSupplier: true,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertFalse(sut.isDirectFromSupplier)
  }
  
  func test_isProductFindMeAvailable() {
    let sut = makeSUT(isAddToCart: false,
                      isDeliveryOnly: false,
                      isDirectFromSupplier: true,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertFalse(sut.isFindMeEnable)
    
    let sut2 = makeSUT(isAddToCart: false,
                      isDeliveryOnly: false,
                      isDirectFromSupplier: true,
                      isFindMeEnable: true,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertTrue(sut2.isFindMeEnable)
  }
  
  func test_isProductInTrolleyAvailable() {
    let sut = makeSUT(isAddToCart: false,
                      isDeliveryOnly: false,
                      isDirectFromSupplier: true,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertFalse(sut.isFindMeEnable)
    
    let sut2 = makeSUT(isAddToCart: false,
                       isDeliveryOnly: false,
                       isDirectFromSupplier: true,
                       isFindMeEnable: true,
                       isInTrolley: true,
                       isInWishlist: false)
    XCTAssertTrue(sut2.isInTrolley)
  }
  
  func test_isProductInWishListAvailable() {
    let sut = makeSUT(isAddToCart: false,
                      isDeliveryOnly: false,
                      isDirectFromSupplier: true,
                      isFindMeEnable: false,
                      isInTrolley: false,
                      isInWishlist: false)
    XCTAssertFalse(sut.isInWishlist)
    
    let sut2 = makeSUT(isAddToCart: false,
                       isDeliveryOnly: false,
                       isDirectFromSupplier: true,
                       isFindMeEnable: true,
                       isInTrolley: true,
                       isInWishlist: true)
    XCTAssertTrue(sut2.isInWishlist)
  }

  private func makeSUT(isAddToCart: Bool,
                       isDeliveryOnly: Bool,
                       isDirectFromSupplier: Bool,
                       isFindMeEnable: Bool,
                       isInTrolley: Bool,
                       isInWishlist: Bool) -> Product {
    let proudctsStr = """
      {
      "title": "Barossa Shiraz",
      "id": "686166",
      "imageURL": "https://media.danmurphys.com.au/dmo/product/686166-1.png?impolicy=PROD_SM",
      "price": [
        {
          "message": "in any six",
          "value": 17.90,
          "isOfferPrice": false
        }
      ],
      "brand": "Little Giant",
      "badges": [
        "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"
      ],
      "ratingCount": 4.4853,
      "messages": {
        "sash": {
          
        }
      },
      "isAddToCartEnable": true,
      "addToCartButtonText": "Add to cart",
      "isInTrolley": false,
      "isInWishlist": false,
      "purchaseTypes": [
        {
          "purchaseType": "Bottle",
          "displayName": "per bottle",
          "unitPrice": 19.03,
          "minQtyLimit": 1,
          "maxQtyLimit": 96,
          "cartQty": 0
        },
        {
          "purchaseType": "Case",
          "displayName": "per case of 6",
          "unitPrice": 107.8,
          "minQtyLimit": 1,
          "maxQtyLimit": 16,
          "cartQty": 0
        }
      ],
      "isFindMeEnable": false,
      "saleUnitPrice": 19.03,
      "totalReviewCount": 68,
      "isDeliveryOnly": false,
      "isDirectFromSupplier": false
    }
"""
    let productData = try! JSONDecoder().decode(Product.self, from: Data(proudctsStr.utf8))
    let product = Product(citrusID: productData.citrusID, title: productData.title, id: productData.id, imageURL: productData.imageURL, price: productData.price, brand: productData.brand, badges: productData.badges, ratingCount: productData.ratingCount, messages: productData.messages, isAddToCartEnable: isAddToCart, addToCartButtonText: productData.addToCartButtonText, isInTrolley: isInTrolley, isInWishlist: isInWishlist, purchaseTypes: productData.purchaseTypes, isFindMeEnable: isFindMeEnable, saleUnitPrice: productData.saleUnitPrice, totalReviewCount: productData.totalReviewCount, isDeliveryOnly: isFindMeEnable, isDirectFromSupplier: isFindMeEnable)
    return product
    
  }
}
