import SwiftUI

struct CounterDisplay: View {
    let count: Int
    
    var body: some View {
        Text("\(count)")
            .font(.system(size: 96, weight: .light))
            .foregroundColor(Color(red: 0.8, green: 0.2, blue: 0.2))
            .padding(.vertical, 40)
    }
} 