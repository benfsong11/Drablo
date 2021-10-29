//
//  NewsView.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/27.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        HStack {
            Image("주르륵")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
            Text("Drablo에 오신 것을 환영합니다! Drablo는 그림 전문 SNS입니다. 여러분의 그림을 마음껏 공유해 보세요!")
                .font(.system(size: 12))
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12)
                .foregroundColor(.gray)
        }    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
