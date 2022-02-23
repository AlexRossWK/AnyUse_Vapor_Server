//
//  21-02-2022_Flag+AddDescriptionAndValue.swift
//  
//
//  Created by Алексей on 21..022022.
//

import Fluent

extension Flag {
    struct AddDescriptionAndValue: Migration {
        func prepare(on database: Database) -> EventLoopFuture<Void> {
            return database.schema(Flag.schema)
                .field(Flag.AddDescriptionAndValue_21022022.description, .string, .required, .sql(.default("Default description")))
                .field(Flag.AddDescriptionAndValue_21022022.value, .bool, .required, .sql(.default(false)))
                .update()
        }
        
        func revert(on database: Database) -> EventLoopFuture<Void> {
            database
                   .schema(Flag.schema)
                   .deleteField(Flag.AddDescriptionAndValue_21022022.description)
                   .deleteField(Flag.AddDescriptionAndValue_21022022.value)
                   .update()
        }
    }
}

extension Flag {
      enum AddDescriptionAndValue_21022022 {
        static let schema = "flags"
        static let description: FieldKey = .description
        static let value: FieldKey = .value
      }
}
