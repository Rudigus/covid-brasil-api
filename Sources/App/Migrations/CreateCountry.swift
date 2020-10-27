//
//  File.swift
//  
//
//  Created by Rodrigo Matos Aguiar on 26/10/20.
//

import Vapor
import Fluent

struct CreateCountry: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("countries")
            .id()
            .field("name", .string)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("countries").delete()
    }
    
}
