//
//  Responses.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 30/06/23.
//

import SwiftUI

struct RecipeResponse: Equatable, Identifiable, Decodable {
    let id: Int
    let nama_resep: String
    let saran_penyajian: Int
    let langkah_masak: [String]
    let estimasi: Int
    let jml_alat: Int
    let image: String
    let image_steps: [String]
    let bahans: [IngredientResponse]
    let resep_alatmasaks: [CookingWareResponse]
    let resep_personalisasis: [PersonalizationResponse]
}

struct IngredientResponse: Equatable, Identifiable, Decodable {
    let id: Int
    let jumlah: Int?
    let satuan: String
    let tipe_bahan: Int
    let tagbahan: IngredientTagResponse
}

extension IngredientResponse {
    static let emptyState = [
        IngredientResponse(id: 1, jumlah: 1, satuan: "bungkus", tipe_bahan: 1, tagbahan: IngredientTagResponse.emptyState),
    ]
}

struct IngredientTagResponse: Equatable, Identifiable, Decodable {
    let id: Int
    let nama_tag: String
}

extension IngredientTagResponse {
    static let emptyState = IngredientTagResponse(id: 1, nama_tag: "Babi")
}

struct CookingWareResponse: Equatable, Decodable {
    let alatmasak_id: Int
    let alatmasak: CookingWareItemResponse
}

struct CookingWareItemResponse: Equatable, Decodable {
    let alat_masak: String
}

struct PersonalizationResponse: Equatable, Decodable {
    let personalisasi_id: Int
    let personalisasi: PersonalizationItemResponse
}

extension PersonalizationResponse: Identifiable {
  var id: Int { personalisasi_id }
}

struct PersonalizationItemResponse: Equatable, Decodable {
    let nama_personalisasi: String
}
