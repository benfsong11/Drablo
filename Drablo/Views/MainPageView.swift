//
//  MainPageView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/25.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈")
            }
            .tag(1)
            SearchView()
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("검색")
            }
            .tag(2)
            NotificationView()
            .tabItem {
                Image(systemName: "bell.fill")
                Text("알림")
            }
            .tag(3)
            MyFeedView()
            .tabItem {
                Image(systemName: "person.fill")
                Text("내 피드")
            }
            .tag(4)
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
