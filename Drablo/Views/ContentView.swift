//
//  ContentView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var show: Bool = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        if self.status {
            MainPageView()
        } else {
            NavigationView {
                ZStack {
                    NavigationLink(
                        destination: SignupView(show: self.$show),
                        isActive: self.$show
                    ) {
                        Text("")
                    }
                    .hidden()
                    LoginView(show: self.$show)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) {
                        (_) in
                        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
