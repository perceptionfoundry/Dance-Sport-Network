//
//  ChatTabView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct ChatTabView: View {
    @State var showMessage = false
    @State var isProfile = false
    
    var body: some View {
        
        VStack {
            
            //MARK: TOP
            HStack{
                Spacer()
                    Text("Chats")
                        .font(.custom("Baron Neue", size: 20))
                        .foregroundColor(.black)
                Spacer()
              
            }
            .padding(10)
            .overlay(
                NavigationLink(
                    destination: MainProfileView(),
                    isActive: $isProfile,
                    label: {

                        Button(action: {
                            isProfile.toggle()
                        }, label: {
                            Image("sample")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(.trailing,25)
                    })
                , alignment: .trailing)
            
            //MARK: SCROLLVIEW
            
            ScrollView(showsIndicators:false){
                LazyVStack{
                    
                    ForEach(0...10, id:\.self){ _ in
                        
                        NavigationLink(
                            destination: ChatView(),
                            isActive: $showMessage,
                            label: {
                                ChatMessageView()
                                    .onTapGesture {
                                        showMessage.toggle()
                                    }
                            })
                       
                    }
                    .padding(.vertical,5)
                }
            }
            .frame(width: GetRect().width * 0.9)
            
            
            
            Spacer()
            
        }
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
       
    }
}

struct ChatTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChatTabView()
    }
}

struct ChatMessageView: View {
    var body: some View {
        HStack{
            Image("sample")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading){
                Text("User Name")
                    .font(.custom("Rubik-SemiBold", size: 14))
                    .padding(.bottom, 5)
                Text("Last message found ")
                    .font(.custom("Rubik-Regular", size: 12))
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing){
                
                Text("12:00 PM ")
                    .font(.custom("Rubik-Regular", size: 12))
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                Image(systemName: "chevron.forward")
                    .foregroundColor(.accentColor)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .shadow(color: .gray.opacity(0.15), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/))
    }
}
