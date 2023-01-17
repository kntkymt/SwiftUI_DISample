import SwiftUI
import Dependencies

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // default values
            VStack {
                Text("default values")
                SubView()
            }

            // DI userRepository (succeed)
            VStack {
                Text("DI userRepository")

                withDependencies {
                    $0.userRepsoitory = StubUserRepository(data: "ovveride d")
                } operation: {
                    SubView()
                        .environment(\.userRepsoitory, StubUserRepository(data: "override e"))
                }
            }

            // DI apiClient to userRepository in SubView (failed)
            VStack {
                Text("DI apiClient to userRepository in SubView")
                withDependencies {
                    $0.apiClient = StubAPIClient(data: "ovveride d")
                } operation: {
                    SubView()
                        .environment(\.apiClient, StubAPIClient(data: "override e"))
                }
            }

            // DI apiClient when DI userRepository (succeed dependencies)
            VStack {
                Text("DI apiClient when DI userRepository")
                withDependencies {
                    $0.userRepsoitory = withDependencies {
                        $0.apiClient =  StubAPIClient(data: "ovveride d")
                    } operation: {
                        UserRepository()
                    }
                } operation: {
                    SubView()
                        .environment(\.apiClient, StubAPIClient(data: "override e"))
                }
            }

            // propagate to ViewModel (succeed dependencies, failed environment)
            VStack {
                Text("propagate to ViewModel")
                withDependencies {
                    $0.userRepsoitory = StubUserRepository(data: "override d")
                } operation: {
                    SubViewWithViewModel()
                        .environment(\.userRepsoitory, StubUserRepository(data: "override e"))
                }
            }
        }
    }
}

struct SubView: View {
    @Dependency(\.userRepsoitory) var userRepository

    @Environment(\.userRepsoitory) var userRepository2

    var body: some View {
        HStack {
            Text(userRepository.fetchData())

            Text(userRepository2.fetchData())
        }
    }
}


struct SubViewWithViewModel: View {

    let viewModel = ViewModel()

    var body: some View {
        HStack {
            Text(viewModel.fetchDependencyData())

            Text(ViewModel().fetchEnvironmentData())
        }
    }
}

final class ViewModel {
    @Dependency(\.userRepsoitory) var userRepository

    @Environment(\.userRepsoitory) var userRepository2

    func fetchDependencyData() -> String {
        userRepository.fetchData()
    }

    func fetchEnvironmentData() -> String {
        userRepository2.fetchData()
    }
}
