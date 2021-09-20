//
//  MainPartnerView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 07/09/2021.
//

import SwiftUI

struct MainPartnerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isSegue = false
    
    var dummyData = [cardInfo(id: "1", name: "Shahrukh", place: "Karachi", image: "explore_sample5"),
                     cardInfo(id: "2", name: "Sarim", place: "Islamabad", image: "explore_sample2"),
                     cardInfo(id: "3", name: "Salaar", place: "Lahore", image: "explore_sample3"),
                     cardInfo(id: "4", name: "Shahryaar", place: "Multan", image: "explore_sample4"),]
    var body: some View {
        
        VStack(spacing: 40){
            
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
                Text("PARTNER SEARCH")
                    .font(.custom("Rubik-SemiBold", size: 18))
                Spacer()
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
          
            
            //MARK: JOIN BUTTON
            Button(action: {
                
            }, label: {
                HStack {
                    Text("+")
                        .font(.custom("Rubik-SemiBold", size: 36))
                        .foregroundColor(.white)
                        
                    Text("JOIN THE SEARCH")
                        .font(.custom("Rubik-SemiBold", size: 16))
                        .foregroundColor(.white)
                        
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 8)
                .background(Capsule()
                            .fill(Color.accentColor))
            })
            .padding(.bottom, 30)
           
             //MARK: IMAGE
            
            ZStack {
                ForEach(dummyData, id:\.self){value in
                    PartnerCardView(title: value.name, place: value.place, image: value.image)
                }
            }
            .frame(height: 350)
            .background(
                
                ZStack(alignment: .top){
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.accentColor.opacity(0.5))
                                .frame(width: GetRect().width * 0.675, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y: -170)
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color.accentColor.opacity(0.7))
                                .frame(width: GetRect().width * 0.8, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y: -160)
                })
            
            HStack(spacing: 40) {
                
                NavigationLink(
                    destination: ChatView(),
                    isActive: $isSegue,
                    label: {
                        Button(action: {
                            isSegue.toggle()
                        }, label: {
                    Image("yes")
                })
            })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("no")
                })
            }
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("send_friend")
            })
            Spacer()
            
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

struct MainPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        MainPartnerView()
    }
}

struct PartnerCardView: View {
    
    var title: String
    var place : String
    var image : String
    
    @State private var translation: CGSize = .zero
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack(alignment: .leading){
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: GetRect().width * 0.9, height: GetRect().width * 0.7, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .cornerRadius(30)
                
                Text(title)
                    .font(.custom("Rubik-SemiBold", size: 20))
                Text(place)
                    .font(.custom("Rubik-Regular", size: 16))
                    .foregroundColor(.gray)
                
            }
            .background(Color("background"))
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y:0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
            DragGesture()
                .onChanged({ value in
                    
                    self.translation = value.translation
                })
                .onEnded({ value in
                    self.translation = .zero
                })
            )
        })
        
    }
}

struct cardInfo: Identifiable, Hashable {
    var id : String
    var name : String
    var place : String
    var image : String
    
}
