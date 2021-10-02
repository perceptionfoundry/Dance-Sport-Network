//
//  MainProfileView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 07/09/2021.
//

import SwiftUI

struct MainProfileView: View {
    
    @State var isPost = true
    @State var isCourse = false
    @State var isCalendar = false
    @State var isMessage = false
    @State var isAddAvailablity = false
    @State var isAddEvent = false
    
    let data = (1...9).map { "Item \($0)" }
    let columns = [
            GridItem(.adaptive(minimum: 100))
        ]
    var body: some View {
        
        ZStack{
        VStack {
           
            Image("image2")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Circle()
                                .stroke(Color(#colorLiteral(red: 0.08289604634, green: 0.8600253463, blue: 0.8315178156, alpha: 1)),lineWidth: 5)
                                .frame(width: 102, height: 102, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
            
            VStack(spacing: 2){
            Text("USER NAME")
                .foregroundColor(.black)
                .font(.custom("Rubik-SemiBold", size: 20))
            
            Text("@username")
                .foregroundColor(.gray)
                .font(.custom("Rubik-Regular", size: 14))
            }
              
            Text("FOLLOW")
                .foregroundColor(.white)
                .font(.custom("Rubik-SemiBold", size: 14))
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .background(Capsule()
                                .fill(Color.accentColor))
            
            //MARK: COUNT
            HStack{
                Spacer()
                VStack(spacing: 8){
                    Text("989")
                        .foregroundColor(.black)
                        .font(.custom("Rubik-SemiBold", size: 18))
                    
                    Text("Posts")
                        .foregroundColor(.gray)
                        .font(.custom("Rubik-Regular", size: 14))
                }
                .frame(width: GetRect().width / 4, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack(spacing: 8){
                    Text("2M")
                        .foregroundColor(.black)
                        .font(.custom("Rubik-SemiBold", size: 18))
                    
                    Text("Followers")
                        .foregroundColor(.gray)
                        .font(.custom("Rubik-Regular", size: 14))
                }
                .frame(width: GetRect().width / 4, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                VStack(spacing: 8){
                    Text("2K")
                        .foregroundColor(.black)
                        .font(.custom("Rubik-SemiBold", size: 18))
                    
                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.custom("Rubik-Regular", size: 14))
                }
                .frame(width: GetRect().width / 4, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            //MARK: Selection BUTTONS
            HStack{
                
                ProfileButtonView(title: "Posts", isSelected: isPost) {
                    
                    isPost = true
                    isCourse = false
                    isCalendar = false
                    isMessage = false
                }
                
                ProfileButtonView(title: "Music", isSelected: isCourse) {
                    isPost = false
                    isCourse = true
                    isCalendar = false
                    isMessage = false
                }
                
                ProfileButtonView(title: "Calendar", isSelected: isCalendar) {
                    isPost = false
                    isCourse = false
                    isCalendar = true
                    isMessage = false
                }
                
                NavigationLink(
                    destination: ChatView(),
                    isActive: $isMessage,
                    label: {
                        ProfileButtonView(title: "Message", isSelected: isMessage) {
                           
                            isMessage.toggle()
                        }
                    })
                
               
            }
            .padding(.bottom, 30)
            // MARK: SUBVIEW
            
            if isPost {
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
                                    Image("image\(index + 1)")
                                        .resizable()
                                        .frame(width: GetRect().width * 0.285, height: GetRect().width * 0.285, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: 500)
            }

            if isCalendar{
                
                
                ScrollView(showsIndicators:false){
                    VStack(alignment: .leading, spacing: 20) {
                        Text("MY EVENT")
                            .font(.custom("Baron Neue Bold", size: 18))
                        
                        MyEventView(eventDate: "10 Sept", eventTitle: "Event Title", eventImage: "event_sample1", eventVenue: "Event venue address", editAction: {
                            
                        }, binAction: {
                            
                        })
                        
                        MyEventView(eventDate: "15 Sept", eventTitle: "Event Title 2", eventImage: "event_sample2", eventVenue: "Event venue address 2", editAction: {
                            
                        }, binAction: {
                            
                        })
                            
                        //MARK: ADD EVENTS
                        HStack {
                            Spacer()
                            AuthButtonView(title: "+  ADD EVENT") {
                                isAddEvent.toggle()
                            }
                            
                            Spacer()
                        }
                        
                        Text("MY AVAILABILITY")
                            .font(.custom("Baron Neue Bold", size: 18))
                        CalendarView(selectedDate:.constant(Date()))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                            .frame(height: 300)
                        
                        
                        HStack {
                            Text("October")
                                .font(.custom("Baron Neue Bold", size: 18))
                            Spacer()
                            //MARK: MONTH SECTIO
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("Edit_1")
                            })
                        }
                        
                        HStack{
                            Text("Oct. 11 - 14")
                                .font(.custom("Rubik-SemiBold", size: 14))
                            Spacer()
                            Text("Unavailable")
                                .font(.custom("Rubik-Regular", size: 14))
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        //MARK: ADD AVAILABILITY
                        HStack {
                            Spacer()
                            AuthButtonView(title: "+  ADD AVAILABILITY") {
                                isAddAvailablity.toggle()
                            }
                            
                            Spacer()
                        }
                    }
                }
                
            }
            
                Spacer()
            
            
        }
        .padding(.horizontal)
            
            AddAvailabilityView(dismiss:$isAddAvailablity).opacity(isAddAvailablity ? 1:0)
                .animation(.linear)
            
            AddEventView(dismiss:$isAddEvent).opacity(isAddEvent ? 1:0)
                .animation(.linear)
        }
        .navigationBarBackButtonHidden(isAddAvailablity || isAddEvent)
        .background(
         
            ZStack(alignment: .top) {
                Color("background_light")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image("image_cp")
                    .resizable()
                    .scaledToFill()
                    .frame(width: GetRect().width, height:300)
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color.accentColor .opacity(0.4), Color.white .opacity(0.9)]), startPoint: .top, endPoint: .bottom))
                    
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
       
    }
}

struct MainProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MainProfileView()
    }
}

struct ProfileButtonView: View {
    var title : String
    var isSelected : Bool
    var actionFunc : ()->()
    
    var body: some View {
        Button(action: {
            actionFunc()
        }, label: {
            Text(title)
                .foregroundColor(isSelected ? .white : .accentColor)
                .font(.custom("Rubik-SemiBold", size: 13))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(RoundedRectangle(cornerRadius: 8)
                                .fill(Color.accentColor .opacity(isSelected ? 1 : 0.3)))
        })
    }
}


