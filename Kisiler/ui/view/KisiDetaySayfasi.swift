//
//  KisiDetaySayfasi.swift
//  Kisiler
//
//  Created by Yasin Elüstü on 10.09.2025.
//

import SwiftUI

struct KisiDetaySayfasi: View {
    @State private var tfKisiAdi: String = ""
    @State private var tfKisiTel: String = ""

    var kisi = Kisiler()
    
    var viewModel = KisiDetayViewModel()
    
    var body: some View {
        VStack(spacing: 100){
            TextField("Kisi Ad " , text: $tfKisiAdi)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
            TextField("Kisi Tel", text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
            Button("Güncelme"){
                viewModel.gunceleme(kisi_id: kisi.kisi_id!, kisi_ad: tfKisiAdi, kisi_tel: tfKisiTel)
            }
            
        }.navigationTitle(Text("Kisi Günceleme"))
            .onAppear()
        {
            tfKisiAdi = kisi.kisi_ad!
            tfKisiTel = kisi.kisi_tel!
        }
    }
    }


#Preview {
    KisiDetaySayfasi()
}
