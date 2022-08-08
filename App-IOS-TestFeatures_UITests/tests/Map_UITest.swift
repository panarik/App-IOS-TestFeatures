import XCTest

class Map_UITest: BaseScenarios {
    
    func test_title_shouldBeColosseumRomeAtBeginning() {
        // Given
        openMap()
        
        // Then
        map.checkTitle("Colosseum, Rome")
    }
    
    func test_map_shouldHaveBackgroundElements() {
        // Given
        openMap()
        
        // Then
        map.checkMapBackgroundElements([
            "Castro Pretorio",
            "Esquilino",
            "Campo Marzio"])
    }
    
    func test_map_shouldHaveRomePins() {
        // Given
        openMap()
        
        // Then
        map.checkMapPins([
            "Colosseum",
            "Pantheon",
            "Trevi Fountain"])
    }
    
    func test_map_shouldHaveEiffelTowerPin() {
        // Given
        openMap()
        
        // When
        map.chooseLocation("Eiffel Tower, Paris")
        
        // Then
        map.checkMapPins(["Eiffel Tower"])
    }
    
    private func openMap() {
        main.openScreenByName("Map")
        map.onPage()
    }
    
}
