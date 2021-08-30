//
//  SignInView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct SignInView: View {
    
    @State var emailValue = ""
    @State var passwordValue = ""
    
    @State var isSignUP = false
    @State var isLogin = false
    
    var body: some View {
        NavigationView{
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
                        .padding(.bottom, 30)
                    
                    AuthSideTextFieldView(title: "Email",placeHolder: "Email Address", iconTitle: "user", textFieldValue: $emailValue)
                    AuthSideTextFieldView(title: "Password",placeHolder: "********", iconTitle: "show", textFieldValue: $passwordValue)
                        
                    
                    //MARK: Login Action
                    NavigationLink(
                        destination: MainTabView(),
                        isActive: $isLogin,
                        label: {
                    AuthButtonView(title: "Login") {
                        isLogin.toggle()
                    }
                    .padding(.top, 20)
                        })
                }
                
            }
            .frame(width: GetRect().width * 0.9, height: 350)
            .padding()
            HStack {
                Text("Do you want to Sign Up?")
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(Color.gray)
                
                NavigationLink(
                    destination: SignUpView(),
                    isActive: $isSignUP,
                    label: {
                        Button(action: {
                            isSignUP.toggle()
                        }, label: {
                            Text("Create")
                                .font(.custom("Rubik-Regular", size: 14))
                                .foregroundColor(.accentColor)
                                .underline()
                    })
                    })
             
            }
            
        }
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .overlay(
                Image("topCorner")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                , alignment: .topTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            )
                
    }


        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    
        
        
       
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

