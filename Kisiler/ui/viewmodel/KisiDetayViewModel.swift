//
//  KisiDetayViewModel.swift
//  Kisiler
//
//  Created by Yasin Elüstü on 13.09.2025.
//

import Foundation
import Firebase


class KisiDetayViewModel {
    
    var refKisiler = Database.database().reference().child( "kisiler" )
    
    func gunceleme(kisi_id: String,kisi_ad : String, kisi_tel: String){
        let guncelene = ["kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
        refKisiler.child(kisi_id).updateChildValues(guncelene)
    }
    
}
