import Foundation
import TaxiShared

final class KmpTokenProviderAdapter: @MainActor TokenProvider, Sendable {
    private let provider: TaxiAccessTokenProvider

    init(provider: TaxiAccessTokenProvider) {
        self.provider = provider
    }

    @MainActor
    func getAccessToken() -> String {
        provider.getAccessToken()
    }
}
