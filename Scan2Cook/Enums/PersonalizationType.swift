//
//  PersonalizationType.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

enum PersonalizationType {
    case laktosa
    case seafood
    case kacang
    case babi
}

func getPersonalizationType(personalization: PersonalizationType) -> String {
    switch personalization {
    case .laktosa:
        return "laktosa"
    case .seafood:
        return "seafood"
    case .kacang:
        return "kacang"
    case .babi:
        return "babi"
        //    default:
        //        return nil
    }
}
