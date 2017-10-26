//
//  MarioKartInteractor.swift
//  WTF MVP
//
//  Created by Alberto Jauregui on 01/03/17.
//  Copyright © 2017 Alberto Jauregui. All rights reserved.
//

import Foundation

class MarioKartInteractor {
    fileprivate let marioKartCharacters: [MarioKartCharacter]
    
    init() {
        self.marioKartCharacters = [
            MarioKartCharacter(name: "Mario", mail: "mario@mariokart.com"),
            MarioKartCharacter(name: "Luigi", mail: "luigi@mariokart.com"),
            MarioKartCharacter(name: "Yoshi", mail: "yoshi@mariokart.com"),
        ]
    }
    
    func getMarioKartCharacters(_ callback:@escaping ([MarioKartCharacter]) -> Void){
        delay(1.0) {
            callback(self.marioKartCharacters)
        }
    }
    
    fileprivate func delay(_ delay: Double, closure: @escaping ()->()){
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }
}
