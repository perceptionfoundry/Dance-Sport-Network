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
    
    @State var moreVisit = false
    @State var selectExplore = false
    @State var selectPartner = false
    
    
    var body: some View {
        ScrollView{
        VStack {
            
            //MARK: EVENT
            HStack {
                
                Text("UPCOMING EVENTS")
                    .font(.custom("Baron Neue Bold", size: 16))
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
            // MARK: EVENT
            ScrollView(.horizontal){
                
                NavigationLink(
                    destination: MainEventView(),
                    isActive: $moreVisit,
                    label: {
                        
                        LazyHStack{
                            ExploreCardView(title: "Victoria Dance Week 2021", image: "explore_sample1", buttonTitle: "View More"){
                                moreVisit.toggle()
                            }
                            
                            ExploreCardView(title: "Chelsa Spirit Concert", image: "explore_sample2", buttonTitle: "View More"){
                                moreVisit.toggle()
                            }
                        }
                    })
               
                
            }
            .frame(height: 130)
           
            
            
            //MARK: MUSIC
            HStack {
                
                Text("EXPLORE MUSIC")
                    .font(.custom("Baron Neue Bold", size: 16))
                    .padding(2)
             
                Spacer()
                
                NavigationLink(
                    destination: MainMusicStyleView(),
                    isActive: $isExplore,
                    label: {
                    
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
                
            })
            }
            
            ScrollView(.horizontal){
                NavigationLink(destination: MainMusicDanceView(imageName: .constant(latinValue)), isActive: $selectExplore, label: {
                    LazyHStack{
                        ExploreCardView(title: "Latin", image: "explore_sample3", buttonTitle: "Select"){
                            selectExplore.toggle()
                        }
                        
                        ExploreCardView(title: "Ballroom", image: "explore_sample4", buttonTitle: "Select"){
                            selectExplore.toggle()
                        }
                    }
                })
                
                
            }
            .frame(height: 130)
            
            //MARK: PARTNER
            HStack {
                
                Text("PARTNER SEARCH")
                    .font(.custom("Baron Neue Bold", size: 16))
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
                NavigationLink(destination: MainPartnerView(), isActive: $selectPartner, label: {
                    LazyHStack{
                        ExploreCardView(title: "Rhythm", image: "explore_sample5", buttonTitle: "Select"){
                            selectPartner.toggle()
                        }
                        
                        ExploreCardView(title: "Smooth", image: "explore_sample6", buttonTitle: "Select"){
                            selectPartner.toggle()
                        }
                    }
                })
                
               
            }
            .frame(height: 130)
            
        }
        .padding()
    }
       
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
    var buttonAction : ()->()
    
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
                            buttonAction()
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


