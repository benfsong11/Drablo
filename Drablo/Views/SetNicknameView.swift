//
//  SetNicknameView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/27.
//

import SwiftUI

struct SetNicknameView: View {
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return Form {
            Section(footer: Text("사용 가능한 사용자 이름입니다.")) {
                TextField("최대 16글자", text: $userSettings.username)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .keyboardType(.alphabet)
            }
        }
        .navigationBarTitle("사용자 이름", displayMode: .inline)
    }
}

struct SetNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        SetNicknameView()
    }
}
