//
//  MainMusicPlaylistView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 09/09/2021.
//

import SwiftUI

struct MainMusicPlaylistView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showCard = false
    @State var dismissCard = false
    
    var body: some View {
        ZStack{
        VStack {
           
            //MARK: TOP
            HStack {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    
                    Image(systemName: "arrow.backward")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .padding(5)
                        
                })
                Spacer()
                Text("SONGS")
                    .font(.custom("Rubik-SemiBold", size: 18))
                Spacer()
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom)
            
      
            ScrollView(showsIndicators:false){
                
                LazyVStack{
                    ForEach(0...10, id:\.self){ _ in
                        
                        SongCellView(){
                            showCard.toggle()
                            dismissCard.toggle()
                        }
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                    }
                }
            }
           
                
            
            Spacer()
        }
        .padding(.horizontal)
            
            
            BottomCardView(shown: $showCard, Dismissal: $dismissCard, height: GetRect().width * 0.6) {
                
                VStack{
                    
                    HStack(alignment:.top,spacing: 50) {
                       
                        Button(action: {
                            showCard.toggle()
                            dismissCard.toggle()
                        }, label: {
                            Image("share-playlist")
                        })
                        
                        Button(action: {
                            showCard.toggle()
                            dismissCard.toggle()
                        }, label: {
                            Image("add-playlist")
                        })
                        
                        Button(action: {
                            showCard.toggle()
                            dismissCard.toggle()
                        }, label: {
                            Image("buy-playlist")
                        })
                    }
                    .padding(.bottom)
                }
                .padding()
                .frame(width: GetRect().width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            .opacity(showCard ? 1 : 0)
        }.edgesIgnoringSafeArea(.bottom)
        .padding(.horizontal)
        .background(
         
            VStack {
                Color("background_light")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
       
    }
}

struct MainMusicPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        MainMusicPlaylistView()
    }
}

struct SongCellView: View {
    let actionFunc : ()->()
    var body: some View {
        HStack{
            
            Image("Latin")
                .resizable()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            
            VStack(alignment: .leading){
                Text("LIVE BY THE HEART")
                    .font(.custom("Rubik-SemiBold", size: 16))
                
                Text("Illeana")
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Text("")
                    .font(.custom("Rubik-SemiBold", size: 14))
                    .foregroundColor(.accentColor)
                
                
            }
            
            Spacer()
            
            VStack{
                HStack{
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart")
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                    
                    Button(action: {
                        actionFunc()
                    }, label: {
                        Image("dot_v")
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                    
                }
                .padding(.bottom)
                
                Button(action: {
                    
                }, label: {
                    Text("Play")
                        .font(.custom("Rubik-Regular", size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Capsule()
                                        .fill(Color.accentColor))
                })
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 2)
    }
}
