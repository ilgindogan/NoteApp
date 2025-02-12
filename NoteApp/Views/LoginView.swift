import SwiftUI

struct LoginView: View {
    @StateObject private var userManager = UserManager.shared
    @State private var username = ""
    @State private var password = ""
    @State private var showError = false
    @State private var showRegister = false
    @State private var errorMessage = "Invalid username or password"
    
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.background.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text("Counter App")
                        .font(.system(size: 32, weight: .light))
                        .foregroundColor(AppColors.accent)
                    
                    VStack(spacing: 20) {
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        Button(action: handleLogin) {
                            Text("Login")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(red: 0.8, green: 0.2, blue: 0.2))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        Button(action: { showRegister = true }) {
                            Text("Register")
                                .foregroundColor(Color(red: 0.8, green: 0.2, blue: 0.2))
                        }
                    }
                    .padding()
                }
            }
            .sheet(isPresented: $showRegister) {
                RegisterView()
            }
            .alert(errorMessage, isPresented: $showError) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    private func handleLogin() {
        if username.isEmpty || password.isEmpty {
            errorMessage = "Please fill all fields"
            showError = true
            return
        }
        
        if !userManager.login(username: username, password: password) {
            errorMessage = "Invalid username or password"
            showError = true
        }
    }
} 