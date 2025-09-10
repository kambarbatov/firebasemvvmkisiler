//
//  kisiKayitViewModel.swift
//  Kisiler
//
//  Created by Yasin Elüstü on 13.09.2025.
//

import Foundation
import Firebase

class KisiKayitViewModel {
    
    
    var refKisiler = Database.database().reference().child( "kisiler" )
    
    func Kaydet(kisi_ad : String, kisi_tel: String, completion: @escaping (Bool) -> Void){
        let yeniKisi = ["kisi_id" : "", "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        refKisiler.childByAutoId( ).setValue( yeniKisi){error , _ in
            if let _ = error{
                completion(false)
            }else{
                completion(true)
            }
        }
    }
    
}
