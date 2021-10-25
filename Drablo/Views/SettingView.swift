//
//  SettingView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI
import Firebase

struct SettingView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("이것은 닉네임 설정 화면입니다.")) {
                    Text("닉네임")
                }
                NavigationLink(destination: Text("이것은 상태 메시지 설정 화면입니다.")) {
                    Text("상태 메시지")
                }
                Button(action: {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    for _ in 1...2 {
                        self.mode.wrappedValue.dismiss()
                    }
                }) {
                    Text("로그아웃")
                        .foregroundColor(Color.red)
                }
            }
                .navigationTitle("설정")
                .navigationBarItems(trailing: Button("완료") {
                    self.mode.wrappedValue.dismiss()
                })
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
