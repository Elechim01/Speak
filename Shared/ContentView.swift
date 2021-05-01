//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 01/05/21.
//

import SwiftUI
let screen = NSScreen.main!.visibleFrame
struct ContentView: View {
    @State var testo : String = ""
    @State var linea : CGFloat = 0
    @StateObject var suoni = Suoni()
    var body: some View {
        HStack {
            VStack {
                Text("Inserisci un testo da riprodurre")
                    .padding()
                TextField("testo",text:$testo)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.black)
                    .frame(width: screen.width/9, height: 30)
                    .background(Color.white)
                    .cornerRadius(10)
                Button(action: {
                    self.suoni.Riproduci(text: testo)
                }, label: {
                    Text("Riproduci")
                })
                .padding(.top)
                Button(action: {
                    self.suoni.RiproduttoreSuono()
                }, label: {
                    Text("Mosconi")
                })
                .padding(.top)
                GeometryReader{_ in
                    Rectangle()
                        .frame(width: 200,height: 10,alignment:.center)
                        .clipShape(Capsule())
                    Rectangle()
                        .frame(width: self.suoni.time,height: 10,alignment:.center)
                        .foregroundColor(.red)
                        .clipShape(Capsule())
                    
                }.padding(.leading,30)
                Spacer()
            }
            
        }
        .frame(width: screen.width/7
               , height: screen.height/5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
