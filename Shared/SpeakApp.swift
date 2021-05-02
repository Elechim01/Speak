//
//  SpeakApp.swift
//  Shared
//
//  Created by Michele Manniello on 01/05/21.
//

import SwiftUI

@main
struct SpeakApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView()
            #else
            ContentViewP()
            #endif
        }
    }
}
//disablito il riquadro del focus ring
#if os(macOS)
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
            get{.none}
            set{}
        }
}
#endif
