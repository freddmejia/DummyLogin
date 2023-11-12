//
//  ForgotPasswordView.swift
//  DummyLogin
//
//  Created by freddy mejia on 10/11/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    var body: some View {
        VStack {
            HStack {
                Image("at_icon")
                    .resizable()
                    .frame(
                        width: 32,
                        height: 32
                    )
                    .padding(
                        5
                    )
                
                TextField(
                    NSLocalizedString("write_your_email", comment: ""),
                    text: $email
                )
                .foregroundColor(Color.black)
                .font(.title2)
                .padding(.horizontal,5)
                .onReceive(
                    email.publisher.collect()
                ){
                    self.email = String($0.prefix(40))
                }
            }
            .frame(
                maxWidth: .infinity
            )
            .padding(.horizontal, 25)
            .padding(.vertical, 15)
            
            
            Button {
                print("add here your code")
                }
            label: {
                Text(
                    NSLocalizedString("forgot_pass_init", comment: "")
                )
                .frame(maxWidth: .infinity)
                .font(.title2)
                .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("color_login_btn"))
            .padding(
                .init(
                    top: 0,
                    leading: 20,
                    bottom: 30,
                    trailing: 20
                )
            )
            
        }
        .navigationBarTitle(NSLocalizedString("title_forgot_password", comment: ""), displayMode: .inline)
    }
}

#Preview {
    ForgotPasswordView()
}
