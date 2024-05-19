//
//  ContentView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct LoginView: View {
    
//    @State var email = ""
//    @State var password = ""
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack{
            //Color("Midnight Purple")
            NavigationView{
                VStack {
                    //Header
                    HeaderView(smallTitle: "Welcome to ...", mainTitle: "RecipEat", angle: 15, background: Color("Ube Purple"))
                    
                    
                    
                
                    //Login Form
                    Form{
                        
                        
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color("Ube Purple"))
                        }
                        
                        
                        TextField("Email",text: $viewModel.email )
                            .foregroundColor(Color("Midnight Purple"))
                            .autocapitalization(.none)
                        
                        
                        SecureField("Password",text: $viewModel.password )

                        
                        REButton(title: "Login", background: Color("Ube Purple")){
                            //attempt login
                            viewModel.login()
                        }
                        .padding()
                        
                        
                        
                    }
                    .offset(y:-50)
                    //Registration Link
                    VStack{

                        Text("New Around here ?")
                        NavigationLink("Create an Account !", destination:RegisterView())
                            .foregroundColor(Color("Ube Purple"))
                    
                    }
                    Spacer()
                }
                .padding()
            }
            
            
        }
        
        
    }
}

#Preview {
    LoginView()
}


//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
