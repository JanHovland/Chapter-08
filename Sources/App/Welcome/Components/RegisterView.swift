//
//  RegisterView.swift
//  Kuchi
//
//  Created by Jan Hovland on 06/10/2019.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @ObservedObject var keyboardHandler: KeyboardFollower
    
    init(keyboardHandler: KeyboardFollower) {
        self.keyboardHandler = keyboardHandler
    }
    
    var body: some View {
        
        VStack(content: {
            WelcomeMessageView()
            
            TextField("Type your name...", text: $name)
            .bordered()
            
            Button(action: self.registerUser) {
              Text("OK")
            }
                
            
        })
        .padding(.bottom, keyboardHandler.keyboardHeight)
        .background(WelcomeBackgroundImage())
        .padding()
        .onAppear { self.keyboardHandler.subscribe() }
        .onDisappear { self.keyboardHandler.unsubscribe() }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
    }
}

// MARK: - Event Handlers
extension RegisterView {
  func registerUser() {
    print("Button triggered")
  }
}


