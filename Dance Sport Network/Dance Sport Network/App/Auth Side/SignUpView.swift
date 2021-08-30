//
//  SignUp.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct SignUpView: View {
  
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var nameValue = ""
    @State var usernameValue = ""
    @State var emailValue = ""
    @State var passwordValue = ""
    @State var locationValue = ""
    
    @State var isSignUP = false
    @State var isLogin = false
    
    var body: some View {
        
        VStack {
           
            Image("Logo2")
            Image("name")
            
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .accentColor, radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    
                
                VStack{
                    
                    Text("WELCOME")
                        .font(.custom("Rubik-SemiBold", size: 24))
                        .foregroundColor(Color.black)
                        .padding(10)
                    
                    Text("CREATE YOUR ACCOUNT")
                        .font(.custom("Rubik-SemiBold", size: 16))
                        .foregroundColor(Color.black)
                        .padding(.bottom, 30)
                    
                    AuthSideTextFieldView(title: "Name",placeHolder: "Full Name", iconTitle: "user", textFieldValue: $nameValue)
                    AuthSideTextFieldView(title: "Username",placeHolder: "User Name", iconTitle: "user", textFieldValue: $usernameValue)
                    AuthSideTextFieldView(title: "Email",placeHolder: "Email Address", iconTitle: "email", textFieldValue: $emailValue)
                    AuthSideTextFieldView(title: "Password",placeHolder: "********", iconTitle: "show", textFieldValue: $passwordValue)
                    AuthSideTextFieldView(title: "Location",placeHolder: "Email Address", iconTitle: "location", textFieldValue: $locationValue)
                  
                        
                    
                    //MARK: Login Action
                    AuthButtonView(title: "Let's get started") {
                        
                    }
                    .padding(.top, 20)
                    
                }
                
            }
            .frame(width: GetRect().width * 0.9)
            .padding()
            HStack {
                Text("Already have an account?")
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(Color.gray)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Login")
                        .font(.custom("Rubik-Regular", size: 14))
                        .foregroundColor(.accentColor)
                        .underline()
            })
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .overlay(
                Image("topCorner")

                , alignment: .topTrailing)
            )
       
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
