//
//  EmailSentView.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 08/01/25.
//

import SwiftUI

struct EmailSentView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var router: Router

    var body: some View {
        VStack(spacing:24){
            Spacer()
            Image(systemName: "envelope.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height:100)
                .foregroundStyle(.teal)
            
            VStack(spacing: 8){
                Text("Check Your email")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("We have sent a password recover instruction to your email")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            Button{
                
            }label:{
                Text("Skip, I'll confirm later")
            }.buttonStyle(CapsuleButtonStyle())
            Spacer()
            Button{
                dismiss()

            } label:{
                (Text("Did not recevie the email? check your spam filter, or ").foregroundStyle(.gray) +
                 Text("try another email address").foregroundStyle(.teal))
            }
        }.padding()
            .toolbarRole(.editor)
    }
}

#Preview {
    EmailSentView()
}
