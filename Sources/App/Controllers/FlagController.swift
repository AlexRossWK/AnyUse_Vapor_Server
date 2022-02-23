//
//  FlagController.swift
//  
//
//  Created by Алексей on 18..022022.
//

import Fluent
import Vapor

struct FlagController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let flags = routes.grouped("flags")
        flags.get(use: get)
        flags.post(use: create)
        flags.put(use: update)
        flags.group(":flagID") { flag in
            flag.delete(use: delete)
        }

    }
    
    // GET request /flags
    private func get(req: Request) throws -> EventLoopFuture<[Flag]> {
        return Flag.query(on: req.db).all()
    }
    // POST request /flags
    private func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let flags = try req.content.decode(Flag.self)
        return flags.save(on: req.db).transform(to: .ok)
    }
    
    // PUT request /flags
    private func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let flag = try req.content.decode(Flag.self)
        return Flag.find(flag.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.name = flag.name
                $0.description = flag.description
                $0.value = flag.value
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    // DELETE request /flags/id
    private func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Flag.find(req.parameters.get("flagID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db)}
            .transform(to: .ok)
    }
}
