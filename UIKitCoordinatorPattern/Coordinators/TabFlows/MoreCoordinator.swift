import UIKit
import SwiftUI

protocol MoreCoordinatorDelegate: AnyObject {
    func onMoreLogoutTapped(coordinator: MoreCoordinator)
}

class MoreCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MoreCoordinatorDelegate?
    
    override func start() {
        showMoreScreen()
    }
    
}

// MARK: - Showing screens
extension MoreCoordinator {
    
    
    func showMoreScreen() {
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "More"
        
        prasenter.setViewControllers([controller], animated: true)
    }
    
    func showAccountScreen() {
        let viewModel = AccountVIew.ViewModel()
        viewModel.navDelegate = self
        
        let view = AccountVIew(viewModel: viewModel)
        let controller = AccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        
        prasenter.pushViewController(controller, animated: true)
    }
}

// MARK: - MoreViewNavDelegate
extension MoreCoordinator: MoreViewNavDelegate {
    func OnMoreViewAccountTapped() {
        showAccountScreen()
    }
    
    func OnMoreViewLocationTapped() {
        
    }
    
    func OnMoreViewUpgradeTapped() {
        
    }
}

// MARK: - AccountViewNavDelegate
extension MoreCoordinator: AccountNavDelegate {
    func onAccountBackTapped() {
        prasenter.popViewController(animated: true)
    }
    
    func onAccountExitTapped() {
        
    }
    
    func onAccountEditTapped() {
        
    }
    
    func onAccountLogoutTapped() {
        delegate?.onMoreLogoutTapped(coordinator: self)
    }
    
}
