import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var userManager = UserManager.shared
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.93, blue: 1.0).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Register")
                    .font(.system(size: 32, weight: .light))
                    .foregroundColor(Color(red: 0.8, green: 0.2, blue: 0.2))
                
                VStack(spacing: 20) {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: handleRegister) {
                        Text("Register")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.8, green: 0.2, blue: 0.2))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        .alert(errorMessage, isPresented: $showError) {
            Button("OK", role: .cancel) { }
        }
    }
    
    private func handleRegister() {
        if username.isEmpty || password.isEmpty {
            errorMessage = "Please fill all fields"
            showError = true
            return
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords don't match"
            showError = true
            return
        }
        
        if userManager.registerUser(username: username, password: password) {
            dismiss()
        } else {
            errorMessage = "Username already exists"
            showError = true
        }
    }
} 