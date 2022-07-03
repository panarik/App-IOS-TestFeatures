import SwiftUI

struct ContentView: View {
    
    @State private var score = 5
    @State private var continueActive: Bool = false
    
    private let continueButton = "Continue"
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image("login-secure")
                
                // Sign in with credentials block
                HStack(alignment: .center) {
                    
                    // User credentials
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        TextField("Your Name", text: .constant(""))
                            .padding([.top, .bottom], 10)
                        TextField("Your Email", text: .constant(""))
                            .padding([.top, .bottom], 10)
                        TextField("Your Password", text: .constant(""))
                            .padding([.top, .bottom], 10)
                    }
                    .padding(.leading, 40.0)
                    
                    // User actions buttons
                    VStack(spacing: 2.0) {
                        Button("SIGN UP") {
                            print("SIGN UP")
                        }
                        .padding(8)
                        
                        Button("Log In") {
                            print("Log In")
                        }
                        .padding(8)
                        
                    }
                    .padding(.trailing, 40.0)
                    
                }
                .padding(.bottom, 40)
                
                Spacer()
                
                // General buttons
                NavigationLink(destination: LandmarkListView(), isActive: $continueActive) {
                    Button(action: {
                        continueActive = true
                        print("CONTINUE")
                    }, label: {
                        HStack {
                            Image(systemName: "figure.walk.diamond.fill")
                            Text(continueButton).bold().dynamicTypeSize(.xxxLarge)
                        }
                    })
                    .padding()
                }
                
            }
            .padding(.vertical, 30)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .opacity(1.0)
    }
}
