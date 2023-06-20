//
//  Onboarding.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

struct Onboarding: Equatable {
    let id: Int
    let filename: String
    let title: String
    let content: String
    
}

extension Onboarding {
    static let all = [
        Onboarding(id: 1, filename: "filename", title: "Selamat Datang di Scan2Cook!", content: "Cupcake ipsum dolor sit amet oat cake icing. Liquorice marzipan sugar plum."),
        Onboarding(id: 2, filename: "filename", title: "Cupcake ipsum dolor sit amet", content: "Lemon drops brownie chocolate bar candy sweet roll carrot cake. Cupcake gingerbread gingerbread chocolate cake donut jelly."),
        Onboarding(id: 3, filename: "filename", title: "Narwhal unicorn bruh, 8-bit cardigan 90's hashtag celiac", content: "Fixie fam seitan food truck, brunch XOXO bicycle rights kale chips aesthetic."),
    ]
}
