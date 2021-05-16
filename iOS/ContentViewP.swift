//
//  ContentViewP.swift
//  Speak (iOS)
//
//  Created by Michele Manniello on 01/05/21.
//

import SwiftUI

struct ContentViewP: View {
    @State var testo : String = ""
    @State var linea : CGFloat = 0
    @StateObject var suoni = Suoni()
    var body: some View {
        HStack {
            VStack {
                Text("Inserisci un testo da riprodurre")
                    .padding()
                MultiLineTF(txt:$testo)
                    .border(Color.gray.opacity(0.5),width: 1)
                    .cornerRadius(3)
                    .padding()
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
                .frame(height: 30)
                .background(Color.red)
                .clipShape(Capsule())
                .padding(.top)
                .padding(.bottom,5)
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
                .frame(alignment: .center)
                .padding(.leading,UIScreen.main.bounds.width/4)
                
                Spacer()
            }
            
        }
    }
}

struct ContentViewP_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewP()
    }
}
