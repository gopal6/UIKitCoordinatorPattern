import Foundation


protocol MoreViewNavDelegate: AnyObject {
    func OnMoreViewAccountTapped()
    func OnMoreViewLocationTapped()
    func OnMoreViewUpgradeTapped()
}


extension MoreView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        weak var navDelegate: MoreViewNavDelegate?
    }
}

// MARK: - Actions
extension MoreView.ViewModel {
    
    func onAccountTapped() {
        navDelegate?.OnMoreViewAccountTapped()
    }
    
    func onLocationTapped() {
        navDelegate?.OnMoreViewLocationTapped()
    }
    
    func onUpgradeTapped() {
        navDelegate?.OnMoreViewUpgradeTapped()
    }
}

