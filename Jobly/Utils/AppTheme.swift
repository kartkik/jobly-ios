//
//  AppTheme.swift
//  Jobly
//
//  Created by 12345 on 28/08/1404 AP.
//

import Foundation
import SwiftUI

final class AppTheme {
    // NOTHING-STYLE COLORS (you can adjust to your taste)
    static let primary = Color("Primary")
    static let background = Color("Background")
    static let accent = Color("Accent")

    // FONT UTILITY
    static func montserrat(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch weight {
        case .bold: return Font.custom("Montserrat-Bold", size: size)
        case .semibold: return Font.custom("Montserrat-SemiBold", size: size)
        default: return Font.custom("Montserrat-Regular", size: size)
        }
    }
}



import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        let constraints = [
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate(constraints)

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

