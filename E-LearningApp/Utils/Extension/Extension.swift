//
//  Extension.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import Foundation
import SwiftUI

extension Color{
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
        
        func toHex() -> String {
            if #available(iOS 14.0, *) {
                let uiColor = UIColor(self)
                return uiColor.toHex()
            } else {
                return ""
            }
        }
    }
    static let blackColor = Color(hex: "#000000")
    static let whiteColor = Color(hex: "#FFFFFF")
    static let darkGreyColor = Color(hex: "#85868B")
    static let greyColor = Color(hex: "#BDC3C7")
    static let lightGreyColor = Color(hex: "#D6D7DA")
    static let greyFourColor = Color(hex: "#F2F2F7")
    static let greyFiveColor = Color(hex: "#F7F7F7")
    static let systemRedColor = Color(hex: "#F43457")
    static let systemGreenColor = Color(hex: "#15AA2C")
    static let systemBlueColor = Color(hex: "#0F82FF")
    static let screenBackground = Color(hex: "#F9F9F9")
    static let screenGreyBackground = Color(hex: "#E5E5E5")
    static let logoColor = Color(hex: "#b19f8d")
    static let hoverBlack = Color(hex: "#1C1C1C")
    static let shimmerGrey = Color(hex: "#e9edf1")
    static let orangeGrey = Color(hex: "#FF7F23")

}

extension UIColor {
    convenience init(_ color: Color) {
        let uiColor = UIColor.colorFrom(color: color)
        self.init(cgColor: uiColor.cgColor)
        
        
    }
    
    
    
    func toHex() -> String {
        guard let components = cgColor.components, components.count >= 3 else {
            return ""
        }
        
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components.count >= 4 ? components[3] : 1.0
        
        return String(format: "#%02lX%02lX%02lX%02lX", lroundf(Float(red) * 255), lroundf(Float(green) * 255), lroundf(Float(blue) * 255), lroundf(Float(alpha) * 255))
    }
    
    private func lroundf(_ value: Float) -> Int {
        return Int(value.rounded())
    }
    
    private static func colorFrom(color: Color) -> UIColor {
        let coordinator = UICoordinator(color: color)
        return coordinator.uiColor
    }
    
    private class UICoordinator: ObservableObject {
        @Published var uiColor: UIColor = .clear
        
        init(color: Color) {
            DispatchQueue.main.async {
                self.uiColor = self.makeUIColor(from: color)
            }
        }
        
        private func makeUIColor(from color: Color) -> UIColor {
            let controller = UIHostingController(rootView: color)
            _ = controller.view
            
            return controller.view.backgroundColor ?? .clear
        }
    }
}
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
