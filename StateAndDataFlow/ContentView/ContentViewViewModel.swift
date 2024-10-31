//
//  ContentViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation
import Observation


@Observable final class ContentViewViewModel {
    let storageManager = StorageManager.shared
    var counter = 3
    var buttonTitle = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
    
    func logout() {
        storageManager.logout()
    }
    
    @objc private func updateCounter() {
        
        withObservationTracking {
            
            if counter > 0 {
                counter -= 1
            } else {
                killTimer()
                buttonTitle = "Reset"
            }
        } onChange: {
            print("edited")
        }

        
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        withObservationTracking {
            if buttonTitle == "Reset" {
                counter = 3
                buttonTitle = "Start"
            } else {
                buttonTitle = "Wait..."
            }
        } onChange: {
            print("Edited 2")
        }

        
        
    }
    
}
