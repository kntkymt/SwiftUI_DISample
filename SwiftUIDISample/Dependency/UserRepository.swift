import Foundation
import Dependencies

protocol UserRepositoryProtocol: ObservableObject {
    func fetchData() -> String
}

final class UserRepository: UserRepositoryProtocol {
    @Dependency(\.apiClient) var apiClient

    init() {
    }

    func fetchData() -> String {
        return apiClient.fetchData()
    }
}

final class StubUserRepository: UserRepositoryProtocol {

    let data: String

    init(data: String) {
        self.data = data
    }
    func fetchData() -> String {
        return data
    }
}
