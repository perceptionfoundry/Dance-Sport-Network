//
//  ChatView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 03/09/2021.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    let dummyMsg = [msgData(id: 0,image:"avatar1",user: "jetson", msg: "Hi there!", myMsg: false),
                    msgData(id: 1,image:"avatar2",user: "me", msg: "How are you?", myMsg: true),
                    msgData(id: 2,image:"avatar1",user: "jetson", msg: "New Album is Going to be Release", myMsg: false),
                    msgData(id: 3,image:"avatar2",user: "me", msg: "Have you added to any online store?? Have you added to any online store?? Have you added to any online store?? Have you added to any online store??", myMsg: true)]
    
    
    var body: some View {
       
        VStack{
            //...  TOP AREA

            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                })
                .padding(10)
                
                Image("sample")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack(alignment:.leading){
                    Text("User Name")
                        .font(.custom("Baron Neue", size: 18))
                        .foregroundColor(.black)
                   
                }
                
                Spacer()
                

            }
            .padding(10)
            
           
            //... MAIN AREA
//            VStack(){
            ScrollView{
              
                
                ForEach(0...3, id:\.self){ i in
                    
                    
                    ChatCellView(data: dummyMsg[i])
                    
                }
                
            }
           
            .offset(y:10)

           
                
            Spacer()
               
            
            //.... BOTTOM AREA
                  
            HStack{
                            HStack{
                                    TextField("Type your message", text: .constant(""))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(#colorLiteral(red: 0.9490118623, green: 0.9489287734, blue: 0.9575280547, alpha: 1))))
                                    
                            }
                                
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),lineWidth: 2))
                            
                           
                            Button(action: {
                                
                            }, label: {
                                Image("send")
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        }
                        .frame(width: GetRect().width * 0.95, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                     
            .ignoresSafeArea(/*@START_MENU_TOKEN@*/.keyboard/*@END_MENU_TOKEN@*/, edges: .bottom)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(
         
            VStack {
                Color("background_light")
                    .frame(width: GetRect().width, height: GetRect().height + 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            )

    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}



struct msgTail : Shape{
    var myMsg : Bool
    
    func path(in rect: CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,!myMsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 10, height: 20))
        
      
       
        return Path(path.cgPath)
    }
}

struct ChatCellView: View {
    
    var data : msgData
    
    
    var body: some View {
        
        //SENDER
        if data.myMsg {
            HStack {
                VStack(alignment:.leading) {
                    
                    HStack(alignment:.bottom) {
                      
                        VStack(alignment:.leading) {
                          
                            
                            Text(data.msg)
                                .foregroundColor(.black)
                                .font(.custom("Rubik-Regular", size: 14))
                        }
                        .padding()
                        
                        .background(msgTail(myMsg: data.myMsg)
                                        .foregroundColor(.gray).opacity(0.2))
                        
                    }
                    Text("12:00 PM")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
            }
            .padding(.trailing, 35)
            .padding()
        }
        //Receiver
        else{
            HStack {
                Spacer()
                VStack(alignment:.trailing) {
                    
                    HStack(alignment:.bottom) {
                        
                        
                        VStack(alignment:.leading) {
                         
                            Text(data.msg)
                                .foregroundColor(.white)
                                .font(.custom("Rubik-Regular", size: 14))
                        }
                        .padding()
                        .background(msgTail(myMsg: data.myMsg)
                                        .foregroundColor(.accentColor))
//
                       
                        
                    }
                    HStack{
                        Image("Read")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFill()
                        Text("12:00 PM")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                }
                
            }
            .padding(.leading, 35)
            .padding()
        }
    }
}


// MODEL:

struct msgData {
    var id : Int
    var image:String
    var user : String
    var msg : String
    var myMsg : Bool
}


extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

