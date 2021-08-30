//
//  TabView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedIndex = 0
    @State var isHome = true
    @State var isPost = false
    @State var isSearch = false
    @State var isChat = false
    
    var body: some View {
        
        ZStack{
            
            switch selectedIndex{
            case 1:
                NewPostView()
            case 2:
                SearchView()
            case 3:
                ChatView()
            default :
                HomeView()
            }
            
        
            VStack {
                Spacer()
                
                HStack(spacing: 20){
                    
                    TabButtonView(iconTitle: "Home", isSelected: $isHome){
                        isHome = true
                        isPost = false
                        isSearch = false
                        isChat = false
                        
                        selectedIndex =  0
                    }
                    
                    TabButtonView(iconTitle: "Plus", isSelected: $isPost){
                        isHome = false
                        isPost = true
                        isSearch = false
                        isChat = false
                        
                        selectedIndex =  1
                    }
                    
                    TabButtonView(iconTitle: "Search", isSelected: $isSearch){
                        isHome = false
                        isPost = false
                        isSearch = true
                        isChat = false
                        
                        selectedIndex =  2
                    }
                    
                    TabButtonView(iconTitle: "Chat", isSelected: $isChat){
                        isHome = false
                        isPost = false
                        isSearch = false
                        isChat = true
                        
                        selectedIndex =  3
                    }
                    
                }
                .frame(width: GetRect().width * 0.8, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white))
               
                .overlay(Rectangle()
                            .fill(Color("background"))
                            .frame(width: GetRect().width, height: 40, alignment: .bottom)
                        .offset(y: 50), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

struct TabButtonView: View {
    
    var iconTitle : String
    @Binding var isSelected : Bool
    var actionFunc : ()->()
    var body: some View {
        
        
        Button(action: {
            actionFunc()
        }, label: {
            Image(iconTitle)
                .resizable()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
        .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .overlay(
            Circle()
                .fill(Color.accentColor)
                .opacity(isSelected ? 1 : 0)
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(y: 23), alignment: .bottom)
        
        
        
    }
}
