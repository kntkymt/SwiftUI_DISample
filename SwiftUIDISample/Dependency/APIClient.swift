protocol APIClientProtocol {
    func fetchData() -> String
}

final class APIClient: APIClientProtocol {
    func fetchData() -> String {
        return "default"
    }
}

final class StubAPIClient: APIClientProtocol {
    let data: String

    init(data: String) {
        self.data = data
    }

    func fetchData() -> String {
        return data
    }
}
