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
       
        NavigationView {
            VStack(alignment:.center) {
//                Text("Inserisci un testo da riprodurre")
//                    .padding()
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
                            .frame(width: 200,height: 10,alignment: .center)
                            .clipShape(Capsule())
                            .foregroundColor(.green)
                        Rectangle()
                            .frame(width: self.suoni.time,height: 10,alignment: .center)
                            .foregroundColor(.red)
                            .clipShape(Capsule())
                }
                .frame(width: GetWidthSize(),alignment: .center)
                .padding()
                Spacer()
            }
            .navigationBarTitle("Inserisci un testo da riprodurre")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                hideKeyboard()
        }
        }
    }
    func GetWidthSize() -> CGFloat {
        let larghezza = UIScreen.main.bounds.width
        print(larghezza)
//        per iphone con la notch
//

        switch larghezza {
//           Iphone 12Pro 390
        case 390:
            return UIScreen.main.bounds.width/2
//        Iphone 12Mini 375 e phone 8
        case 375:
            return UIScreen.main.bounds.width/2
//            Iphone 12proMax 428
        case 428:
            return UIScreen.main.bounds.width/2.3
//            Iphone 8plus 414
        case 414:
            return UIScreen.main.bounds.width/2.1
//            Ipod touch
        case 320:
            return UIScreen.main.bounds.width/1.6
//        Ipad pro 12.9
        case 1024:
            return UIScreen.main.bounds.width/5.5
//         ipad pro 11 pollici
        case 834:
            return UIScreen.main.bounds.width/4.5
//            Ipad pro 9.7 pollici
        case 768:
            return UIScreen.main.bounds.width/4
//            Ipad Air
        case 820:
            return UIScreen.main.bounds.width/4.3
//            IPad di 8 generazione
        case 810:
            return UIScreen.main.bounds.width/4
        default:
            return UIScreen.main.bounds.width/2
        }
        
    }
}

struct ContentViewP_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewP()
    }
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

