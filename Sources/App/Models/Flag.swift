//
//  Flag.swift
//  
//
//  Created by Алексей on 18..022022.
//

import Fluent
import Vapor

final class Flag: Model, Content {
    
    static let schema = Create_19022022.schema
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: Create_19022022.name)
    var name: String
    
    @Field(key: AddDescriptionAndValue_21022022.description)
    var description: String
    
    @Field(key: AddDescriptionAndValue_21022022.value)
    var value: Bool
    
    init() {}
    
    init(id: UUID? = nil, name: String, description: String, value: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.value = value
    }
}
