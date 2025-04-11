import UIKit


protocol AuthCoordinatorDelegate: AnyObject {
    func onAuthCoordinationCompleted(authCoordinator: AuthCoordinator)
}


class AuthCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: AuthCoordinatorDelegate?
    
    override func start() {
        showLoginScreen()
    }
}

// MARK: - Showing Screens
extension AuthCoordinator {
    
    func showLoginScreen() {
        let viewModel = LoginView.ViewModel()
        viewModel.navDelegate = self
        
        let view = LoginView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Login"
        
        prasenter.setViewControllers([controller], animated: true)
    }
    
    
    func showRegisterScreen() {
        let viewModel = RegisterView.ViewModel()
        viewModel.navDelegate = self
        
        let view = RegisterView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Register"
        prasenter.pushViewController(controller, animated: true)
    }
}

// MARK: - LoginNavDelegate
extension AuthCoordinator: LoginNavDelegate {
    
    func onLoginRegisterTapped() {
        showRegisterScreen()
    }
    
    func onLoginLoginSuccessfull() {
        self.delegate?.onAuthCoordinationCompleted(authCoordinator: self)
    }
}

// MARK: - RegisterNavDelegate
extension AuthCoordinator: RegisterNavDelegate {
    func onRegisterComplete() {
        showLoginScreen()
    }
    
    func onRegisterLoginTapped() {
        showLoginScreen()
    }
}

