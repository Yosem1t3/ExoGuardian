import Foundation

struct WalletAddress: Identifiable, Codable {
    let id = UUID()
    let address: String
    let chain: Chain
    let label: String?
    
    enum Chain: String, Codable {
        case bitcoin
        case ethereum
        case binanceSmartChain
        case polygon
        case avalanche
    }
}

struct Alert: Identifiable {
    let id = UUID()
    let timestamp: Date
    let type: AlertType
    let message: String
    let address: WalletAddress
    var isRead = false
    
    enum AlertType {
        case dust
        case largeTransaction
        case delisting
        case highFees
    }
}

struct GasInfo {
    let chain: WalletAddress.Chain
    let slow: Double
    let standard: Double
    let fast: Double
    let timestamp: Date
}

struct DustToken: Identifiable {
    let id = UUID()
    let address: String
    let name: String
    let symbol: String
    let chain: WalletAddress.Chain
    let timestamp: Date
} 