//
//  ProductRow.swift
//  SwiftUIMVVMDemo
//
//  Created Abhishek Karkar  on 04/25/23.
//

import SwiftUI

struct ProductRow: View {
  var product: Product
  @EnvironmentObject var heartsProvider: HeartsProvider
  var function:() -> Void
  
  var body: some View {
    VStack(alignment: .center){
      ZStack(alignment: .topTrailing) {
        URLImageView(urlString: product.imageURL ?? " ")
        
        HeartButton(isLikded: heartsProvider.isHearted(id:product.id!),
                    function:{
          heartsProvider.toggle(id: product.id!)
          self.function()
        })
        .frame(width: 40, height: 40)
        
      }
      Text(product.title!).bold()
      Text("\(product.saleUnitPrice!)").bold()
    }
  }
}

