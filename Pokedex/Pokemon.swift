//
//  Pokemon.swift
//  Pokedex
//
//  Created by Eliza Vel Rosario on 13/08/2018.
//  Copyright © 2018 Eliza Velcom.eliza. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String{
        return _name
    }
    var pokedexId: Int{
        return _pokedexId
    }
    init(name: String, pokedexId: Int){
        self._pokedexId = pokedexId
        self._name = name
    }
    
    
}