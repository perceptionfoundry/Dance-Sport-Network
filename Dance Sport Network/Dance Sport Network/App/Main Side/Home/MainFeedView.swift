//
//  MainFeedView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 07/09/2021.
//

import SwiftUI

struct MainFeedView: View {
    
    @State var searchValue = ""
    @Binding var showCard : Bool
    @Binding var dismissCard : Bool
    @Binding var isComment : Bool

    var body: some View {
        
        VStack{
            
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
                    .font(.custom("Rubik-SemiBold", size: 16))
                Spacer()
            }
            .padding(.horizontal)
            
            //HORIZONTAL SCROLL

            ScrollView(.horizontal,showsIndicators:false){
                LazyHStack{
                    
                    ForEach(0...5, id:\.self){ _ in
                        TrendUserView()
                    }
                }
            }
            .frame(height: 90)
            ScrollView(showsIndicators:false){
                LazyVStack{
                    ForEach(0...8, id:\.self){ _ in
                        FeedPostView {
                            showCard.toggle()
                            dismissCard.toggle()
                        } commentActionFunc: {
                            showCard.toggle()
                            dismissCard.toggle()
                            isComment.toggle()
                        }
                        .padding()
        
                        
                    }
                }
            }
        }
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView(showCard: .constant(true), dismissCard: .constant(true), isComment: .constant(false))
    }
}
