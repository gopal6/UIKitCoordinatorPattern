
import SwiftUI

private enum Constants {
    static let avatarBackgroundSize: CGFloat = 70
    static var avatarSize: CGFloat {  (avatarBackgroundSize * 0.5) }
}

struct AccountVIew: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Avatar image
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray.opacity(0.5))
                        
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: Constants.avatarSize,
                                height: Constants.avatarSize
                            )
                    }
                    .frame(
                        width: Constants.avatarBackgroundSize,
                        height: Constants.avatarBackgroundSize
                    )
                    
                    Text("John Smith")
                        .padding(.top, 20)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    ListRow(title: "Email", trailingText: "john@email.com")
                }
                .padding(.top, 20)
            }
            
            Button("Edit Account") {
                viewModel.onEditTapped()
            }
            .padding(.bottom, 10)
            
            Button("Logout") {
                viewModel.onLogoutTapped()
            }
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AccountVIew(viewModel: .init())
}
