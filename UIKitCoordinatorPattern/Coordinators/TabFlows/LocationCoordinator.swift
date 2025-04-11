import UIKit
import SwiftUI


class LocationeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showLocationScreen()
    }
    
}

// MARK: Showing screens
private extension LocationeCoordinator {
    
    func showLocationScreen() {
        let view = LocationView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Location"
        
        prasenter.setViewControllers([controller], animated: true)
    }
}
