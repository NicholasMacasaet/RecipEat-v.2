//
//  RegisterView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct RegisterView: View {
    
//    @State var name = ""
//    @State var password = ""
//    @State var email = ""
    
    @StateObject var viewModel = RegisterViewModel()

    
    
    var body: some View {
        VStack{
            HeaderView(smallTitle: "Start today and", mainTitle: "Register !", angle: -13, background: Color("Royal Blue"))
            
            
            Form{
                TextField("Name",text: $viewModel.name )
                    .foregroundColor(Color("Midnight Purple"))
                    .autocorrectionDisabled()

                TextField("Email",text: $viewModel.email )
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password",text: $viewModel.password )
                REButton(title: "Register", background: Color("Royal Blue")){
                    //attempt registration
                    viewModel.register()
                }
                .padding()
            }
            .offset(y:-50)
            
        
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
