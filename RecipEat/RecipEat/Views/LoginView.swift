//
//  ContentView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack{
            //Color("Midnight Purple")
            NavigationView{
                VStack {
                    //Header
                    HeaderView(smallTitle: "Welcome to ...", mainTitle: "RecipEat", angle: 15, background: Color("Ube Purple"))
                    
                    //Login Form
                    Form{
                        TextField("Email",text: $email )
                            .foregroundColor(Color("Midnight Purple"))
                        SecureField("Password",text: $email )
                        REButton(title: "Login", background: Color("Ube Purple")){
                            //do something
                        }
                    }
                    //Registration Link
                    VStack{

                        Text("New Around here ?")
                        NavigationLink("Create an Account !", destination:RegisterView())
                            .foregroundColor(Color("Ube Purple"))
                        Spacer()
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
