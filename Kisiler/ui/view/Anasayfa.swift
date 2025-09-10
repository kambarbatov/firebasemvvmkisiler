//
//  Anasayfa.swift
//  Kisiler
//
//  Created by Yasin Elüstü on 10.09.2025.
//

import SwiftUI

struct Anasayfa: View {
    
    
    @ObservedObject var viewModel = anasayfaViewModel( )
    
    @State private var aramaKelimesi = ""
    
    func sil (at offsets: IndexSet){
        let kisi = viewModel.kisiListesi[offsets.first!]
        //silme Animasyonu firebas egerekmez viewModel.kisiListesi.remove(at: offsets.first!)
        viewModel.sil(kisi_id: kisi.kisi_id!)
    }
    
    var body: some View {
        NavigationStack {
            List {
               
                ForEach(viewModel.kisiListesi){ kisi in
                    NavigationLink(destination : KisiDetaySayfasi(kisi : kisi)){
                        KisilerSatir(kisi: kisi)
                    }
                }.onDelete(perform: sil)
                
            }
            .navigationBarTitle("Anasayfa Kişiler Tablosu")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: KisiKayitSayfasi()){
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear(){
                
                viewModel.kisilerYukle( )
                print("anasayfa kisiler dödü")
            }
            .searchable(text: $aramaKelimesi, prompt: "ara...")
            .onChange(of: aramaKelimesi){x, s in
                // bu kışla yapma sebebimiz searchle yazdığınız yazılar boşsa boş bir liste dönmemesi için
                if s == ""{
                    viewModel.kisilerYukle( )
                }else{
                    viewModel.ara(arananKelimesi: s)
                }
                
            }
        }
    }
}

#Preview {
    Anasayfa()
}
