import XCTest

class PlayerView_UITests: BaseScenarios {


    func test_volumeSlider_shouldChangeVolume() throws {
        
        // Given
        main.openScreenByName("Music player")
        player.onPage()
        
        
        // When
        player.setVolume(50)
        
        // Then
        
    }

}
