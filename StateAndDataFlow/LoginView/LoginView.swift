//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    let storageManager = StorageManager.shared
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.userInfo.name)
                    .multilineTextAlignment(.center)
                    .onChange(of: loginViewVM.userInfo.name, { _, _ in
                        loginViewVM.validate()
                    })
                
                Text("\(loginViewVM.userInfo.name.count)")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(loginViewVM.characterCounterColor)
            }
            .padding()
                
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    
            }
            .disabled(loginViewVM.buttonDisabler)
        }
    }
    
    private func login() {
        if !loginViewVM.userInfo.name.isEmpty {
            loginViewVM.userInfo.isLoggedIn.toggle()
            storageManager.login( loginViewVM.userInfo)
            
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
