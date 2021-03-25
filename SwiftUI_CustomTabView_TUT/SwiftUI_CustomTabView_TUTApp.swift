//
//  SwiftUI_CustomTabView_TUTApp.swift
//  SwiftUI_CustomTabView_TUT
//
//  Created by 김선중 on 2021/03/25.
//

import SwiftUI

@main
struct SwiftUI_CustomTabView_TUTApp: App {
    var body: some Scene {
        WindowGroup {
            MyTabView(tabIndex: .home)
        }
    }
}
