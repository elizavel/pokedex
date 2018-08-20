//
//  Pokemon.swift
//  Pokedex
//
//  Created by Eliza Vel Rosario on 13/08/2018.
//  Copyright © 2018 Eliza Velcom.eliza. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _descriptionLbl: String!
    private var _typeLbl: String!
    private var _heightLbl: String!
    private var _weightLbl: String!
    private var _defenseLbl: String!
    private var _baseAttackLbl: String!
    private var _evolutionLbl: String!
    
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