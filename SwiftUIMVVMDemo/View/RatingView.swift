//
//  RatingView.swift
//  SwiftUIMVVMDemo
//
//  Created Abhishek Karkar  on 04/25/23.
//

import SwiftUI

struct RatingView: View {
  @State var rating: Int
  @State var label = ""
  var maximumRating = 5
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  var offColor = Color.gray
  var onColor = Color.yellow
  
  var body: some View {
    VStack(alignment: .leading, spacing: 2) {
      HStack {
        ForEach(1..<maximumRating + 1, id: \.self) { number in
          image(for: number)
            .foregroundColor(number > rating ? offColor : onColor)
            .onTapGesture {
              rating = number
            }
        }
      }
      if label.isEmpty == false {
        Text(label)
      }
    }
  }
  
  func image(for number: Int) -> Image {
    if number > rating {
      return offImage ?? onImage
    } else {
      return onImage
    }
  }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
      RatingView(rating: 4, label: "Rating: 4")
    }
}
