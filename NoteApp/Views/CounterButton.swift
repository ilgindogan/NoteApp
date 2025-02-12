import SwiftUI

struct CounterButton: View {
    let action: () -> Void
    let symbol: String
    let color: Color
    
    init(action: @escaping () -> Void, symbol: String, color: Color = .blue) {
        self.action = action
        self.symbol = symbol
        self.color = color
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: symbol)
                .font(.system(size: 32, weight: .light))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(
                    color.opacity(0.9)
                        .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 4)
                )
                .clipShape(Circle())
        }
    }
} 