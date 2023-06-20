//
//  PersonalizationType.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

enum PersonalizationType {
    case manis
    case asin
    case pedas
    case nasi
    case roti
    case indomie
    case laktosa
    case seafood
    case kacang
}

func getPersonalizationType(personalization: PersonalizationType) -> String {
    switch personalization {
    case .manis:
        return "manis"
    case .asin:
        return "asin"
    case .pedas:
        return "pedas"
    case .nasi:
        return "nasi"
    case .roti:
        return "roti"
    case .indomie:
        return "indomie"
    case .laktosa:
        return "laktosa"
    case .seafood:
        return "seafood"
    case .kacang:
        return "kacang"
        //    default:
        //        return nil
    }
}
