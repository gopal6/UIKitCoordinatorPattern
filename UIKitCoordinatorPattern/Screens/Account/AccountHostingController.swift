import UIKit

class AccountHostingController: HostingController<AccountVIew, AccountVIew.ViewModel> {
    
}

// MARK: - LIfecycle
extension AccountHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - View Setup/Configuration

private extension AccountHostingController {
    
    func setupViews() {
        title = "Account"
        
        if viewModel.showExitButton {
            // Show exit button
            setNavigationExitButton(target: self, selector: #selector(onExitButtonTapped))
        } else {
            // Show custom button
            setCustomBackButton(target: self, selector: #selector(onBackButtonTapped))
        }
    }
}

// MARK: - Actions
extension AccountHostingController {
    
    @objc func onBackButtonTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onExitButtonTapped() {
        viewModel.onExitTapped()
    }
}
