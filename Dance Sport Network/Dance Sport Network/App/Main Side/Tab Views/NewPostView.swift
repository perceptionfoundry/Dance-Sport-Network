//
//  NewPostView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 30/08/2021.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isExpanding = false
    @State var isPromote = false
    @State var isPay = false
    
    var body: some View {
        
        
        VStack(spacing: 30) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 30, height: 30, alignment: .center)
                }

                
                Spacer()
                Text("CREATE A POST")
                    .font(.custom("Rubik-Bold", size: 18))
                Spacer()
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            ScrollView(showsIndicators:false){
                VStack{
                    
                    //MARK: UPLOAD IMAGE
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.accentColor
                                    ,style: StrokeStyle(lineWidth: 2, dash: [7, 12], dashPhase: 0.4))
                            .frame(width: GetRect().width * 0.9, height: 124, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Image("upload")
                            .resizable()
                        
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: GetRect().width * 0.9, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.bottom)
                    
                    Group{
                    //MARK: DESCRIPTION
                    HStack{
                        Text("DESCRIPTION")
                            .font(.custom("Rubik-SemiBold", size: 14))
                        Spacer()
                    }
                    
                    TextView(text: .constant(""), didStartEditing: .constant(false), height: .constant(10), isReturn: .constant(false), placeHolder: "Write about you...")
                        .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white))
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.accentColor))
                        .padding(.bottom)
                    
                    
                    //MARK: TAG FRIEND
                    HStack{
                        Text("TAG FRIENDS")
                            .font(.custom("Rubik-SemiBold", size: 14))
                        Spacer()
                    }
                    
                    TextField("", text: .constant(""))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white))
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.accentColor))
                        .padding(.bottom)
                    
                    
                    //MARK: HASHTAG
                    HStack{
                        Text("HASHTAGS")
                            .font(.custom("Rubik-SemiBold", size: 14))
                        Spacer()
                    }
                    
                    TextField("Add your hashtags...", text: .constant(""))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white))
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.accentColor))
                        .padding(.bottom)
                    
                    
                    //MARK: LOCATION TAG
                    HStack{
                        Text("LOCATION")
                            .font(.custom("Rubik-SemiBold", size: 14))
                        Spacer()
                    }
                    
                    TextField("Add your location...", text: .constant(""))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white))
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.accentColor))
                        .padding(.bottom)
                    
                    
                    //MARK: PROMOTE POST
                    HStack{
                        Text("PROMOTE YOUR POST")
                            .font(.custom("Rubik-SemiBold", size: 14))
                        Spacer()
                    }
                    
                        .padding(.bottom)
                        
                        HStack {
                            DisclosureGroup(
                                isExpanded: $isExpanding,
                                content: {
                                    Text("Country: 1")
                                    Text("Country: 2")
                                    Text("Country: 3")
                                    Text("Country: 4")
                                },
                                label: {
                                    Text("Choose country")
                                        .frame(height: 45)
                                   
                                    
                                }
                            )
                                .padding(.trailing)
                                .padding(.leading)
                            .background(RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.white))
                            
                            //MARK: PROMOTE BUTTON
                            
                            NavigationLink(
                                destination: PromoteView(),
                                isActive: $isPromote,
                                label: {
                                    
                                    Button(action: {
                                        isPromote.toggle()
                                    }, label: {
                                        Text("PROMOTE")
                                            .font(.custom("Rubik-Bold", size: 15))
                                            .foregroundColor(Color.white)
                                            .padding()
                                            .background(Capsule()
                                                            .frame(height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                                    })
                                })
                          
                        }
                        
                    }
                    
                    
                    Group{
                        //MARK: POST BUTTON
                         AuthButtonView(title: "Post") {
                                    presentationMode.wrappedValue.dismiss()
                                }
                                .padding(.top, 40)

                        
                    }
                }
                .padding(.horizontal)
            }
         
            
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .padding()
        .background(
            VStack {
                Color("background_light")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )
    
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
