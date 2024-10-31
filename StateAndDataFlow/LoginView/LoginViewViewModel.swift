//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation
import SwiftUI

final class LoginViewViewModel: ObservableObject {
    @Published var userInfo = StorageManager.shared.getStatus()
    
    var buttonDisabler = true
    var characterCounterColor = Color.red
        
    
    
    
    func validate() {
        if userInfo.name.count >= 3 {
            buttonDisabler = false
            characterCounterColor = .green
            
        } else {
            buttonDisabler = true
            characterCounterColor = .red
        }
    }
    
    
}
