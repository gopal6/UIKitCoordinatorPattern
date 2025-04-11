import SwiftUI


struct PasswordField: View {
    
    @Binding var value: String
    var placeholder: String = "Password"
    
    var body: some View {
        VStack {
            SecureField(placeholder, text: $value)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
        }
    }
}

