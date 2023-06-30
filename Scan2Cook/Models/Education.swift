//
//  Education.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct Education: Equatable, Hashable {
    let id: Int
    let filename: String
    let title: String
    let content: String
}

extension Education {
    static let all = [
        Education(id: 1, filename: "filename", title: "Persiapkan bahan-bahanmu diatas meja", content: "Pastikan ruangan terang dengan memanfaatkan pencahayaan yang baik agar bahan-bahan terlihat dengan jelas. Usahakan untuk menghilangkan bayangan yang berlebihan agar objek tidak terlalu terhalang."),
        Education(id: 2, filename: "filename", title: "Mengambil Gambar Objek yang Akan Diolah Menjadi Menu", content: "Pastikan semua objek berada di dalam kamera dan terlihat dengan jelas. Perhatikan fokus kamera dan pastikan objek tidak buram atau kabur."),
        Education(id: 3, filename: "filename", title: "Memastikan gambar jelas dan bahan makanan siap diubah menjadi menu", content: "Jika gambar terlihat kurang jelas atau bahan makanan tidak terlihat menarik, pertimbangkan untuk mengambil gambar ulang atau memperbaiki pencahayaan sebelum melanjutkan ke langkah berikutnya."),
    ]
}
