//
//  NotificationView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            Text("이것은 알림 화면입니다.")
                .navigationTitle("알림")
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
