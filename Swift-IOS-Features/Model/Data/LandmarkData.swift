import Foundation

var landmarks:[Landmark] = load()

func load() -> [Landmark] {
    var landmarks = [Landmark]()
    landmarks.append(Landmark(name: "Shopping", imageName: "mobile_shop_shoping"))
    return landmarks
}
