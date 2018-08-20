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
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _defense: String!
    private var _attack: String!
    private var _evolution: String!
    private var _pokeURL: String!
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    
    var evolution: String {
        if _evolution == nil {
            _evolution = ""
        }
        return _evolution
        
    }
    
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._pokedexId = pokedexId
        self._name = name
        self._pokeURL = "\(BASE_URL)\(URL_POKEMON)\(self._pokedexId)"
        
        
    }
    
    func downloadPokemonDetail(completed: downloadComplete){
        
        print(self._pokeURL)
        Alamofire.request(.GET,self._pokeURL).responseJSON { (response) in
            let apireturn = response.2.value
            //print(apireturn)
            
            if let dict = apireturn as? Dictionary<String,AnyObject>{
                
                                
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                    print(self._weight)
                }
                
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                    print(self._height)
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                    print(self._defense)
                }
                
                if let attack = dict["base_experience"] as? Int {
                    self._attack = "\(attack)"
                    print(self._attack)
                }
                
                if let types = dict["types"] as? [Dictionary<String,AnyObject>]{
                    
                    var typesArray: String!
                    typesArray = ""
                    for i in 0..<types.count {
                        
                        if let typeArr = types[i]["type"] as? Dictionary<String,AnyObject>{
                        
                            if let type = typeArr["name"] as? String{
                                typesArray =  "\(type.capitalizedString)/\(typesArray)"
                            }
                        }
                    }
                    self._type = typesArray.substringToIndex(typesArray.endIndex.predecessor())
                    print(self._type)
                    
                    
                }
            }
            
            completed()
        }
    }
    
}