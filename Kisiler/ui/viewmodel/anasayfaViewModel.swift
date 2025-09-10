//
//  anasayfaViewModel.swift
//  Kisiler
//
//  Created by Yasin Elüstü on 13.09.2025.
//

import Foundation
import Firebase

class anasayfaViewModel : ObservableObject{
    @Published var kisiListesi = [Kisiler]()
    
    var refKisiler = Database.database().reference().child( "kisiler" )
    
    func kisilerYukle(){
        
        refKisiler.observe( .value ) { snapshot in
            var liste = [Kisiler]()
            
            //Tüm Veri Almma
            if let gelenVeri = snapshot.value as? [String : AnyObject]{
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary{
                        let kisi_id = satir.key
                        let kisi_ad = d["kisi_ad"] as! String
                        let kisi_tel = d["kisi_tel"] as! String
                        
                        let yeniKisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(yeniKisi)
                    }
                }
            }
            //Daha performan veri aktarma
            DispatchQueue.main.async {
                self.kisiListesi = liste
            }
            
        }
    }
    
    func ara (arananKelimesi: String){
        refKisiler.observe( .value ) { snapshot in
            var liste = [Kisiler]()
            
            //Tüm Veri Almma
            if let gelenVeri = snapshot.value as? [String : AnyObject]{
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary{
                        let kisi_id = satir.key
                        let kisi_ad = d["kisi_ad"] as! String
                        let kisi_tel = d["kisi_tel"] as! String
                        
                        //gelen harf varsa listeye ekliyor
                        if kisi_ad.lowercased( ).contains( arananKelimesi.lowercased( ) ){
                            let yeniKisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                            liste.append(yeniKisi)
                        }
                    }
                }
                //Daha performan veri aktarma
                DispatchQueue.main.async {
                    self.kisiListesi = liste
                }
                
            }
        }
        
    
    }
    
    func sil (kisi_id : String){
        refKisiler.child(kisi_id).removeValue()
    }
}
