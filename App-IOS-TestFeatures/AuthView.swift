import SwiftUI

private class AuthViewModel: ObservableObject {
    @Published var nameText: String = ""
    @Published var namePlaceHolderText: String = "Your name"
    @Published var emailText: String = ""
    @Published var emailPlaceholderText: String = "Your email"
    @Published var passText: String = ""
    @Published var passPlaceholderText: String = "Your password"
    @Published var signedIn: Bool = false

    func signUpButtonPressed() {
        if !nameText.isEmpty && !emailText.isEmpty && !passText.isEmpty {
            signedIn = true
        }
    }
}

struct AuthView: View {

    @StateObject private var vm: AuthViewModel = AuthViewModel()

    var body: some View {
        VStack {
            if vm.signedIn {
                MainView()
            } else {
                signUpLayer
            }
        }
    }
}

extension AuthView {

    private var signUpLayer: some View {

        VStack {
            Image("login-secure")
                    .padding(.bottom)

            TextField(vm.namePlaceHolderText, text: $vm.nameText)
                    .font(Font.title3)
                    .padding()
                    .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                    .cornerRadius(20)
                    .accessibilityIdentifier("NameTextField")

            TextField(vm.emailPlaceholderText, text: $vm.emailText)
                    .font(Font.title3)
                    .padding()
                    .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                    .cornerRadius(20)
                    .accessibilityIdentifier("EmailTextField")

            TextField(vm.passPlaceholderText, text: $vm.passText)
                    .font(Font.title3)
                    .padding()
                    .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
                    .cornerRadius(20)
                    .accessibilityIdentifier("PassTextField")

            Button(action: {
                vm.signUpButtonPressed()
            }, label: {
                Text("Sign Up")
                        .font(Font.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .accessibilityIdentifier("SignUpButton")
            })
                    .padding(.top)
        }
                .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
