import Foundation
import SwiftUI

struct Landmark {
    
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    
    
}
