//
//  File.swift
//  
//
//  Created by Rodrigo Matos Aguiar on 26/10/20.
//

import Vapor
import Fluent

struct CountryController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let countries = routes.grouped("countries")
        countries.get(use: list)
    }
    
    func list(_ req: Request) throws -> EventLoopFuture<[Country]> {
        return Country.query(on: req.db).all()
    }
}
