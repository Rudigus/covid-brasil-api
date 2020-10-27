//
//  File.swift
//  
//
//  Created by Rodrigo Matos Aguiar on 26/10/20.
//

import Vapor
import Fluent

final class Country: Model, Content {
    
    static let schema = "countries"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
}
