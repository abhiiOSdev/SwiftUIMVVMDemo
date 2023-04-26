//
//  URLImageView.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import SwiftUI

struct URLImageView: View {
  let urlString: String
  @State var data: Data?
  
  var body: some View {
    
    if let data = data, let uiimage = UIImage(data: data) {
      Image(uiImage: uiimage)
        .resizable()
        .aspectRatio(contentMode: .fill)
//        .background(Color.gray)
      
    } else {
      Image(systemName: "cart")
        .resizable()
        .aspectRatio(contentMode: .fill)
//        .background(Color.gray)
        .onAppear{
          APIManager.shared.downloadContent(fromUrlString: urlString, completionHandler: { (result) in
            switch result {
              case .success(let imageData):
                  // handle data
                data = imageData
                break
              case .failure(let error):
                debugPrint(error.localizedDescription)
            }
          })
        }
    }
  }
}
