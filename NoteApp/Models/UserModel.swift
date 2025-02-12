import Foundation

struct User: Codable {
    let username: String
    let password: String
}

class UserManager: ObservableObject {
    static let shared = UserManager()
    @Published var isAuthenticated = false
    private let userDefaultsKey = "userCredentials"
    
    init() {}
    
    private func getUsers() -> [User] {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey),
              let users = try? JSONDecoder().decode([User].self, from: data)
        else { return [] }
        return users
    }
    
    private func saveUsers(_ users: [User]) {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    func registerUser(username: String, password: String) -> Bool {
        var users = getUsers()
        
        if users.contains(where: { $0.username == username }) {
            return false
        }
        
        users.append(User(username: username, password: password))
        saveUsers(users)
        print("User registered: \(username)")
        return true
    }
    
    func login(username: String, password: String) -> Bool {
        let users = getUsers()
        print("Available users: \(users)")
        
        guard let user = users.first(where: { $0.username == username }) else {
            print("User not found: \(username)")
            return false
        }
        
        isAuthenticated = user.password == password
        print("Login attempt: \(isAuthenticated)")
        return isAuthenticated
    }
    
    func logout() {
        isAuthenticated = false
    }
} 