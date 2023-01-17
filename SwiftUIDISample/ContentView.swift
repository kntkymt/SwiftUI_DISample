import SwiftUI
import Dependencies

struct ContentView: View {
    var body: some View {
        VStack {
            SubView()

            withDependencies {
                $0.userRepsoitory = StubUserRepository(data: "override dependencies")
            } operation: {
                SubView()
                    .environment(\.userRepsoitory, StubUserRepository(data: "override environment"))
            }
        }
    }
}


struct SubView: View {
    @Dependency(\.userRepsoitory) var userRepository

    @Environment(\.userRepsoitory) var userRepository2

    var body: some View {
        VStack {
            HStack {
                Text(userRepository.fetchData())

                Text(userRepository2.fetchData())
            }
        }
    }
}
