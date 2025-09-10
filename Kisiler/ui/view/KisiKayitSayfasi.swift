//
//  KisiKayitSayfasi.swift
//  Kisiler
//
//  Created by Yasin Elüstü on 10.09.2025.
//

import SwiftUI

struct KisiKayitSayfasi: View {
    @State private var tfKisiAdi: String = ""
    @State private var tfKisiTel: String = ""
    
    @Environment(\.dismiss) var dismiss
     
    var viewModel = KisiKayitViewModel()
    
    var body: some View {
        VStack(spacing: 100){
            TextField("Kisi Ad " , text: $tfKisiAdi)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
            TextField("Kisi Tel", text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
            
            Button("Kaydet "){
                viewModel.Kaydet(kisi_ad: tfKisiAdi, kisi_tel: tfKisiTel) { s in
                    if s {
                        dismiss()
                    }else{
                        print("hata")
                    }
                    
                }
            }
            
        }.navigationTitle(Text("Yeni Kisi Kayıt"))
    }
}

#Preview {
    KisiKayitSayfasi()
}
