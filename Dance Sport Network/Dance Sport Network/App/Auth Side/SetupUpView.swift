//
//  SetupUpView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct SetupUpView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var nameValue = ""
    @State var usernameValue = ""
    @State var bioValue = ""
    @State var calendarValue = ""
    
    @State var isCreate = false
    
    var body: some View {
        
        VStack {
           
            HStack(alignment:.top){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")

                        .foregroundColor(. black)
                })
                .padding(10)
            Spacer()
                VStack {
                    Text("FINISH SETTING UP")
                        .font(.custom("Rubik-Bold", size: 18))
                    Text("YOUR PROFILE")
                        .font(.custom("Rubik-Bold", size: 18))
                }
            Spacer()
                    
            }
            
            Image("dp_empty")
                .resizable()
                .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray)
                )
                .overlay(Image("camera_small")
                            .offset(y:15), alignment: .bottom)
            
            VStack(alignment:.leading) {
                
                //MARK: NAME
                HStack{
                    Text("NAME")
                        .font(.custom("Rubik_Bold", size: 16))
                    Spacer()
                }
                
                TextField("Full Name", text: $nameValue)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accentColor))
                                    
                    .padding(.bottom)
                
                //USERNAME
                HStack{
                    Text("USERNAME")
                        .font(.custom("Rubik_Bold", size: 16))
                    Spacer()
                }
                
                TextField("User Name", text: $nameValue)
                    .font(.custom("Rubik_Bold", size: 14))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accentColor))
                                    
                    .padding(.bottom)
                
                
                //BIO
                HStack{
                    Text("BIO")
                        .font(.custom("Rubik_Bold", size: 16))
                    Spacer()
                }
                
                TextField("Write about you...", text: $nameValue)
                    .font(.custom("Rubik_Bold", size: 14))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accentColor))
                                    
                    .padding(.bottom)
                
                //USERNAME
                HStack{
                    Text("CALENDAR")
                        .font(.custom("Rubik_Bold", size: 16))
                    Text("- OPTIONAL")
                        .font(.custom("Rubik_SemiBold", size: 12))
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                HStack {
                    HStack {
                        Image("Calendar")
                        TextField("Add upcoming events...", text: $nameValue)
                            .font(.custom("Rubik_Bold", size: 14))
                            .padding()
                           
                    }
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accentColor))
                                    
                    .padding(.bottom)
                    
                    Button(action: {
                        
                    }, label: {
                        Image("Add")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(y: -10)
                    })
                }
                
            }.padding(.top)
            
            AuthButtonView(title: "CREATE") {
                
            }
            
            Spacer()
            
        }.padding(10)
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

struct SetupUpView_Previews: PreviewProvider {
    static var previews: some View {
        SetupUpView()
    }
}
