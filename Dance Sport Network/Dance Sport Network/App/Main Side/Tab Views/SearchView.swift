//
//  SearchView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchValue = ""
    @State var showOtherEvent = false
    
    let data = (1...9).map { "Item \($0)" }
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ZStack{
            VStack {
                
                Image("Logo2")
                
                
                HStack {
                    
                    TextField("What’s on your mind?", text: $searchValue)
                        .font(.custom("Rubik_Bold", size: 14))
                        .padding()
                    
                }
                .frame(width: GetRect().width * 0.8)
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white))
                .background(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray))
                .padding(.bottom)
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<data.count, id: \.self) { index in
                            
                            if index == 3 || index == 5{
                                
                                Image("image\(index + 1)")
                                    .resizable()
                                    .blur(radius: 4)
                                    .frame(width: GetRect().width * 0.285, height: GetRect().width * 0.285, alignment: .center)
                                    .overlay(
                                        VStack{
                                            
                                            HStack{
                                                Image("Video")
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                            .padding(.bottom, 5)
                                            
                                            Text("Watch Now")
                                                .foregroundColor(.white)
                                                .font(.custom("Rubik-Regular", size: 12))
                                            
                                            Text("$9.99")
                                                .foregroundColor(.white)
                                                .font(.custom("Rubik-SemiBold", size: 16))
                                            
                                            
                                        }.offset(y: 10), alignment: .top)
                                
                                
                                
                            }
                            else{
                                
                                NavigationLink(
                                    destination: MainProfileView(),
                                    isActive: $showOtherEvent,
                                    label: {
                                        
                                        Image("image\(index + 1)")
                                            .resizable()
                                            .frame(width: GetRect().width * 0.285, height: GetRect().width * 0.285, alignment: .center)                                    .onTapGesture {
                                                showOtherEvent.toggle()
                                            }
                                    })
                                    
                            }
                                
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: 500)
                
                
                Spacer()
            }
            
//            OthersEventView(dismiss: $showOtherEvent).opacity(showOtherEvent ? 1 : 0)
            
        }
        .background(
            
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .overlay(
                Image("topCorner")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                , alignment: .topTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
        
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
