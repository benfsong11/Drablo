//
//  MyFeedView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI

struct MyFeedView: View {
    @State private var showModal: Bool = false
    @State private var showingSheet: Bool = false
    
    var body: some View {
        NavigationView {
            Text("이것은 내 피드입니다.")
                .navigationBarTitle("내 피드")
                .navigationBarItems(leading: Button("설정") {
                    showingSheet.toggle()
                }.sheet(isPresented: self.$showingSheet) {
                    SettingView()
                }, trailing: Button(action: {
                    self.showModal = true
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .frame(width: 44, height: 44, alignment: .trailing)
                }.sheet(isPresented: self.$showModal) {
                    CreateView()
                })
        }
    }
}

struct MyFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MyFeedView()
    }
}
