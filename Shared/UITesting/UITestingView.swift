import SwiftUI

class UITestingViewModel: ObservableObject {
    
    let placeholderTest = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var userSignedIn: Bool = false
    
    func signUpBottonPressed() {
        if !textFieldText.isEmpty {
            userSignedIn = true
        }
    }
    
}

struct UITestingView: View {
    
    @StateObject private var vm = UITestingViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
            gradient: Gradient(colors: [Color.blue, Color.black]),
            startPoint: .topLeading, endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ZStack {
                if vm.userSignedIn {
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                else {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
            
        }
    }
}

struct UITestingView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingView()
    }
}

extension UITestingView {
    
    private var signUpLayer: some View {
        
        VStack {
            TextField(vm.placeholderTest, text: $vm.textFieldText)
                .font(Font.title2)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
            Button(action: {
                withAnimation(.spring()) {
                    vm.signUpBottonPressed()
                }
            }, label: {
                Text("Sign Up")
                    .font(Font.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(20)
            })
            
        }
        .padding()
        
    }
}

struct SignedInHomeView: View {
    
    @State private var showAlert:Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show welcome alert!")
                        .font(Font.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(20)
                })
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcone to the app."))
                })
                
                NavigationLink(destination: {
                    Text("Destination")
                }, label: {
                    Text("Navigate")
                        .font(Font.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                })
                
            }
            .padding()
            .navigationTitle("Welcome!")
        }
        
    }
    
}
