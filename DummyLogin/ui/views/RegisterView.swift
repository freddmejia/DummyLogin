//
//  SwiftUIView.swift
//  DummyLogin
//
//  Created by freddy mejia on 10/11/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var showPassword: Bool = true
    @State private var password = ""
    @State private var showR_Password: Bool = true
    @State private var r_password = ""
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
            
            
            HStack{
                Image("key_icon1")
                    .resizable()
                    .frame(
                        width: 32,
                        height: 32
                    )
                    .padding(
                        5
                    )
                
                if showPassword {
                    SecureField(
                        NSLocalizedString("write_your_password", comment: ""),
                        text: $password
                    )
                    .foregroundColor(Color.black)
                    .font(.title2)
                    .padding(.horizontal,5)
                    .onReceive(
                        password.publisher.collect()
                    ){
                        self.password = String($0.prefix( 40))
                    }
                }
                else{
                    TextField(
                        NSLocalizedString("write_your_password", comment: ""),
                        text: $password
                    )
                    .foregroundColor(Color.black)
                    .font(.title2)
                    .padding(.horizontal,5)
                    .onReceive(
                        password.publisher.collect()
                    ){
                        self.password = String($0.prefix(40))
                    }
                }
                
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: self.showPassword ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
                .padding(5)
            }.frame(
                maxWidth: .infinity
            )
            .padding(.horizontal, 25)
            .padding(.bottom, 35)
          
            HStack{
                Image("key_icon1")
                    .resizable()
                    .frame(
                        width: 32,
                        height: 32
                    )
                    .padding(
                        5
                    )
                
                if showR_Password {
                    SecureField(
                        NSLocalizedString("r_password", comment: ""),
                        text: $r_password
                    )
                    .foregroundColor(Color.black)
                    .font(.title2)
                    .padding(.horizontal,5)
                    .onReceive(
                        r_password.publisher.collect()
                    ){
                        self.r_password = String($0.prefix( 40))
                    }
                }
                else{
                    TextField(
                        NSLocalizedString("r_password", comment: ""),
                        text: $r_password
                    )
                    .foregroundColor(Color.black)
                    .font(.title2)
                    .padding(.horizontal,5)
                    .onReceive(
                        r_password.publisher.collect()
                    ){
                        self.r_password = String($0.prefix(40))
                    }
                }
                
                Button(action: {
                    showR_Password.toggle()
                }) {
                    Image(systemName: self.showR_Password ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
                .padding(5)
            }.frame(
                maxWidth: .infinity
            )
            .padding(.horizontal, 25)
            .padding(.bottom, 35)
            
            
            Button {
                print("add here your code")
                }
            label: {
                Text(
                    NSLocalizedString("register", comment: "")
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
        .navigationBarTitle(NSLocalizedString("title_create_account", comment: ""), displayMode: .inline)

    }
}

#Preview {
    RegisterView()
}
