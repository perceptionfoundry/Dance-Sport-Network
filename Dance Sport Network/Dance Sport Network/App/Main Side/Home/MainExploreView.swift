//
//  MainExploreView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 07/09/2021.
//

import SwiftUI

struct MainExploreView: View {
    
    
    @State var isEvent = false
    @State var isExplore = false
    @State var isPartner = false
    
    var body: some View {
        
        VStack {
            
            //MARK: EVENT
            HStack {
                
                Text("UPCOMING EVENTS")
                    .font(.custom("Rubik-SemiBold", size: 16))
                    .padding(2)
             
                Spacer()
                
                NavigationLink(
                    destination: MainEventView(),
                    isActive: $isEvent,
                    label: {
                        Button(action: {
                            isEvent.toggle()
                        }, label: {
                            HStack (spacing: 5){
                                Text("VIEW ALL")
                                    .font(.custom("Baron Neue Bold", size: 14))
                                    .foregroundColor(.accentColor)
                                
                                Image(systemName: "chevron.forward")
                                    .font(.subheadline)
                                    .foregroundColor(.accentColor)
                            }
                        })
                    })
               

            }
            
            ScrollView(.horizontal){
                LazyHStack{
                    ExploreCardView(title: "Victoria Dance Week 2021", image: "explore_sample1", buttonTitle: "View More")
                    
                    ExploreCardView(title: "Chelsa Spirit Concert", image: "explore_sample2", buttonTitle: "View More")
                }
                
            }
            .frame(height: 130)
           
            
            
            //MARK: MUSIC
            HStack {
                
                Text("EXPLORE MUSIC")
                    .font(.custom("Rubik-SemiBold", size: 16))
                    .padding(2)
             
                Spacer()
                
                Button(action: {
                    isExplore.toggle()
                }, label: {
                    HStack (spacing: 5){
                        Text("VIEW ALL")
                            .font(.custom("Baron Neue Bold", size: 14))
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "chevron.forward")
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                    }
                })
            }
            
            ScrollView(.horizontal){
                LazyHStack{
                    ExploreCardView(title: "Latin", image: "explore_sample3", buttonTitle: "Select")
                    
                    ExploreCardView(title: "Ballroom", image: "explore_sample4", buttonTitle: "Select")
                }
                
            }
            .frame(height: 130)
            
            //MARK: SEARCH
            HStack {
                
                Text("PARTNER SEARCH")
                    .font(.custom("Rubik-SemiBold", size: 16))
                    .padding(2)
             
                Spacer()
                
                NavigationLink(
                    destination: MainPartnerView(),
                    isActive: $isPartner,
                    label: {
                Button(action: {
                    isPartner.toggle()
                }, label: {
                    HStack (spacing: 5){
                        Text("VIEW ALL")
                            .font(.custom("Baron Neue Bold", size: 14))
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "chevron.forward")
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                    }
                })
            })
                
               
            }
            
            ScrollView(.horizontal){
                LazyHStack{
                    ExploreCardView(title: "Rhythm", image: "explore_sample5", buttonTitle: "Select")
                    
                    ExploreCardView(title: "Smooth", image: "explore_sample6", buttonTitle: "Select")
                }
               
            }
            .frame(height: 130)
            
        }
        .padding()
       
       
    }
}

struct MainExploreView_Previews: PreviewProvider {
    static var previews: some View {
        MainExploreView()
            .previewLayout(.sizeThatFits)
    }
}

struct ExploreCardView: View {
    
    var title : String
    var image : String
    var buttonTitle : String
    
    var body: some View {
        VStack {
            ZStack{
                
                Image(image)
                    .resizable()
                    .frame(width: 175, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black.opacity(0.5))
                    .frame(width: 175, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.accentColor.opacity(0.125))
                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 175, height: 115, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
            }
            .overlay(
                HStack {
                    VStack(alignment:.leading){
                        Text(title)
                            .autocapitalization(.allCharacters)
                            .foregroundColor(.white)
                            .font(.custom("Ruibik-SemiBold", size: 14))
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text(buttonTitle)
                                .foregroundColor(.accentColor)
                                .font(.custom("Ruibik-SemiBold", size: 12))
                                .padding(.horizontal,15)
                                .padding(.vertical,5)
                                .background(RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.white))
                        })
                        
                    }.frame(width: 100, height: 90)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
            , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}


