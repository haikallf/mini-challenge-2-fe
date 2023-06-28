//
//  FontConfig.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 28/06/23.
//

import SwiftUI

struct CustomFont {
    
    /// Create a font with the large title text style.
    public static var largeTitle: Font {
        return Font.custom("Epilogue", size: 42)
    }

    /// Create a font with the title text style.
    public static var title: Font {
        return Font.custom("Epilogue", size: 38)
    }
    
    /// Create a font with the title text style.
    public static var title2: Font {
        return Font.custom("Epilogue", size: 35)
    }
    
    /// Create a font with the title text style.
    public static var title3: Font {
        return Font.custom("Epilogue", size: 29)
    }
    
    /// Create a font with the title text style.
    public static var title4: Font {
        return Font.custom("Epilogue", size: 24)
    }
    
    /// Create a font with the title text style.
    public static var title5: Font {
        return Font.custom("Epilogue", size: 22)
    }
    
    /// Create a font with the title text style.
    public static var title6: Font {
        return Font.custom("Epilogue", size: 20)
    }

    /// Create a font with the headline text style.
    public static var headline: Font {
        return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
    }

    /// Create a font with the subheadline text style.
    public static var subheadline: Font {
        return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
    }

    /// Create a font with the body text style.
    public static var body: Font {
           return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
       }

    /// Create a font with the callout text style.
    public static var callout: Font {
           return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
       }

    /// Create a font with the footnote text style.
    public static var footnote: Font {
           return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
       }

    /// Create a font with the caption text style.
    public static var caption: Font {
           return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
       }
    
    /// Create a font with the caption text style.
    public static var caption2: Font {
           return Font.custom("Epilogue", size: UIFont.preferredFont(forTextStyle: .caption2).pointSize)
       }

    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        var font = "Epilogue"
        switch weight {
        case .bold: font = "Epilogue"
        case .heavy: font = "Epilogue"
        case .light: font = "Epilogue"
        case .medium: font = "Epilogue"
        case .semibold: font = "Epilogue"
        case .thin: font = "Epilogue"
        case .ultraLight: font = "Epilogue"
        default: break
        }
        return Font.custom(font, size: size)
    }
    
    public static func epilogue(size:CGFloat) -> Font{
        return Font.custom("Epilogue", size: size)
    }
}

//struct Fonts {
//
//    static func epilogue(size:CGFloat) -> Font{
//        return Font.custom("Epilogue", size: size)
//    }
//
//}
