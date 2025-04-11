import SwiftUI


struct ListRow: View {
    
    var title: String
    var trailingText: String?
    var systemImageName: String?
    
    var showTrailingChavron = false
    var action: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            HStack {
                if let systemImageName {
                    Image(systemName: systemImageName)
                        .frame(width: 20)
                }
                Text(title)
                
                Spacer()
                
                if let trailingText {
                    Text(verbatim: trailingText)
                }
                
                if showTrailingChavron {
                    Image(systemName: "chavron.right")
                }
            }
            .padding(.trailing, 20)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.5))
                .frame(height: 1)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action?()
        }
        .padding(.leading, 20)
        .padding(.top, 5)
    }
    
}


#Preview {
    ListRow(title: "Email", trailingText: "john@gmail.com", systemImageName: "person.fill")
}
