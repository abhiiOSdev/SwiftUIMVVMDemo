//
//  HeartButton.swift
//  SwiftUIMVVMDemo
//
//  Created Abhishek Karkar  on 04/25/23.
//

import SwiftUI

class HeartsProvider: ObservableObject {
  @Published var hearts: [String] = []
  
  func isHearted(id: String) -> Bool {
    return hearts.contains(id)
  }
  
  func toggle(id: String) {
    if isHearted(id: id) {
      hearts = hearts.filter { $0 != id }
    } else {
      hearts.append(id)
    }
  }
}

struct HeartButton: View {
  @State var isLikded: Bool
  var function:() -> Void
  var body: some View {
    Button(action: {
      self.function()
      isLikded.toggle()
    }, label: {
      Image(systemName: isLikded ? "star.fill" : "star")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100)
        .foregroundColor(isLikded ? .red : .black)
    }).buttonStyle(PlainButtonStyle())
    
  }
}

struct HeartButton_Previews: PreviewProvider {

    static var previews: some View {
      HeartButton(isLikded: true, function: {})
    }
}
