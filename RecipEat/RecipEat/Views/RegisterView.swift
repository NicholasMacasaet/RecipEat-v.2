//
//  RegisterView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var password = ""
    @State var email = ""

    
    
    var body: some View {
        VStack{
            HeaderView(smallTitle: "Start today and", mainTitle: "Register !", angle: -13, background: Color("Royal Blue"))
            
            
            Form{
                TextField("Name",text: $name )
                    .foregroundColor(Color("Midnight Purple"))
                TextField("Email",text: $email )
                SecureField("Password",text: $password )
                REButton(title: "Register", background: Color("Royal Blue")){
                    
                }
            }
            
            
        
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
