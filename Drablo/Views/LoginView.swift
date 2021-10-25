//
//  LoginView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/25.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var password: String = ""
    @State var visible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader {_ in
                    VStack {
                        UserImage()
                        WelcomeText()
                        TextField("이메일", text: self.$email)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.blue : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    TextField("비밀번호", text: self.$password)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                } else {
                                    SecureField("비밀번호", text: self.$password)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                }
                            }
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color.blue : self.color, lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                self.reset()
                            }) {
                                Text("비밀번호를 잊으셨나요?")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.blue)
                            }
                        }
                        .padding(.top, 20)
                        
                        Button(action: {
                            self.verify()
                        }) {
                            Text("로그인")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
                
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("회원가입")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.blue)
                }
                .padding()
            }
            
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    func verify() {
        if self.email != "" && self.password != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.password) {
                (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                print("성공")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        } else {
            self.error = "올바른 값을 입력하세요."
            self.alert.toggle()
        }
    }
    
    func reset() {
        if self.email != "" {
            Auth.auth().sendPasswordReset(withEmail: self.email) {
                (err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                self.error = "비밀번호를 초기화합니다."
                self.alert.toggle()
            }
        } else {
            self.error = "찾으실 비밀번호의 이메일을 입력하세요."
            self.alert.toggle()
        }
    }
}


struct SignupView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                GeometryReader {_ in
                    VStack {
                        Image("주르륵")
                            .resizable()
                            .aspectRatio(UIImage(named: "주르륵")!.size, contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .cornerRadius(150)
                            .padding(.top, 20)
                        WelcomeText()
                        TextField("이메일", text: self.$email)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.blue : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    TextField("비밀번호", text: self.$password)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                } else {
                                    SecureField("비밀번호", text: self.$password)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                }
                            }
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color.blue : self.color, lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.revisible {
                                    TextField("비밀번호 확인", text: self.$repassword)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                } else {
                                    SecureField("비밀번호 확인", text: self.$repassword)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                }
                            }
                            Button(action: {
                                self.revisible.toggle()
                            }) {
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color.blue : self.color, lineWidth: 2))
                        .padding(.top, 25)
                        
                        
                        Button(action: {
                            self.register()
                        }) {
                            Text("회원가입")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
            }
            
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    func register() {
        if self.email != "" {
            if self.password == self.repassword {
                Auth.auth().createUser(withEmail: self.email, password: self.password) {
                    (res, err) in
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    print("성공")
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            } else {
                self.error = "비밀번호가 일치하지 않습니다."
                self.alert.toggle()
            }
        } else {
            self.error = "올바른 값을 입력하세요."
            self.alert.toggle()
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        return Text("환영합니다!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.top, 20)
    }
}

struct UserImage: View {
    var body: some View {
        return Image("주르륵")
            .resizable()
            .aspectRatio(UIImage(named: "주르륵")!.size, contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.top, 150)
    }
}

struct ErrorView: View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(self.error == "비밀번호를 초기화합니다." ? "안내 메시지" : "로그인 실패")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(self.color)
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "비밀번호를 초기화합니다." ? "비밀번호 초기화 링크가 성공적으로 발송되었습니다." : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text(self.error == "비밀번호를 초기화합니다." ? "확인" : "취소")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}
