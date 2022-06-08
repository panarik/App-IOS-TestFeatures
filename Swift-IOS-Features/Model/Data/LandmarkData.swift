import Foundation

var landmarks:[Landmark] = load()

func load() -> [Landmark] {
    var landmarks = [Landmark]()
    landmarks.append(Landmark(id: 1, name: "Shopping", imageName: "mobile_shop_shoping"))
    landmarks.append(Landmark(id: 2, name: "List Example", imageName: "list_view_list"))
    landmarks.append(Landmark(id: 3, name: "UI bugs", imageName: "bug_ui_example_logo"))
    return landmarks
}
