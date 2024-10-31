//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Winky51 on 28.10.2024.
//

import Foundation
import SwiftUI
import Combine

final class StorageManager {
    @AppStorage("name", store: .standard) var name: String = ""
    @AppStorage("isLoggedIn", store: .standard) var isLoggedIn: Bool = false
    
    static let shared = StorageManager()
    
    private init() {}
    
    
    func logout() {
        isLoggedIn.toggle()
        name = ""
        
        print("\(name) \(isLoggedIn)")
    }
    
    func login(_ user: User) {
        isLoggedIn = true
        name = user.name
        print("\(name) \(isLoggedIn)")
    }
    
    func getStatus() -> User {
        print("\(name) \(isLoggedIn)")
         return User(name: name, isLoggedIn: isLoggedIn)
    }
}
