//
//  MainMusicView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 09/09/2021.
//

import SwiftUI
import ACarousel




struct MainMusicStyleView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let imageName = ["Ballroom","Latin","Rhythm","Smooth"]
    
    @State var outerIndex = 0
    @State var innerIndex = 0
    
    @State var selectedImages = latinValue
    @State var isSegue = false
    
    var body: some View {
        
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
                Text("PICK A STYLE")
                    .font(.custom("Rubik-SemiBold", size: 18))
                Spacer()
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom)
            
            Text("selection will be able to suggest things according to your interests.")
                .font(.custom("Rubik-Regular", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .frame(width: 300)
               
                ACarousel(0..<imageName.count, id: \.self) { index in
                    
                    VStack {
                       
                        Image(imageName[index])
                               .resizable()
                               .scaledToFill()
                            .frame(width: 280,height: GetRect().height * 0.6)
                            .cornerRadius(30)
                            .overlay(
                                
                                NavigationLink(
                                    destination: MainMusicDanceView(imageName: $selectedImages),
                                    isActive: $isSegue,
                                    label: {
                                    
                                AuthButtonView(title: imageName[index], actionFunc: {
                                    
                                    if imageName[index] == "Latin"{
                                        selectedImages = latinValue
                                    }else if imageName[index] == "Ballroom"{
                                        selectedImages = BallroomValue
                                    }else if imageName[index] == "Rhythm"{
                                        selectedImages = rhythmValue
                                    }else if imageName[index] == "Smooth"{
                                        selectedImages = smoothValue
                                    }
                                    
                                    isSegue.toggle()
                                })
                                .padding(.bottom, 50)
                    })
                                , alignment: .bottom)
                        
                        
                        HStack(spacing: 4){
                            
                            ForEach(0..<imageName.count,id:\.self){ i in
                                
                                if index == i{
                                Capsule()
                                    .fill(Color.accentColor)
                                    .frame(width: 20, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                else{
                                Circle()
                                    .fill(Color.accentColor.opacity(0.5))
                                    .frame(width: 20, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                            }
                           
                        }
                    }
                        
                    
                    
                   }
                
                .frame(width: 320,height: GetRect().height * 0.7)
                
            
            Spacer()
        }
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

struct MainMusicView_Previews: PreviewProvider {
    static var previews: some View {
        MainMusicStyleView()
    }
}
