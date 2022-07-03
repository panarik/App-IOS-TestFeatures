import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = Color.blue
    let secondary: Color = Color.white
    var background: Color = Color.gray
}

struct SecondaryColorTheme: ColorThemeProtocol {
    let primary: Color = Color.red
    let secondary: Color = Color.white
    var background: Color = Color.black
}

class DefaultBottonText: BottonCurrentProtocol {
    var text: String = "Apply new style!"
    func presed() {
        print("Button was pressed.")
    }
}

// First protocol with variables.
protocol ColorThemeProtocol {
    var primary: Color { get } // Get only variable rule.
    var secondary: Color { get }
    var background: Color { get set } // Can be getted and setted.
}

protocol BottonTextProtocol {
    var text: String { get }
}

// Second protocol with functions
protocol BottonPressedProtocol {
    func presed()
}

// Inherited protocol.
protocol BottonCurrentProtocol: BottonTextProtocol, BottonPressedProtocol {
}


struct ProtocolsExample: View {
    
    @State var colorTheme: ColorThemeProtocol = SecondaryColorTheme()
    @State var bottonText: BottonCurrentProtocol = DefaultBottonText()
    @State var toggleIsOn: Bool = false
    
    func changeTheme() {
        if toggleIsOn {
            colorTheme = SecondaryColorTheme()
        } else {
            colorTheme = DefaultColorTheme()
        }
    }
    
    var body: some View {
        
        ZStack {
            colorTheme.background
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Text("Apply new style!")
                    .font(Font.title)
                    .foregroundColor(colorTheme.secondary)
                    .padding()
                    .background(colorTheme.primary)
                    .cornerRadius(10)
                    .onTapGesture {
                        self.changeTheme()
                        bottonText.presed()
                    }
                Toggle(
                    isOn: $toggleIsOn,
                    label: {Text(toggleIsOn ? "Secondary style" : "Default style")
                            .font(Font.title3)
                            .foregroundColor(colorTheme.secondary)
                            .padding()
                    })
                .toggleStyle(SwitchToggleStyle(tint: colorTheme.primary))
                
            }
            .padding(.horizontal, 80)
            .padding(.bottom, 40)
        }
        
        
    }
}

struct Protocol_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolsExample()
    }
}
