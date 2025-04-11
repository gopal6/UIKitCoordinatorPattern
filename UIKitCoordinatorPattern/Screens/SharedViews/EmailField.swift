import SwiftUI

struct EmailField: View {
    
    @Binding var value: String
    var placeholder: String = "Email"
    
    var body: some View {
        TextField(placeholder, text: $value)
            .textFieldStyle(DefaultTextFieldStyle())
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    EmailField(value: .constant(""))
}
