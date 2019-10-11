//
//  RegisterView.swift
//  Kuchi
//
//  Created by Jan Hovland on 06/10/2019.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    // @State var name: String = ""
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var keyboardHandler: KeyboardFollower
    
    init(keyboardHandler: KeyboardFollower) {
        self.keyboardHandler = keyboardHandler
    }
    
    var body: some View {
        
        VStack(content: {
            WelcomeMessageView()
            
            TextField("Type your name...", text: $userManager.profile.name)
            .bordered()
            
            HStack {
              // 1 Push the text to the right
              Spacer()
              // 2
            Text("\(userManager.profile.name.count)")
                .font(.caption)
                // 3
                .foregroundColor(
                  userManager.isUserNameValid() ? .green : .red)
                .padding(.trailing)
            }
            // 4 Add some spaceing from thr OK button
            .padding(.bottom)
                        
            
            Button(action: self.registerUser) {
              // 1
              HStack {
                // 2
                Image(systemName: "checkmark")
                  .resizable()
                  // 3
                  .frame(width: 16, height: 16, alignment: .center)
                Text("OK")
                  // 4
                  .font(.body)
                  .bold()
              }
            }
              // 5
              .bordered()
                .disabled(!userManager.isUserNameValid())

        })
        .padding(.bottom, keyboardHandler.keyboardHeight)
        .background(WelcomeBackgroundImage())
        .padding()
        .onAppear { self.keyboardHandler.subscribe() }
        .onDisappear { self.keyboardHandler.unsubscribe() }
    }
}

struct RegisterView_Previews: PreviewProvider {
    
    // Error message if name is empty in Preview
    // Otherwide OK on iPhone
    
    static let user = UserManager(name: "Ray")
    
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
        .environmentObject(user)
    }
}

// MARK: - Event Handlers
extension RegisterView {
  func registerUser() {
    // print("Button triggered")
    userManager.persistProfile()
  }
}


