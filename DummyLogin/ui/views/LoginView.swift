//
//  LoginView.swift
//  DummyLogin
//
//  Created by freddy mejia on 28/10/23.
//

import SwiftUI
import Combine
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showTextPass: Bool = true
    @State private var cancellable = Set<AnyCancellable>()
    @State private var resultApi: ResultApi<Post> = ResultApi.error("")
    @State private var errorLogin = false
    @State private var errorLoginMessage = ""
    var body: some View {
        
        
        switch(resultApi){
        case .success(_):
            MainAppView()
        case .error:
            NavigationStack {
                VStack {
                    Image("place_holder_login")
                        .resizable()
                    //.frame(height: 280)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 30)
                    
                    
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
                    
                    
                    HStack {
                        Image("key_icon1")
                            .resizable()
                            .frame(
                                width: 32,
                                height: 32
                            )
                            .padding(
                                5
                            )
                        
                        if showTextPass {
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
                            showTextPass.toggle()
                        }) {
                            Image(systemName: self.showTextPass ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                        .padding(5)
                    }.frame(
                        maxWidth: .infinity
                    )
                    .padding(.horizontal, 25)
                    .padding(.bottom, 35)
                    
                    Button {
                        dummyLogin()
                    }
                label: {
                    Text(
                        NSLocalizedString("login", comment: "")
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
                    
                    HStack {
                        NavigationLink {
                            ForgotPasswordView()
                        } label: {
                            Text(NSLocalizedString("title_forgot_pass", comment: ""))
                                .underline()
                                .foregroundColor(.black)
                                .padding(.horizontal, 30)
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text(NSLocalizedString("title_new_user", comment: ""))
                                .underline()
                                .foregroundColor(.black)
                                .padding(.horizontal, 30)
                        }
                        
                    }
                    
                }
                .alert(isPresented: $errorLogin) {
                    Alert(
                        title: Text( self.errorLoginMessage),
                          dismissButton: .default(
                            Text(
                                NSLocalizedString("ok_btn", comment: "")
                            )
                          )
                    )
                }
                
            }
        case .loading:
            ProgressView()
        case _:
            EmptyView()
        }
    }
    
    func dummyLogin() {
        
        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errorLogin = true
            errorLoginMessage = NSLocalizedString("login_values_fill", comment: "")
            return
        }
        
        if !FillValidates().isValidEmail(email: email) {
            errorLogin = true
            errorLoginMessage = NSLocalizedString("login_email_error", comment: "")
            return
        }
        
        
        let apiEndpoint = InterfaceApi.dummy_endpoint
        guard let url = URL(string: apiEndpoint) else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Post.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    errorLogin = true
                    errorLoginMessage = error.localizedDescription
                    resultApi = ResultApi.error(error.localizedDescription)
                }
            }, receiveValue: { result in
                print("result \(result)")
                resultApi = ResultApi.success(result)
                errorLogin = false
                
            }).store(in: &cancellable)
    }
}

#Preview {
    LoginView()
}




