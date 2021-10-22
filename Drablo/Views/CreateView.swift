//
//  CreateView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            Text("이것은 새 글 작성 화면입니다.")
                .navigationTitle("새 글 작성")
                .navigationBarItems(trailing: Button("취소") {
                    self.mode.wrappedValue.dismiss()
                })
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
