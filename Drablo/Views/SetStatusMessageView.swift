//
//  SetStatusMessageView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/27.
//

import SwiftUI

struct SetStatusMessageView: View {
    @ObservedObject var statusMessageSettings = StatusMessageSettings()
    
    var body: some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return Form {
            Section(footer: Text("오늘 당신의 기분을 표현해 보세요!")) {
                TextField("최대 100글자", text: $statusMessageSettings.statusMessage)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)            }
        }
        .navigationBarTitle("상태 메시지", displayMode: .inline)
    }
}

struct SetStatusMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SetStatusMessageView()
    }
}
