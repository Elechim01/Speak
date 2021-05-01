//
//  Modelli.swift
//  Speak
//
//  Created by Michele Manniello on 01/05/21.
//

import Foundation
import SwiftUI
import AVFoundation
import AudioToolbox
class Suoni : ObservableObject{
    @Published var time : CGFloat = 0
//    funzione che riproduce un suono
    func Riproduci (text: String){
//        valore della stringa
        let utterance = AVSpeechUtterance(string: text)
//        lingua
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
//        velocità da usare per parlare
        utterance.rate = 0.2
//        creo lo speaker
        let synthesizer = AVSpeechSynthesizer()
//        lo faccio parlare
        synthesizer.speak(utterance)
    }
    func RiproduttoreSuono(){
        let tipoSuono = Int.random(in: 1..<19)
        var suono : NSSound
        var path : String
        var timer = Timer()
        var i = 1
        switch tipoSuono {
    case 1:
        path = Bundle.main.path(forResource: "p1.mp3",ofType: nil)!
    case 2:
        path = Bundle.main.path(forResource: "p2.mp3",ofType: nil)!
    case 3:
        path = Bundle.main.path(forResource: "p3.mp3",ofType: nil)!
    case 4:
        path = Bundle.main.path(forResource: "p4.mp3",ofType: nil)!
    case 5:
        path = Bundle.main.path(forResource: "p5.mp3",ofType: nil)!
    case 6:
        path = Bundle.main.path(forResource: "p6.mp3",ofType: nil)!
    case 7:
        path = Bundle.main.path(forResource: "p7.mp3",ofType: nil)!
    case 8:
        path = Bundle.main.path(forResource: "p8.mp3",ofType: nil)!
    case 9:
        path = Bundle.main.path(forResource: "p9.mp3",ofType: nil)!
    case 10:
        path = Bundle.main.path(forResource: "p10.mp3",ofType: nil)!
    case 11:
        path = Bundle.main.path(forResource: "p11.mp3",ofType: nil)!
    case 12:
        path = Bundle.main.path(forResource: "p12.mp3",ofType: nil)!
    case 13:
        path = Bundle.main.path(forResource: "p13.mp3",ofType: nil)!
    case 14:
        path = Bundle.main.path(forResource: "p14.mp3",ofType: nil)!
    case 15:
        path = Bundle.main.path(forResource: "p15.mp3",ofType: nil)!
    case 16:
        path = Bundle.main.path(forResource: "p16.mp3",ofType: nil)!
    case 17:
        path = Bundle.main.path(forResource: "p17.mp3",ofType: nil)!
    case 18:
        path = Bundle.main.path(forResource: "p1.mp3",ofType: nil)!
    default:
        path = ""
    }
        suono = NSSound(contentsOfFile: path, byReference: true)!
//        ottengo il numero di giri
//        divido la lunghezza intero del suono per il tempo del timer
        let r1 = Double(suono.duration) / 0.5
        print("🤖 raggio",r1)
//        divido la lunghezza del rettangolo per il risultato ottenuto
        let r  = 200 / Int(r1)
        
        suono.play()
//        devo mostrare la barra con il tempo provo a vedere un cilo infinito
        print("🤖Suono",Int(suono.duration))
//
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){_ in
            if suono.isPlaying{
//                print("🤖Suono",suono.currentTime)
//                controllo che abbia finito di ciclare per il calcolo di r1 problema tecnico di tempistische
                if i <= Int(r1){
                    print("🤖lunghezza",r)
                    self.time += CGFloat(r)
                    print("time",self.time)
//                    problema che se c'è un valore non perfetto non si completa la barra.
                    if i == Int(r1){
                        if self.time < 200{
                            self.time = 200
                        }
                    }
                }
            }
            else{
                suono.stop()
                self.time = 0
                timer.invalidate()
                print("stop")
            }
            i += 1
        }
            

    }
    
}
