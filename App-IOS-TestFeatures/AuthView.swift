import SwiftUI

private class AuthViewModel: ObservableObject {
    @Published var nameText: String = ""
    @Published var namePlaceHolderText: String = "Your name"
    @Published var emailText: String = ""
    @Published var emailPlaceholderText: String = "Your email"
    @Published var passText: String = ""
    @Published var passPlaceholderText: String = "Your password"
    @Published var signedIn: Bool = false
    @Published var incorrectName: Bool = false

    func signUpButtonPressed() {
        if passText.count < 6 {
            incorrectName = true
        }
         else if !nameText.isEmpty && !emailText.isEmpty && !passText.isEmpty {
            signedIn = true
        }
        else {

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
                    .alert(isPresented: $vm.incorrectName, content: {
                        Alert(
                                title: Text("Wrong password length"),
                                message: Text("Password must be at least 6 characters long."))
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
