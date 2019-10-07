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
                
            .shadow(color: Color.gray.opacity(0.4),
                radius: 3, x: 1, y: 2)
                
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

    
