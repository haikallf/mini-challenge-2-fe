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
        return "1"
    case .seafood:
        return "2"
    case .kacang:
        return "3"
    case .babi:
        return "4"
        //    default:
        //        return nil
    }
}
