//
//  WelcomeMessageView.swift
//  Kuchi
//
//  Created by Jan Hovland on 06/10/2019.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import SwiftUI

struct WelcomeMessageView: View {
    var body: some View {
        HStack {
          LogoImage()
          
          VStack(alignment: .leading) {
            Text("Welcome to")
              .font(.headline)
              .bold()
            Text("Kuchi")
              .font(.largeTitle)
              .bold()
          }
          .foregroundColor(.red)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
          .padding(.horizontal)
        }
    }
}

struct WelcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeMessageView()
    }
}
