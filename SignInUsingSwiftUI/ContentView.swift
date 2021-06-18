//
//  ContentView.swift
//  SignInUsingSwiftUI
//
//  Created by Ahmed kamal on 6/18/21.
//

import SwiftUI

let lightColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "Ahmed"
let storedpassword = "12345"
struct ContentView: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    
    @State var authDidFaild: Bool = false
    @State var textFieldIsEmty: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
              
                UserImage()
                UserNameTextField(userName: $userName)
                PasswordTextFiled(password: $password)
                if authDidFaild {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                if textFieldIsEmty {
                    Text("Please enter all data.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
        
                Button(action: {
                    if userName.isEmpty || password.isEmpty {
                        self.textFieldIsEmty = true
                        self.authDidFaild = false
                    } else if self.userName != storedUsername && self.password != storedpassword {
                        self.authDidFaild = true
                        self.textFieldIsEmty = false
                    } else {
                        self.textFieldIsEmty = false
                        self.authDidFaild = false
                    }
                    
                }) {
                    LoginButton()
                }
            }
            
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.top, -50)
            .padding(.bottom, 50)
    }
}

struct UserNameTextField: View {
    @Binding var userName: String
    var body: some View {
        TextField("User Name", text: $userName)
            .padding()
            .background(lightColor)
            .cornerRadius(25.0)
            .padding(.bottom, 10)
          //  .padding(.top, 50)
            .padding(.leading, 16)
            .padding(.trailing, 16)
    }
}

struct PasswordTextFiled: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightColor)
            .cornerRadius(25.0)
            .padding(.bottom, 10)
//            .padding(.top, 10)
            .padding(.leading, 16)
            .padding(.trailing, 16)
    }
}

struct LoginButton: View {
    var body: some View {
        
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 50)
            .background(Color.black)
            .cornerRadius(25.0)
    }
}
