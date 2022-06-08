//
//  ContentView.swift
//  Swift-IOS-Features
//
//  Created by panarik on 6/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score = 5
    
    private let continueButton = "Continue"
    
    var body: some View {
        
        VStack {
            
            Image("login-secure")
            
            // Sign in with credentials block
            HStack(alignment: .center) {
                
                // User credentials
                VStack(alignment: .leading, spacing: 0.0) {
                      
                    TextField("Your Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding([.top, .bottom], 10)
                    TextField("Your Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding([.top, .bottom], 10)
                    TextField("Your Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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

                Button(action: {
                    print("CONTINUE")
                }, label: {
                    HStack {
                        Image(systemName: "figure.walk.diamond.fill")
                        Text(continueButton).bold().dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                    }
                })
                .padding()

            
//            Text("Placeholder")
//                .bold()
//                .padding(10)
//                .background(Color(hue: 0.0, saturation: 0.0, brightness: 0.7).blur(radius: 10))
//                .cornerRadius(15)
            
        }
        .padding(.vertical, 30)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            
    }
}
