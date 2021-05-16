//
//  MultilineaTF.swift
//  Speak
//
//  Created by Michele Manniello on 16/05/21.
//

import SwiftUI
struct MultiLineTF: UIViewRepresentable {
    @Binding var txt : String
    func makeCoordinator() -> Coordinator {
        return MultiLineTF.Coordinator(parent1: self)
    }
    func makeUIView(context: Context) -> some UIView {
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = true
        tview.text = "Type Something"
        tview.textColor = .gray
        tview.font = .systemFont(ofSize:20)
        tview.delegate = context.coordinator
        return tview
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
//    Creo il cordinatore
    class Coordinator: NSObject,UITextViewDelegate {
        var parent : MultiLineTF
        init(parent1: MultiLineTF) {
            parent = parent1
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
//            per la dark mode uso label che un text color
            textView.textColor = .label
        }
    }
}
