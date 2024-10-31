//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @State private var contentViewVM = ContentViewViewModel()
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(contentViewVM)
        .environmentObject(loginViewVM)
    }
        
}
