import SwiftUI

struct MenuBarView: View {
    @EnvironmentObject private var appState: AppState
    @State private var showingAddAddress = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: appState.isMonitoring ? "shield.lefthalf.filled" : "shield.slash")
                    .foregroundColor(appState.isMonitoring ? .green : .red)
                Text(appState.isMonitoring ? "Guardian Active" : "Guardian Inactive")
                    .font(.headline)
                Spacer()
                Toggle("", isOn: $appState.isMonitoring)
            }
            .padding(.horizontal)
            
            Divider()
            
            // Addresses Section
            VStack(alignment: .leading) {
                Text("Monitored Addresses")
                    .font(.headline)
                    .padding(.horizontal)
                
                if appState.addresses.isEmpty {
                    Text("No addresses added")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                } else {
                    ForEach(appState.addresses) { address in
                        AddressRow(address: address)
                    }
                }
                
                Button(action: { showingAddAddress = true }) {
                    Label("Add Address", systemImage: "plus")
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            // Alerts Section
            VStack(alignment: .leading) {
                Text("Recent Alerts")
                    .font(.headline)
                    .padding(.horizontal)
                
                if appState.alerts.isEmpty {
                    Text("No alerts")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                } else {
                    ForEach(appState.alerts.prefix(5)) { alert in
                        AlertRow(alert: alert)
                    }
                }
            }
            
            Divider()
            
            // Gas Info Section
            if let gasInfo = appState.gasInfo {
                GasInfoView(gasInfo: gasInfo)
            }
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .padding()
        }
        .frame(width: 300)
        .padding(.vertical)
    }
}

struct AddressRow: View {
    let address: WalletAddress
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(address.label ?? "Unnamed")
                    .font(.subheadline)
                Text(address.address.prefix(8) + "..." + address.address.suffix(6))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(address.chain.rawValue.capitalized)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

struct AlertRow: View {
    let alert: Alert
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            VStack(alignment: .leading) {
                Text(alert.message)
                    .font(.caption)
                Text(alert.timestamp, style: .relative)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
    
    private var iconName: String {
        switch alert.type {
        case .dust: return "sparkles"
        case .largeTransaction: return "exclamationmark.triangle"
        case .delisting: return "xmark.circle"
        case .highFees: return "dollarsign.circle"
        }
    }
    
    private var iconColor: Color {
        switch alert.type {
        case .dust: return .yellow
        case .largeTransaction: return .red
        case .delisting: return .orange
        case .highFees: return .blue
        }
    }
}

struct GasInfoView: View {
    let gasInfo: GasInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gas Prices (\(gasInfo.chain.rawValue))")
                .font(.headline)
            HStack {
                GasLevel(label: "Slow", value: gasInfo.slow)
                GasLevel(label: "Standard", value: gasInfo.standard)
                GasLevel(label: "Fast", value: gasInfo.fast)
            }
        }
        .padding(.horizontal)
    }
}

struct GasLevel: View {
    let label: String
    let value: Double
    
    var body: some View {
        VStack {
            Text(label)
                .font(.caption)
            Text(String(format: "%.0f", value))
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
    }
} 