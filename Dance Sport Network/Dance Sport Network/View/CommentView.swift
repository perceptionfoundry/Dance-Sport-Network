//
//  CommentView.swift
//  Dance Sport Network
//
//  Created by Syed ShahRukh Haider on 20/09/2021.
//

import SwiftUI

struct CommentView: View {
    

    /* Indicates whether the user want to see all the text or not. */
        @State private var expanded: Bool = false

        /* Indicates whether the text has been truncated in its display. */
        @State private var truncated: Bool = false
    
    private var text: String

       init(_ text: String) {
           self.text = text
       }
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            HStack() {
                Image("sample")
                    .resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 2){
                    Text("User Name")
                        .font(.custom("Rubik_Bold", size: 12))
                    Text("22 min ago")
                        .font(.custom("Rubik_Bold", size: 10))
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image("dot_vertical")
                })
            }
            
            Text(self.text)
                .font(.custom("Rubik-Regular", size: 14))
                .lineLimit(expanded ? 50 : 2)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .background(GeometryReader { geometry in
                                    Color.clear.onAppear {
                                        self.determineTruncation(geometry)
                                    }
                                })
            
            if truncated{
            Button(action: {
                expanded.toggle()
            }, label: {
                HStack {
                    Spacer()
                    Text("See More")
                        .font(.custom("Rubik-SemiBold", size: 12))
                }
                    
            })
            .padding(.top, 2)
        }
        }
        .padding()
    }
    
    private func determineTruncation(_ geometry: GeometryProxy) {
            // Calculate the bounding box we'd need to render the
            // text given the width from the GeometryReader.
            let total = self.text.boundingRect(
                with: CGSize(
                    width: geometry.size.width,
                    height: .greatestFiniteMagnitude
                ),
                options: .usesLineFragmentOrigin,
                attributes: [.font: UIFont(name: "Rubik-Regular", size: 14)!],
                context: nil
            )

            if total.size.height > geometry.size.height {
                self.truncated = true
            }
        }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            .previewLayout(.sizeThatFits)
    }
}
