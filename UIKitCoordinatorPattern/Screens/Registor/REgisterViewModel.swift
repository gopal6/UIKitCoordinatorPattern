import Foundation
import Combine
import SwiftUI

protocol RegisterNavDelegate: AnyObject {
    func onRegisterComplete()
    func onRegisterLoginTapped()
}

extension RegisterView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        @Published var confirmPassword = ""
        
        @Published var showAlert = false
        var alertTitle = ""
        var alertMessage = ""
        var registerationSuccessfull = false
        
        weak var navDelegate: RegisterNavDelegate?
    }
}

// MARK: - Action
extension RegisterView.ViewModel {
    
    func onRegisterTapped() {
        registerationSuccessfull = true
        alertTitle = ""
        alertMessage = ""
        showAlert = true
    }
    
    func onLoginTapped() {
        navDelegate?.onRegisterLoginTapped()
    }
}

