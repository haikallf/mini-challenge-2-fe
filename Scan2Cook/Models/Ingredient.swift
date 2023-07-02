//
//  Ingredient.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct Ingredient: Equatable, Identifiable, Hashable {
    let id: String
    let name: String
    let attribute: String?
}

extension Ingredient {
    static let all = [
        Ingredient(id: "BAWANG_MERAH", name: "Bawang Merah", attribute: "bawang-merah"),
        Ingredient(id: "TELUR", name: "Telur", attribute: "Telur"),
        Ingredient(id: "JAGUNG", name: "Jagung", attribute: "Jagung"),
        Ingredient(id: "PAKCOY", name: "Pakcoy", attribute: "Pakcoy"),
        Ingredient(id: "ROTI", name: "Roti", attribute: ""),
        Ingredient(id: "BAWANG_PUTIH", name: "Bawang Putih", attribute: "bawang-putih"),
        Ingredient(id: "TOMAT", name: "Tomat", attribute: "Tomat"),
        Ingredient(id: "LABU_SIAM", name: "Labu Siam", attribute: "Labu Siam"),
        Ingredient(id: "CABE", name: "Cabe", attribute: "Cabe"),
        Ingredient(id: "MARGARIN", name: "Margarin", attribute: "Margarin"),
        Ingredient(id: "JAMUR", name: "Jamur", attribute: "Jamur"),
        Ingredient(id: "TAHU", name: "Tahu", attribute: "Tahu"),
        Ingredient(id: "TERONG", name: "Terong", attribute: "Terong"),
        Ingredient(id: "MIE_INSTANT", name: "Mie Instant", attribute: "Mie Instan"),
        Ingredient(id: "KECAP_KEMASAN", name: "Kecap Kemasan", attribute: "Kecap Kemasan"),
        Ingredient(id: "JERUK_NIPIS", name: "Jeruk Nipis", attribute: "Jeruk Nipis"),
        Ingredient(id: "DAGING_AYAM", name: "Daging Ayam", attribute: "daging-ayam"),
        Ingredient(id: "SOSIS", name: "Sosis", attribute: "Sosis"),
        Ingredient(id: "KENCUR", name: "Kencur", attribute: "Kencur"),
        Ingredient(id: "BAYAM", name: "Bayam", attribute: "bayam"),
        Ingredient(id: "KALDU_BUBUK", name: "Kaldu Bubuk", attribute: "Kaldu Bubuk"),
        Ingredient(id: "BAWANG_BOMBAY", name: "Bawang Bombay", attribute: "Bawang Bombay"),
        Ingredient(id: "TEMPE", name: "Tempe", attribute: "Tempe"),
        Ingredient(id: "KANGKUNG", name: "Kangkung", attribute: "Kangkung"),
        Ingredient(id: "UDANG", name: "Udang", attribute: "Udang"),
        Ingredient(id: "TERASI", name: "Terasi", attribute: "Terasi"),
        Ingredient(id: "SUSU", name: "Susu", attribute: "Susu"),
        Ingredient(id: "MACARONI", name: "Macaroni", attribute: "Macaroni"),
        Ingredient(id: "CAISIM", name: "Caisim", attribute: "Caisim"),
        Ingredient(id: "SAWI_PUTIH", name: "Sawi Putih", attribute: "Sawi Putih"),
        Ingredient(id: "DAUN_SELEDRI", name: "Daun Seledri", attribute: "Daun Seledri"),
        Ingredient(id: "TAUGE", name: "Tauge", attribute: "Taoge"),
        Ingredient(id: "KACANG_PANJANG", name: "Kacang Panjang", attribute: "Kacang Panjang"),
        Ingredient(id: "WORTEL", name: "Wortel", attribute: "Wortel"),
        Ingredient(id: "SPAGHETTI", name: "Spaghetti", attribute: "Spaghetti"),
        Ingredient(id: "DAUN_BAWANG", name: "Daun Bawang", attribute: "daun-bawang"),
        Ingredient(id: "WORTEL", name: "Wortel", attribute: "wortel"),
    ]
}

