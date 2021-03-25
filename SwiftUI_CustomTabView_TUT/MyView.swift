//
//  MyView.swift
//  SwiftUI_CustomTabView_TUT
//
//  Created by 김선중 on 2021/03/25.
//

import SwiftUI

struct MyView: View {
    
    var title: String
    var bgColor: Color
    
    var body: some View {
    
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(.all)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .animation(.none)
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "홈", bgColor: Color.yellow)
    }
}
