import SwiftUI
import UIKit

protocol AccountNavDelegate: AnyObject {
    func onAccountBackTapped()
    func onAccountExitTapped()
    func onAccountEditTapped()
    func onAccountLogoutTapped()
}

extension AccountVIew {

    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: AccountNavDelegate?
        var showExitButton = false
    }
}

// MARK: - Actions
extension AccountVIew.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onAccountBackTapped()
    }
    
    func onEditTapped() {
        navDelegate?.onAccountEditTapped()
    }
    
    func onExitTapped() {
        navDelegate?.onAccountExitTapped()
    }
    
    func onLogoutTapped() {
        navDelegate?.onAccountLogoutTapped()
    }
}
