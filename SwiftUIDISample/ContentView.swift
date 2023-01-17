import SwiftUI
import Dependencies

struct ContentView: View {
    @Dependency(\.userRepsoitory) var userRepository

    var body: some View {
        VStack {
            Text(userRepository.fetchData())
        }
    }
}
