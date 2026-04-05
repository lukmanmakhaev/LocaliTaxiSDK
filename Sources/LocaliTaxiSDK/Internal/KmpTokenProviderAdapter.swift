import Foundation
import TaxiShared

final class KmpTokenProviderAdapter: NSObject, TokenProvider {
    private let provider: TaxiAccessTokenProvider

    init(provider: TaxiAccessTokenProvider) {
        self.provider = provider
        super.init()
    }

    func getAccessToken() -> String {
        provider.getAccessToken()
    }
}
