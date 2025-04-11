import Foundation
import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            EmailField(value: $viewModel.email)
                .padding(.bottom, 10)
            
            PasswordField(value: $viewModel.password)
                .padding(.bottom, 10)
            
            PasswordField(value: $viewModel.confirmPassword, placeholder: "Confirm Password")
                .padding(.bottom, 10)
            
            Button("Register") {
                viewModel.onRegisterTapped()
            }
            
            Spacer()
            
            Button("Login") {
                viewModel.onLoginTapped()
            }
        }
        .padding(.horizontal, 50)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("Ok", role: .none) {
                if viewModel.registerationSuccessfull {
                    viewModel.onLoginTapped()
                }
            }
        }
    }
}

#Preview {
    RegisterView(viewModel: .init())
}
