//
//  HomeView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State var isFeed = true
    @State var showCard = false
    @State var dismissCard = false
    @State var isProfile = false
    @State var isShare = false
    @State var isComment = false

   

    var body: some View {
        
        ZStack{
        VStack {
            HStack {
                Spacer()
                Image("Logo2")
                Spacer()
            }.overlay(
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
                    })
                , alignment: .trailing)
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 10)
                                .fill(Color.accentColor)
                    .frame(width: GetRect().width * 0.375,height: 40)
                    .offset(x:isFeed ?  -80 : 80)
                    .animation(.linear(duration: 0.1))
                
                Button(action: {
                    isFeed.toggle()
                }, label: {
                    HStack{
                        Text("  Media Feed")
                            .font(.custom("Rubik-Bold", size: 14))
                            .foregroundColor(isFeed ? .white : .accentColor)
                        Spacer()
                        Text("Explore        ")
                            .font(.custom("Rubik-Bold", size: 14))
                            .foregroundColor(!isFeed ? .white : .accentColor)
                    }
                })
                .padding(.horizontal)
            }
            .padding()
            .frame(width: GetRect().width * 0.8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 50))
            
        
            if isFeed{
                MainFeedView(showCard: $showCard, dismissCard: $dismissCard, isComment: $isComment)
            }else{
                MainExploreView()
            }
          
            
            Spacer()
            
        }
        .padding()
            
            BottomCardView(shown: $showCard, Dismissal: $dismissCard, height: GetRect().height * 0.6) {
                
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
                            .frame(height: 80)

                      
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
                        .padding(.bottom)
                        
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
                            .padding()
                            
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
                    
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 80)
                    }
                    .padding()
                    
                }
            }
            .opacity(showCard ? 1 : 0)
    }
        .edgesIgnoringSafeArea(.bottom)
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TrendUserView: View {
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4478341341, green: 0.3238174319, blue: 0.873673141, alpha: 1)), Color(#colorLiteral(red: 0.8520538211, green: 0.4050015807, blue: 0.686578691, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/),lineWidth: 1.5)
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Image("sample")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

struct FeedPostView: View {
    
    var shareActionFunc : ()->()
    var commentActionFunc : ()->()
    
    var body: some View {
        VStack{
            
            HStack() {
                Image("sample")
                    .resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 2){
                    Text("User Name")
                        .font(.custom("Rubik_Bold", size: 12))
                    Text("22 min ago")
                        .font(.custom("Rubik_Bold", size: 10))
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image("dot_vertical")
                })
            }.padding(.horizontal)
            
            
            Text("Success Steps For Your Personal Or Business Life !")
                .font(.custom("Rubik_Bold", size: 14))
                .padding(.horizontal)
            
            Image("post_sample")
                .resizable()
                .scaledToFill()
                .frame(width: GetRect().width * 0.9, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
            
            HStack{
                Button(action: {
                    
                }, label: {
                    HStack {
                        Image("heart")
                        Text("122")
                            .font(.custom("Rubik_Bold", size: 14))
                            .foregroundColor(.black)
                    }
                })
                .frame(height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                    commentActionFunc()
                }, label: {
                    HStack {
                        Image("Chat_post")
                        Text("122")
                            .font(.custom("Rubik_Bold", size: 14))
                            .foregroundColor(.black)
                    }
                })
                .frame(height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    shareActionFunc()
                }, label: {
                    Image("share")
                    
                    
                })
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                    
                }, label: {
                    Image("Bookmark")
                    
                })
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }.padding(.horizontal)
        }
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white))
    }
}

