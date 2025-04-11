import UIKit
import SwiftUI

class AppCoordinator: BaseCoordinator<UINavigationController> {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        let prasenter = UINavigationController()
        prasenter.isToolbarHidden = true
        
        super.init(prasenter: prasenter)
        
        self.window.rootViewController = prasenter
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
//        if isLoggedIn {
//            startMain()
//        } else {
            startAuth()
        //}
    }
}

// MARK: - Shwoing Screens
extension AppCoordinator {
    
    func startAuth() {
        let authCoordinator = AuthCoordinator(prasenter: prasenter)
        authCoordinator.delegate = self
        authCoordinator.start()
        
        self.store(coordinator: authCoordinator)
    }
    
    func startMain() {
        
        let mainCoordinator = MainCoordinator(prasenter: prasenter)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        
        self.store(coordinator: mainCoordinator)
    }
}


// MARK: - AuthCoordinatorDelegate
extension AppCoordinator: AuthCoordinatorDelegate {
    func onAuthCoordinationCompleted(authCoordinator: AuthCoordinator) {
        startMain()
        self.free(coordinator: authCoordinator)
    }
}

// MARK: - MainCoordinatorDelegate
extension AppCoordinator: MainCoordinatorDelegate {
    
    func onMainCoordinationComplete(coordinator: MainCoordinator) {
        startAuth()
        self.free(coordinator: coordinator)
    }
    
}
