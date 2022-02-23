import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("flags") { req -> String in
        return "There is your flags"
    }

    try app.register(collection: FlagController())
}
