import UIKit
import Foundation


protocol MainCoordinatorDelegate: AnyObject {
    func onMainCoordinationComplete(coordinator: MainCoordinator)
}

enum NavigationBarTag: Int {
    case home
    case location
    case more
}

class MainCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        prasenter.setNavigationBarHidden(true, animated: false)
        
        showTabBarView()
    }
}

// MARK: - Shwoing Screens
private extension MainCoordinator {
    func showTabBarView() {
        let homeCoordinator = configureHomeCoordinator()
        let locationCoordinator = configureLocationCoordinator()
        let moreCoordinator = configureMoreCoordinator()
        
        let controllers = [
            homeCoordinator.prasenter, // HomeViewController
            locationCoordinator.prasenter, //LocationViewControoler
            moreCoordinator.prasenter // MoreViewController
        ]
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(controllers, animated: false)
        
        prasenter.setViewControllers([tabBarController], animated: true)
    }
}

// MARK: - Sub Coordinator
private extension MainCoordinator {
    
    func configureHomeCoordinator() -> HomeCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: NavigationBarTag.home.rawValue
            )
        
        let coordinator = HomeCoordinator(prasenter: flowPresenter)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureLocationCoordinator() -> LocationeCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "Location",
            image: UIImage(systemName: "location"),
            tag: NavigationBarTag.location.rawValue
            )
        
        let coordinator = LocationeCoordinator(prasenter: flowPresenter)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureMoreCoordinator() -> MoreCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(
            title: "More",
            image: UIImage(systemName: "line.3.horizontal"),
            tag: NavigationBarTag.home.rawValue
            )
        
        let coordinator = MoreCoordinator(prasenter: flowPresenter)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
}

// MARK: - HomeNavDelegate
extension MainCoordinator {
    
}

// MARK: - MoreNavDelegate
extension MainCoordinator: MoreCoordinatorDelegate {
    func onMoreLogoutTapped(coordinator: MoreCoordinator) {
        delegate?.onMainCoordinationComplete(coordinator: self)
        self.free(coordinator: coordinator)
    }
}

