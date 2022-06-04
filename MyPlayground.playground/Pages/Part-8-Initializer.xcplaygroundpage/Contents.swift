import Foundation

class Person {
    var name = "" // preinitialized
    
    init(name:String) {
        self.name = name
    }
}

class BlogPost {
    var title:String? // may nil. Have to be checked.
    var body = ""
    var author:Person! // may nil. Ignore. Will use without checking.
    var comments = 0
    var views:Int // may nil. Have to be initialized.
    
    init () {
        // Default initializer
        self.views = 0
    }
    
    init(title:String, body:String, author:Person) {
        //Custom initializer
        self.title = title
        self.body = body
        self.author = author
        self.views = 0
    }
}

let postNil = BlogPost()
let postOne = BlogPost(title: "My Title", body: "some body", author: Person(name:"Pit"))

// Use devined field. (preinitialized with String)
print(postOne.comments)

// Use field was undefined. (nil or string)
print(postNil.title)
print(postOne.title)

// Optional Binding.
if let actualTitle = postOne.title {
    print(actualTitle + " - exist.")
}

// Testing for nil.
if postOne.title != nil {
    print("my title is not a nil.")
}

// Testing for nil.
if postNil.title != nil {
    // Will not run because 'postNil.title' contains nil
    print("this is a nil.")
}
 
// Force unwrapping
print(postOne.title! + " is exactly String! I'm sure.")
