// REPLACE EVERYTHING IN HERE WITH YOUR SWIFT CODE
import SwiftUI

// MARK: - Main App
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Main View
struct ContentView: View {
    @State private var counter = 0
    @State private var text = "Hello from Windows!"
    @State private var colorIndex = 0
    
    let colors: [Color] = [.blue, .green, .orange, .purple, .pink, .red]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "apple.logo")
                        .font(.system(size: 60))
                        .foregroundColor(colors[colorIndex])
                    
                    Text("SwiftBuild for Windows")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Built with GitHub Actions 🚀")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.top, 40)
                
                // Counter Section
                VStack(spacing: 15) {
                    Text("Counter: \(counter)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(colors[colorIndex])
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            counter -= 1
                            changeColor()
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                        
                        Button(action: {
                            counter = 0
                        }) {
                            Text("Reset")
                                .font(.headline)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            counter += 1
                            changeColor()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Text Input
                VStack(alignment: .leading, spacing: 10) {
                    Text("Custom Message:")
                        .font(.headline)
                    
                    TextField("Type something...", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("You typed: \(text)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Info Section
                VStack(alignment: .leading, spacing: 8) {
                    InfoRow(icon: "checkmark.circle.fill", 
                           text: "Built from Windows", 
                           color: .green)
                    
                    InfoRow(icon: "arrow.triangle.2.circlepath", 
                           text: "No Mac required", 
                           color: .blue)
                    
                    InfoRow(icon: "square.and.arrow.down.fill", 
                           text: "Sideload with AltStore", 
                           color: .orange)
                }
                .padding()
                
                Spacer()
                
                // Footer
                Text("Made with ❤️ ")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            .padding()
            .navigationTitle("SwiftBuild Demo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func changeColor() {
        colorIndex = (colorIndex + 1) % colors.count
    }
}

// MARK: - Helper Views
struct InfoRow: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 24)
            
            Text(text)
                .font(.body)
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Preview (for Xcode, ignored in build)
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
