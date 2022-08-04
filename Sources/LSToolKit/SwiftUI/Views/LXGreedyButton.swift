//
//  LXGreedyButton.swift
//  
//
//  Created by minghui on 2022/8/4.
//

import SwiftUI

public struct LXGreedyButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    public var textColor: Color = .white
    public var backgroundColor: Color = .accentColor
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(configuration.isPressed ? backgroundColor.opacity(0.5) : (isEnabled ? backgroundColor : Color.gray.opacity(0.5)))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
