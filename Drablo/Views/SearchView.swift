//
//  SearchView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("이것은 검색 화면입니다.")
                .navigationTitle("검색")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
