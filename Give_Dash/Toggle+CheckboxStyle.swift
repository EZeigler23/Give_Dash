//
//  Toggle+CheckboxStyle.swift
//  Give_Dash
//
//  Created by Elancio Zeigler on 2/6/24.
//


import Foundation
import SwiftUI
extension Color {
init(hex: String) {
var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
print(cleanHexCode)
var rgb: UInt64 = 0

    Scanner(string: cleanHexCode).scanHexInt64(&rgb)
    
    let redValue = Double((rgb >> 16) & 0xFF) / 255.0
    let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
    let blueValue = Double(rgb & 0xFF) / 255.0
    self.init(red: redValue, green: greenValue, blue: blueValue)
}
}

struct ToggleCheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill : .none)
        }
        .tint(Color(hex: "263F56"))
    }
}

extension ToggleStyle where Self == ToggleCheckboxStyle {
    static var checklist: ToggleCheckboxStyle { .init() }
}
