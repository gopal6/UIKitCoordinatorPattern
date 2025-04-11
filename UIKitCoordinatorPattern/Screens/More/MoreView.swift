import SwiftUI

struct MoreView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ListRow(title: "Account", systemImageName: "person.crop.circle") {
                    viewModel.onAccountTapped()
                }
                ListRow(title: "More")
                ListRow(title: "Logout")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MoreView(viewModel: .init())
}


