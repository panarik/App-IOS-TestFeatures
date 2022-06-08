import Foundation
import SwiftUI

struct Landmark: Identifiable {
    
    var id: Int
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
    
}
