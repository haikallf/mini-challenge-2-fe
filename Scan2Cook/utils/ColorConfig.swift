//
//  ColorConfig.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 28/06/23.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct Colors {
    //MARK: - Primary
    public static var primary: Color {
        return Color(hex: 0x964a03)
    }
    public static var onPrimary: Color {
        return Color(hex: 0xffffff)
    }
    public static var primaryContainer: Color {
        return Color(hex: 0xffddc7)
    }
    public static var onPrimaryContainer: Color {
        return Color(hex: 0x311400)
    }
    
    //MARK: - Secondary
    public static var secondary: Color {
        return Color(hex: 0x755846)
    }
    public static var onSecondary: Color {
        return Color(hex: 0xffffff)
    }
    public static var secondaryContainer: Color {
        return Color(hex: 0xffddc7 )
    }
    public static var onSecondaryContainer: Color {
        return Color(hex: 0x2b1708)
    }
    
    //MARK: - Tertiary
    public static var tertiary: Color {
        return Color(hex: 0x797a4a)
    }
    public static var onTertiary: Color {
        return Color(hex: 0xffffff)
    }
    public static var tertiaryContainer: Color {
        return Color(hex: 0xe6e6ad)
    }
    public static var onTertiaryContainer: Color {
        return Color(hex: 0x1c1d00)
    }
    
    //MARK: - Error
    public static var error: Color {
        return Color(hex: 0xba1a1a)
    }
    public static var onError: Color {
        return Color(hex: 0xffffff)
    }
    public static var errorContainer: Color {
        return Color(hex: 0xba1a1a)
    }
    public static var onErrorContainer: Color {
        return Color(hex: 0x410002)
    }
    
    //MARK: - Background
    public static var background: Color {
        return Color(hex: 0xfff8f4)
    }
    public static var onBackground: Color {
        return Color(hex: 0x201a17)
    }
    public static var surface: Color {
        return Color(hex: 0xfeeadd)
    }
    public static var onSurface: Color {
        return Color(hex: 0x201a17)
    }
    public static var surfaceContainerHighest: Color {
        return Color(hex: 0xece0da)
    }
    public static var surfaceContainerHigh: Color {
        return Color(hex: 0xf9e4d8)
    }
    public static var surfaceContainer: Color {
        return Color(hex: 0xf9e4d8)
    }
    public static var surfaceContainerLow: Color {
        return Color(hex: 0xfff1ea)
    }
    public static var surfaceContainerLowest: Color {
        return Color(hex: 0xfefbff)
    }
    
    //MARK: - Labels
    public static var AAA: Color {
        return Color(hex: 0x201a17)
    }
    public static var AA: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.87)
    }
    public static var disabled: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.30)
    }
    public static var invertedAAA: Color {
        return Color(hex: 0xffffff)
    }
    public static var invertedAA: Color {
        return Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255).opacity(0.87)
    }
    public static var invertedDisabled: Color {
        return Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255).opacity(0.30)
    }
    
    //MARK: - Borders
    public static var border1: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.20)
    }
    public static var border2: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.16)
    }
    public static var border3: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.15)
    }
    public static var border4: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.12)
    }
    public static var border5: Color {
        return Color(.sRGB, red: 32/255, green: 26/255, blue: 23/255).opacity(0.10)
    }
    
    //MARK: - Card
    public static var card1: Color {
        return Color(hex: 0xffede4)
    }
    public static var card2: Color {
        return Color(hex: 0xfff8f5)
    }
    public static var card3: Color {
        return Color(hex: 0xfff8f5)
    }
    public static var card4: Color {
        return Color(hex: 0xfff8f5)
    }
    public static var card5: Color {
        return Color(hex: 0xfff8f5)
    }
    
}
