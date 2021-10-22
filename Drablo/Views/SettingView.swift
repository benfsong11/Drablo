//
//  SettingView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            Text("이것은 설정 화면입니다.")
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
