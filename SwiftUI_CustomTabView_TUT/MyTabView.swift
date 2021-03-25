//
//  MyTabView.swift
//  SwiftUI_CustomTabView_TUT
//
//  Created by 김선중 on 2021/03/25.
//

import SwiftUI

struct MyTabView: View {
    
    enum TabIndex {
        case home, profile, cart
    }
    
    @State var tabIndex: TabIndex
    @State var largeScale: CGFloat = 1.2
    
    
    func ChangeMyView(tabIndex: TabIndex) -> MyView {
        switch tabIndex {
        case .home:
            return MyView(title: "서근개발블로그", bgColor: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
        case .cart:
            return MyView(title: "장바구니", bgColor: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
        case .profile:
            return MyView(title: "사용자 계정", bgColor: Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
        default:
            return
                MyView(title: "서근개발블로그", bgColor: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
        }
    }
    
    func ChangeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .home:
            return Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
        case .cart:
            return Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        case .profile:
            return Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        default:
            return Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
        }
    }
    
    func CalculatePosition(tabIndex: TabIndex, geomerty: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            return -(geomerty.size.width/3)
        case .cart:
            return 0
        case .profile:
            return (geomerty.size.width/3)
        default:
            return -(geomerty.size.width/3)
        }
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                self.ChangeMyView(tabIndex: self.tabIndex)
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 80)
                    .offset(x: self.CalculatePosition(tabIndex: self.tabIndex, geomerty: geo), y: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button(action: {
                            withAnimation {
                                self.tabIndex = .home
                            }
                        }) {
                            
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .scaleEffect(self.tabIndex == .home ? self.largeScale : 1.0)
                                .frame(width: geo.size.width / 3, height: 50)
                                
                                .foregroundColor(self.tabIndex == .home ? self.ChangeIconColor(tabIndex: self.tabIndex): Color.gray)
                                .offset(y: self.tabIndex == .home ? -10 : 0)
                        }
                        .background(Color.white)
                        
                        Button(action: {
                            withAnimation{
                                self.tabIndex = .cart
                            }
                        }) {
                            
                            Image(systemName: "cart.fill")
                                .font(.title2)
                                .scaleEffect(self.tabIndex == .cart ? self.largeScale : 1.0)
                                .frame(width: geo.size.width / 3, height: 50)
                                
                                .foregroundColor(self.tabIndex == .cart ? self.ChangeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                .offset(y: self.tabIndex == .cart ? -10 : 0)
                        } .background(Color.white)
                        
                        Button(action: {
                            withAnimation {
                                self.tabIndex = .profile
                            }
                            
                        }) {
                            
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                                .scaleEffect(self.tabIndex == .profile ? self.largeScale : 1.0)
                                .frame(width: geo.size.width / 3, height: 50)
                                .foregroundColor(self.tabIndex == .profile ? self.ChangeIconColor(tabIndex: self.tabIndex) : Color.gray)
                                .offset(y: self.tabIndex == .profile ? -10 : 0)
                        }
                        .background(Color.white)
                        //HStack
                    }
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 10)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView(tabIndex: .home)
    }
}
