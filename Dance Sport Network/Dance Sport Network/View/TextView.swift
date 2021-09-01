//
//  TextView.swift
//  GoalBate
//
//  Created by Syed ShahRukh Haider on 17/06/2021.
//

import SwiftUI
import Combine
import Foundation
import SwiftUI

struct TextView: UIViewRepresentable{
    @Binding var text: String
    @Binding var didStartEditing: Bool
    @Binding var height: CGFloat
    @Binding var isReturn: Bool
    var placeHolder:String
   //
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = false
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
        textView.text = text
        textView.font = UIFont(name: "Rubik-Regular", size: 12)
        textView.backgroundColor = UIColor.clear
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator

        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        if didStartEditing {
      
                  uiView.textColor = UIColor.black
                  uiView.text = text
      
      
              }
              else {
                  uiView.text = placeHolder
                  uiView.textColor = UIColor.lightGray
              }
      
              uiView.font = UIFont.preferredFont(forTextStyle: .body)
              uiView.delegate = context.coordinator
              uiView.layoutManager.delegate = context.coordinator
    }

    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicSizeTextField: self)
    }
}

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
    var dynamicHeightTextField: TextView
    
    weak var textView: UITextView?

    
    init(dynamicSizeTextField: TextView) {
        self.dynamicHeightTextField = dynamicSizeTextField
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.dynamicHeightTextField.text = textView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("end")
        self.dynamicHeightTextField.isReturn = true
    }
    
    func layoutManager(_ layoutManager: NSLayoutManager, didCompleteLayoutFor textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let textView = self?.textView else {
                return
            }
            let size = textView.sizeThatFits(textView.bounds.size)
            if self?.dynamicHeightTextField.height != size.height {
                self?.dynamicHeightTextField.height = size.height
            }
        }

    }
}
