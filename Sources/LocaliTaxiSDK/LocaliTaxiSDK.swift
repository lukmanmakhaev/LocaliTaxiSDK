import TaxiShared

public enum LocaliTaxiSDK {
    nonisolated(unsafe) private static var tokenProviderAdapter: KmpTokenProviderAdapter?

    public static func initialize(accessTokenProvider: TaxiAccessTokenProvider) {
        let adapter = KmpTokenProviderAdapter(provider: accessTokenProvider)
        tokenProviderAdapter = adapter
        let sdk = TaxiSdk.companion.doInit(tokenProvider: adapter)
        print("✅ SDK initialized: \(sdk)")
        print("✅ Instance check: \(TaxiSdk.companion.instance)")
    }
}
