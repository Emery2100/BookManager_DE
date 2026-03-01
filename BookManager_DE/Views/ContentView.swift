//
//  ContentView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import SwiftUI

struct ContentView: View {

    
    @AppStorage(SETTINGS_THEME_KEY) private var theme: Theme = .system
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentColor: Color = .blue

    var colorScheme: ColorScheme? {
        switch theme {
        case .system:
            return nil
        case Theme.dark:
            return .dark
        case .light:
            return .light
        }
    }

// Swift UI is declarative not imperative programming
    var body: some View {
        TabView{
            ListView()
            .tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .tint(accentColor)
        .preferredColorScheme(colorScheme)
    }

}

    #Preview {
        ContentView()
    }
