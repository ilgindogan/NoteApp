import SwiftUI

struct CounterView: View {
    @StateObject private var counterModel = CounterModel()
    @ObservedObject var userManager: UserManager
    
    // Custom colors
    private let backgroundColor = Color(red: 0.95, green: 0.93, blue: 1.0) // Light lavender
    private let accentColor = Color(red: 0.8, green: 0.2, blue: 0.2) // Deep red
    
    var body: some View {
        ZStack {
            // Background
            backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 40) {
                HStack {
                    Spacer()
                    Button(action: { userManager.logout() }) {
                        Text("Logout")
                            .foregroundColor(accentColor)
                    }
                    .padding()
                }
                
                // Title
                Text("Counter")
                    .font(.system(size: 42, weight: .light))
                    .foregroundColor(accentColor)
                    .padding(.top, 50)
                
                Spacer()
                
                // Display
                CounterDisplay(count: counterModel.count)
                
                Spacer()
                
                // Buttons
                HStack(spacing: 40) {
                    CounterButton(
                        action: counterModel.decrement,
                        symbol: "minus.circle.fill",
                        color: accentColor
                    )
                    
                    CounterButton(
                        action: counterModel.reset,
                        symbol: "arrow.counterclockwise.circle.fill",
                        color: accentColor
                    )
                    
                    CounterButton(
                        action: counterModel.increment,
                        symbol: "plus.circle.fill",
                        color: accentColor
                    )
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    CounterView(userManager: UserManager())
} 