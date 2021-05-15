//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 01/05/21.
//

import SwiftUI
let screen = NSScreen.main!.visibleFrame
struct ContentView: View {
    @State var testo : String = "|"
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
                    .frame(width: screen.width/9,height:   30)
//                    .frame(minHeight: CGFloat(30),maxHeight: CGFloat(60))
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
                    Text("Mosconi ☠️")
                        .padding()
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 120, height: 20 )
                .background(Color.red)
                .clipShape(Capsule())
                .padding(.top)
                .padding(.bottom,5)
                .focusable()
                
                GeometryReader{_ in
                        Rectangle()
                            .frame(width: 200,height: 10,alignment:.center)
                            .clipShape(Capsule())
                            .foregroundColor(.green)
                        Rectangle()
                            .frame(width: self.suoni.time,height: 10,alignment:.center)
                            .foregroundColor(.red)
                            .clipShape(Capsule())
                }
               
                .padding(.leading,55)
                
                Spacer()
            }
            .touchBar {
                Spacer()
//                bottone per la riproduzione di suoni
                Button(action: {
                    self.suoni.Riproduci(text: testo)
                }, label: {
                    Text("Riproduci")
                        
                })
                .accentColor(.gray)
                Spacer()
//                bottone per mosconi
                Button(action: {
                    self.suoni.RiproduttoreSuono()
                }, label: {
                    Text("Mosconi")
                        
                })
//                colore del bottone
                .accentColor(.red)
                Spacer()
                
            }

        }
        .frame(width: screen.width/6
               , height: screen.height/4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
