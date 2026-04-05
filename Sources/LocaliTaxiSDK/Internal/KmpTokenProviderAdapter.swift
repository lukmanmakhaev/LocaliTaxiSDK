import Foundation
import TaxiShared

final class KmpTokenProviderAdapter: TokenProvider, Sendable {
    private let provider: TaxiAccessTokenProvider

    init(provider: TaxiAccessTokenProvider) {
        self.provider = provider
    }

    func getAccessToken() -> String {
        provider.getAccessToken()
    }
}
