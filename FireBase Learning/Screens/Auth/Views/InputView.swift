//
//  InputView.swift
//  FireBase Learning
//
//  Created by anket kohak on 15/11/24.
//

import SwiftUI

struct InputView: View {
    let placeholder:String
    var isSecureField:Bool
    @Binding var text:String
    
    var body: some View {
        VStack(spacing: 12){
            if isSecureField{
                SecureField(placeholder, text: $text)
            }
            else{
                TextField(placeholder, text: $text)
            }
            Divider()
        }
    }
}

#Preview {
    InputView(placeholder: "Enter your name", isSecureField: false, text: .constant(""))
}
