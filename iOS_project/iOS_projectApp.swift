//
//  iOS_projectApp.swift
//  iOS_project
//
//  Created by sonjuwan on 6/2/25.
//

import SwiftUI

@main
struct iOS_projectApp: App {
    init() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()

       
            tabBarAppearance.backgroundColor = UIColor(Color(hex: "#A28CF5"))

            // 선택된 아이템 색상
            tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .white
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]

            // 비선택 아이템 색상
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .white.withAlphaComponent(0.6)
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white.withAlphaComponent(0.6)
            ]

            // iOS 15 이상 대응
            UITabBar.appearance().standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }   
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
