import SwiftUI

struct AddAddressView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appState: AppState
    
    @State private var address = ""
    @State private var label = ""
    @State private var selectedChain = WalletAddress.Chain.ethereum
    @State private var errorMessage: String?
    
    private let chains = WalletAddress.Chain.allCases
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Add New Address")
                .font(.headline)
            
            TextField("Address Label (optional)", text: $label)
                .textFieldStyle(.roundedBorder)
            
            TextField("Wallet Address", text: $address)
                .textFieldStyle(.roundedBorder)
            
            Picker("Blockchain", selection: $selectedChain) {
                ForEach(chains, id: \.self) { chain in
                    Text(chain.rawValue.capitalized)
                        .tag(chain)
                }
            }
            
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                
                Button("Add") {
                    addAddress()
                }
                .disabled(address.isEmpty)
            }
        }
        .padding()
        .frame(width: 300)
    }
    
    private func addAddress() {
        // Basic validation
        guard !address.isEmpty else {
            errorMessage = "Address cannot be empty"
            return
        }
        
        // Create new wallet address
        let newAddress = WalletAddress(
            address: address,
            chain: selectedChain,
            label: label.isEmpty ? nil : label
        )
        
        // Add to app state
        appState.addresses.append(newAddress)
        
        dismiss()
    }
}

// Make Chain conform to CaseIterable for the picker
extension WalletAddress.Chain: CaseIterable {} 