//
//  MainMusicDanceView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 09/09/2021.
//

import SwiftUI
import ACarousel

let latinValue = ["Cha Cha","Samba","Rumba","Paso Doble", "Jive"]
let BallroomValue = ["Waltz","Tango","V-Waltz","Foxtrot", "QuickStep"]
let rhythmValue = ["Cha Cha","Rumba","Swing","Bolero","Mambo"]
let smoothValue = ["Waltz","Tango","Foxtrot","V-Waltz"]

struct MainMusicDanceView: View {
    
    @Environment(\.presentationMode) var presentationMode
  
    @State var isSegue = false
    @Binding var imageName : [String]
    
    @State var outerIndex = 0
    @State var innerIndex = 0
    
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
                Text("PICK YOUR STYLE")
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
                                    destination: MainMusicPlaylistView(),
                                    isActive: $isSegue,
                                    label: {
                                        AuthButtonView(title: imageName[index], actionFunc: {
                                            isSegue.toggle()
                                        })
                                        .padding(.bottom, 50)                                    })
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
        }.onAppear(){
            
       
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

struct MainMusicDanceView_Previews: PreviewProvider {
    static var previews: some View {
        MainMusicDanceView(imageName: .constant(["Latin"]))
    }
}
