import SwiftUI

@main
struct DevAcademyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
        }
    }
}
