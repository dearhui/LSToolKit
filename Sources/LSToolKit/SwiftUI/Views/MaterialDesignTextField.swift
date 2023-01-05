//
//  MaterialDesignTextField.swift
//  TopChurch (iOS)
//
//  Created by minghui on 2022/9/21.
//

import SwiftUI
import PureSwiftUI

public struct MaterialDesignTextField: View {
    
    public init(name: LocalizedStringKey,
                value: Binding<String>,
                isSecure: Bool = false,
                hint: LocalizedStringKey? = nil,
                verified: Bool = true,
                focused: Bool = false)
    {
        self.name = name
        self.hint = hint
        self._value = value
        self.isSecure = isSecure
        self.verified = verified
        self.focused = focused
        self._mySecure = State(wrappedValue: isSecure)
    }
    @Environment(\.isEnabled) var isEnabled
    
    var name: LocalizedStringKey
    var hint: LocalizedStringKey?
    @Binding var value: String
    var isSecure: Bool = false
    var verified: Bool = true
    var focused: Bool = false
    
    @State private var mySecure: Bool = false
    
    var _verified: Bool {
        if focused {
            return true
        }
        
        if value.isEmpty {
            return true
        }
        
        return verified
    }
    
    var isMini: Bool {
        return focused || value.isNotEmpty
    }
    
    public var body: some View {
        VStack (spacing: 4) {
            // field
            ZStack {
                Group {
                    if isSecure && mySecure {
                        SecureField("", text: $value)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                    } else {
                        TextField("", text: $value)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                    }
                }
                .yOffsetIf(isMini, 8)
                .foregroundColor(isEnabled ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
                
                Text(name)
                    .greedyWidth(.leading)
                    .font(isMini ? .caption : .body)
                    .yOffsetIf(isMini, -12)
                    .foregroundColor(isMini ? .accentColor : .gray500)
                    .zIndex(-1)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(_verified ? Color.clear : Color(UIColor.systemPink))
                    .background(
                        Color(UIColor.secondarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    )
            )
            .overlayIf(isSecure, eyeButton, alignment: .trailing)
            
            // hint
            if (focused || !_verified), let hint = hint {
                Text(hint)
                    .font(.caption)
                    .greedyWidth(.leading)
                    .padding(.horizontal)
                    .foregroundColor(_verified ? Color(UIColor.secondaryLabel) : Color(UIColor.systemPink))
            }
        }
        .animation(.easeInOut, value: isMini)
    }
    
    var eyeButton: some View {
        Button {
            mySecure.toggle()
        } label: {
            Image(sfSymbol: mySecure ? .eye_slash_fill : .eye_fill)
                .padding()
                .foregroundColor(.secondary)
        }
        .zIndex(100)
    }
}

struct MaterialDesignTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MaterialDesignTextField(name: "register_nick_name",
                                    value: .constant(""),
                                    hint: "register_nick_name_hint",
                                    verified: true,
                                    focused: false)
            MaterialDesignTextField(name: "register_nick_name",
                                    value: .constant("disabled true"),
                                    hint: "register_nick_name_hint",
                                    verified: true,
                                    focused: false)
            .disabled(true)
            MaterialDesignTextField(name: "register_nick_name",
                                    value: .constant("123"),
                                    hint: "register_nick_name_hint",
                                    verified: true,
                                    focused: true)
            MaterialDesignTextField(name: "register_nick_name",
                                    value: .constant("123"),
                                    hint: "register_nick_name_hint",
                                    verified: false,
                                    focused: false)
            MaterialDesignTextField(name: "密碼",
                                    value: .constant("123"), isSecure: true,
                                    hint: "register_nick_name_hint",
                                    verified: false,
                                    focused: false)
        }
        .padding()
    }
}
