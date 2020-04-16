//
//  DogRepo.swift
//  TableTest03
//
//  Created by Hynek Broulik on 2020-04-16.
//  Copyright © 2020 Hynek Broulik. All rights reserved.
//

import Foundation


final public class DogRepo {
    
    private init() {}
    public static let shared = DogRepo()
    
    //MARK:- Variables
    
     var allDogs: [Dog] = []
     
     
     func generateDogs()  {
        allDogs = [Dog(name:"Mungo",number:"10908"),
               Dog(name:"Sheba",number:"20234"),
               Dog(name:"Mema",number:"17543")]
        sortAllDogs()
    }
    
    func sortAllDogs() {
        allDogs.sort {$0.name < $1.name}
    }
    
}
