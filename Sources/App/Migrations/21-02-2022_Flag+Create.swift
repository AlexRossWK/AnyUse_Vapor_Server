//
//  21-02-2022_Flag+Create.swift
//  
//
//  Created by Алексей on 18..022022.
//

import Fluent

extension Flag {
    struct Create: Migration {
        func prepare(on database: Database) -> EventLoopFuture<Void> {
            return database.schema(Create_19022022.schema)
                .id()
                .field(Flag.Create_19022022.name, .string, .required)
                .create()
        }
        
        func revert(on database: Database) -> EventLoopFuture<Void> {
            return database.schema(Create_19022022.schema).delete()
        }
    }
}

extension Flag {
      enum Create_19022022 {
        static let schema = "flags"
        static let name: FieldKey = .name
      }
}
