//
//  Animal.swift
//  Test
//
//  Created by Rudd Taylor on 1/12/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import Foundation

class Animal: NSObject {
    var species: String?
    var name: String?
    
    func stringRepresentation() -> String {
        if let realName = name {
            if let realSpecies = species {
                return "Species: \(realSpecies), name: \(realName)"
            }
        }
        return "Invalid animal!"
    }
}