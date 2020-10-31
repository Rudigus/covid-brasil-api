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
        countries.post(use: create)
    }
    
    func list(_ req: Request) throws -> EventLoopFuture<[Country]> {
        return Country.query(on: req.db).all()
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<Country> {
        let country = try req.content.decode(Country.self)
        return country.create(on: req.db).map { country }
    }
}
