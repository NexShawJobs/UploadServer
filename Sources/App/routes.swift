import Vapor

struct VideoCourse: Content {
    let name: String
    let language: String
    let version: Double
}
struct Echo: Content {
    let clientText: String
    let timeStamp: String
}

struct EchoResponse: Content {
    let clientTextRequested: String
    let timeStapSent: String
}
func routes(_ app: Application) throws {
//    app.get { req in
//        return req.view.render("index", ["title": "Hello Vapor!"])
//    }
//
//    app.get("hello") { req -> String in
//        return "Hello, world!"
//    }
    
    app.post("upload") { req -> HTTPResponseStatus in
        let course = try req.content.decode(VideoCourse.self)
        print("course name \(course.name)")
        print("course launguage \(course.language)")
        print("course version \(course.version)")
        return .ok
        
    }
    
    app.post("echo") { req -> EchoResponse in
        let echo = try req.content.decode(Echo.self)
        print("You typed \(echo.clientText)")
        print("at time \(echo.timeStamp)")
        return EchoResponse(clientTextRequested: "You said \(echo.clientText)", timeStapSent: "at \(echo.timeStamp)")
    }
}
