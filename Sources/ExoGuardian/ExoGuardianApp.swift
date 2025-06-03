import SwiftUI

@main
struct ExoGuardianApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        MenuBarExtra("ExoGuardian", systemImage: "shield.lefthalf.filled") {
            MenuBarView()
                .environmentObject(appState)
        }
        .menuBarExtraStyle(.window)
    }
}

class AppState: ObservableObject {
    @Published var isMonitoring = false
    @Published var addresses: [WalletAddress] = []
    @Published var alerts: [Alert] = []
    @Published var gasInfo: GasInfo?
    
    func startMonitoring() {
        isMonitoring = true
        // TODO: Implement monitoring logic
    }
    
    func stopMonitoring() {
        isMonitoring = false
    }
} 