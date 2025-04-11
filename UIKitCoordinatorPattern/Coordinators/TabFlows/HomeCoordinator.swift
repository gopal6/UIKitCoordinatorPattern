import UIKit
import SwiftUI


class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showHomeScreen()
    }
    
}

// MARK: - Shwoing Screens
extension HomeCoordinator {
    
    func showHomeScreen() {
        let view = HomeView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Home"
        
        prasenter.setViewControllers([controller], animated: true)
    }
}

