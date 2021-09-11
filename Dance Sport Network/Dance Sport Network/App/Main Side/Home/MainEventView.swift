//
//  MainEventView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 07/09/2021.
//

import SwiftUI
import ACarousel

struct MainEventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var currentIndex = 1
    @State var xValue :CGFloat = 0
    var body: some View {
        VStack{
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
                Spacer()
                Text("EVENTS")
                    .font(.custom("Rubik-SemiBold", size: 18))
                Spacer()
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        ScrollView(showsIndicators: false){
        VStack {
           
            
            ACarousel(0..<3, id: \.self) { index in
                EventImageView(indexValue: index)
                    .frame(width: 200,height: GetRect().height * 0.325)
                    .offset(x: xValue)
                    .tag(index)
                    .padding(.vertical)
            }
            .frame(width: 250,height: GetRect().height * 0.375)

            
            .padding(.bottom)
            
            HStack {
                Text("Visit")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Capsule()
                                .foregroundColor(.accentColor))
                
                Text("Add to Calendar")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Capsule()
                                .foregroundColor(.accentColor))
                
                Text("Review")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Capsule()
                                .foregroundColor(.accentColor))
            }
            
            Rectangle()
                .fill(Color.accentColor)
                .frame(height:1)
            
            VStack(alignment: .leading){
            Text("EVENT INFO")
                .foregroundColor(.black)
                .font(.custom("Rubik-SemiBold", size: 16))
                .padding(.bottom, 5)
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                .foregroundColor(.black)
                .font(.custom("Rubik-Regular", size: 14))
        }
            .padding(.bottom)
            VStack(alignment: .leading){
                HStack{
            Text("REVIEWS")
                .foregroundColor(.black)
                .font(.custom("Rubik-SemiBold", size: 16))
                .padding(.bottom, 5)
            
            Text("(40)")
                .foregroundColor(.black)
                .font(.custom("Rubik-Regular", size: 12))
                    
                    Spacer()
                }
               
                ScrollView(.horizontal){
                    LazyHStack{
                        
                        ForEach(0...6, id:\.self){ _ in
                            ReviewView()
                        }
                    }
                }
                
               
        }
            Spacer()
        }
        }
    }
        .padding(.horizontal)
        .background(
         
            VStack {
                Color("background")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
       
    }
}

struct MainEventView_Previews: PreviewProvider {
    static var previews: some View {
        MainEventView()
    }
}

struct EventImageView: View {
    
    var indexValue : Int
    
    var body: some View {
        
            
            Image("event_sample\(indexValue + 1)")
                .resizable()
                .frame(width: 200,height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                .overlay(
                    VStack(alignment: .leading){
                        Text("28 - 29 August 2021")
                            .font(.custom("Rubik-Regular", size: 12))
                            .foregroundColor(.white)
                        
                        Text("Event Title")
                            .font(.custom("Rubik-SemiBold", size: 16))
                            .foregroundColor(.white)
                        
                }.offset(x: 20, y: -30), alignment: .bottomLeading)
     
        
    }
}

struct ReviewView: View {
    var body: some View {
        VStack(){
            
            HStack {
                Image("sample")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading){
                    Text("User Name")
                        .foregroundColor(.black)
                        .font(.custom("Rubik-SemiBold", size: 16))
                    
                    Text("26 minute ago")
                        .foregroundColor(.gray)
                        .font(.custom("Rubik-Regular", size: 12))
                }
                
                Spacer()
            }
            Rectangle()
                .fill(Color.accentColor)
                .frame(height:1)
            
            HStack{
                
                ForEach(0...3, id:\.self){ _ in
                    Image(systemName: "star.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.979311645, green: 0.6565688848, blue: 0.1689862609, alpha: 1)))
                }
                ForEach(0...0, id:\.self){ _ in
                    Image(systemName: "star.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.8783639073, green: 0.8784695268, blue: 0.8783279061, alpha: 1)))
                }
            }
            .padding(.bottom)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .font(.custom("Rubik-Regular", size: 13))
                .frame(height: 40)
            
        }
        .padding()
        .background(Color.white)
        .frame(width:GetRect().width * 0.8, height: 180)
        .cornerRadius(15)
    }
}
