//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) private var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.userInfo.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
            
            Button(action:logout) {
                Text("Logout")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(width: 200, height: 60)
            .background(.gray)
            .clipShape(.rect(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 4)
                    
            }
        }
    }
    
    private func logout() {
        storageManager.logout()
        loginViewVM.userInfo.isLoggedIn.toggle()
        loginViewVM.userInfo.name.removeAll()
        loginViewVM.validate()
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @Bindable var contentViewVM: ContentViewViewModel
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
