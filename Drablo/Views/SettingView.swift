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
    
    // navigationBatTitle과 Form 사이의 거리를 없애 주는 코드
    init() {
        UITableView.appearance().sectionHeaderHeight = .zero
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Form {
                    Section {
                        NavigationLink(destination: SetNicknameView()) {
                            Text("사용자 이름")
                        }
                        NavigationLink(destination: SetStatusMessageView()) {
                            Text("상태 메시지")
                        }
                    }
                    Section {
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


