//
//  HomeView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State var isFeed = true
    @State var searchValue = ""

    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Image("Logo2")
                Spacer()
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
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
                        Text("Explore    ")
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
            
            HStack {
                HStack {
                    
                    TextField("What’s on your mind?", text: $searchValue)
                        .font(.custom("Rubik_Bold", size: 14))
                        .padding()
                       
                }
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white))
                .background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray))
                .padding(.bottom)
                
                Button(action: {
                    
                }, label: {
                    Image("Photos")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y: -10)
                })
            }
            
            HStack {
                Text("TRENDING")
                    .font(.custom("Rubik_Bold", size: 16))
                Spacer()
            }
            
            //HORIZONTAL SCROLL
            ScrollView(.horizontal,showsIndicators:false){
                LazyHStack{
                    
                    ForEach(0...5, id:\.self){ _ in
                        TrendUserView()
                    }
                }
            }
            .frame(width: GetRect().width * 0.95, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            ScrollView(showsIndicators:false){
                LazyVStack{
                    ForEach(0...8, id:\.self){ _ in
                        FeedPostView()
                    }
                }
            }
           
            
            Spacer()
            
        }
        .padding()
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
                .frame(width: GetRect().width * 0.9, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            
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
