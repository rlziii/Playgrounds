import Combine
import SwiftUI

struct ContentView: View {
    @State var showExampleView = false

    var body: some View {
        Button("Show example") {
            showExampleView = true
        }.sheet(isPresented: $showExampleView) {
            ExampleView(viewModel: ExampleViewModel())
        }
    }
}

struct ExampleView: View {
    @ObservedObject var viewModel: ExampleViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Portrait from publisher: \(viewModel.isPortraitFromPublisher ? "yes" : "no")")
                Text("Portrait from sequence: \(viewModel.isPortraitFromSequence ? "yes" : "no")")
            }

            Button("Dismiss") {
                dismiss()
            }
        }.onAppear {
            viewModel.setup()
        }
    }
}

final class CancellableTask<Success: Sendable, Failure: Error>: Sendable, Cancellable {
    let task: Task<Success, Failure>

    init(_ task: Task<Success, Failure>) {
        self.task = task
    }

    deinit {
        cancel()
    }

    func cancel() {
        task.cancel()
    }
}

extension CancellableTask {
    private func asAnyCancellable() -> AnyCancellable {
        .init { self.cancel() }
    }

    func store(in cancellables: inout Set<AnyCancellable>) {
        asAnyCancellable().store(in: &cancellables)
    }
}

extension Task {
    func asCancellableTask() -> CancellableTask<Success, Failure> {
        CancellableTask(self)
    }

    func store(in cancellables: inout Set<AnyCancellable>) {
        asCancellableTask().store(in: &cancellables)
    }
}

@MainActor
class ExampleViewModel: ObservableObject {
    @Published var isPortraitFromPublisher = false
    @Published var isPortraitFromSequence = false

    private var cancellables = Set<AnyCancellable>()

    private var task: CancellableTask<Void, Never>?

    deinit {
        print("deinit!")
    }

    func setup() {
        notificationCenterPublisher()
            .map { $0 == .portrait }
            .assign(to: &$isPortraitFromPublisher)

        task = Task { [weak self] in
            guard let sequence = await self?.notificationCenterSequence() else {
                return
            }
            for await orientation in sequence {
                print("sequence received value")
                self?.isPortraitFromSequence = orientation == .portrait
            }
        }.asCancellableTask()
    }

    func notificationCenterPublisher() -> AnyPublisher<UIDeviceOrientation, Never> {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .map { _ in UIDevice.current.orientation }
            .eraseToAnyPublisher()
    }

    func notificationCenterSequence() async -> AsyncMapSequence<NotificationCenter.Notifications, UIDeviceOrientation> {
        NotificationCenter.default.notifications(named: UIDevice.orientationDidChangeNotification)
            .map { _ in UIDevice.current.orientation }
    }
}
