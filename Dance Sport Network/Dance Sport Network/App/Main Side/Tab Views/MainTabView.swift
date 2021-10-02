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
    
    @State var showCard = false
    @State var dismissCard = false
    @State var isShare = false
    @State var isComment = false
    @State var isEdit = false
    
    var body: some View {
        
        ZStack{
            
            switch selectedIndex{
            case 1:
                NewPostView()
            case 2:
                SearchView()
            case 3:
                ChatTabView()
            default :
                HomeView(showCard: $showCard, dismissCard: $dismissCard, isShare: $isShare, isComment: $isComment)
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
                    
                    
                    NavigationLink(
                        destination: NewPostView(),
                        isActive: $isPost,
                        label: {
                            TabButtonView(iconTitle: "Plus", isSelected: $isPost){
                                isPost.toggle()
                            }
                        })
                    
                NavigationLink(
                destination: SearchView(),
                isActive: $isSearch,
                label: {
                    TabButtonView(iconTitle: "Search", isSelected: $isSearch){
                     
                        isSearch.toggle()
                      
                    }
                })
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
                                .fill(Color.white)
                                .shadow(radius: 5))
                .overlay(Rectangle()
                            .fill(Color("background_light"))
                            .frame(width: GetRect().width, height: 40, alignment: .bottom)
                        .offset(y: 50), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }

            BottomCardView(shown: $showCard, Dismissal: $dismissCard, height: GetRect().height * 0.6)
            {
                
                if isComment == false{
                    VStack{
                        
                        HStack {
                            Text("SHARE TO USER")
                                .font(.custom("Baron Neue", size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Button(action: {
                                showCard.toggle()
                                dismissCard.toggle()
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)

                            })
                        }
                        .padding(.bottom)
                        
                        VStack {
                            HStack {
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .resizable()
                                    .foregroundColor(.accentColor)
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 50, height: 50, alignment: .center)
                                Text("Other User")
                                    .font(.custom("Rubik-Bold", size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                                
                                Button(action: {
                                    isShare.toggle()
                                    showCard.toggle()
                                    dismissCard.toggle()
                                    guard let data = URL(string: "https://www.apple.com") else { return }
                                            let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
                                            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
                                    
                                }, label: {
                                    Text("Invite")
                                        .font(.custom("Rubik-Bold", size: 15))
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .background(Capsule()
                                                        .frame(width: 80, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                                })
                            }
                            .padding(.horizontal)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 1)
                        }
                      
                        
                        ScrollView{
                            VStack{
                                
                                ForEach(0...5, id:\.self){ i in
                                    ShareUserPopView(){
                                        showCard = false
                                        dismissCard = false
                                        isShare = false
                                    }
                                }
                                
                            }
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 40)

                      
                    }
                    .padding()
                }
                
                else{
                    VStack{
                        HStack {
                            Text("Comments")
                                .font(.custom("Baron Neue", size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Button(action: {
                                showCard.toggle()
                                dismissCard.toggle()
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)

                            })
                        }
                        
                        if isEdit{
                            HStack{
                            TextField("Your comment", text: .constant(""))
                                .padding()
                                
                                Button(action: {
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                                    isEdit.toggle()
                                    
                                }, label: {
                                    Image(systemName: "paperplane.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color.accentColor)
                                        .padding(.trailing)
                                })
                                
                        }
                                .background(Capsule()
                                                .stroke(Color.accentColor,lineWidth: 2))
                        }
                        
                        ScrollView{
                            
                            VStack{
                                ForEach(0...3,id:\.self){ index in
                                    
                                    if index == 0{
                                        CommentView("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                                    }
                                    else{
                                        CommentView("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                                    }
                                   
                                }
                            }
                        }
                        HStack{
                            TextField("Your comment", text: .constant(""))
                                .foregroundColor(.gray)
                            .padding()
                            .onTapGesture {
                                isEdit.toggle()
                            }
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "paperplane.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.accentColor)
                                    .padding(.trailing)
                            })
                            
                        }
                            .background(Capsule()
                                            .stroke(Color.accentColor,lineWidth: 2))
                            .opacity(isEdit ? 0 : 1)
                        
                       
                    }
                    .padding()
                    
                }
            }
            .opacity(showCard ? 1 : 0)
            
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
