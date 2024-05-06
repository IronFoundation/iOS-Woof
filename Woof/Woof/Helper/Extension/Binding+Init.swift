import SwiftUI

extension Binding where Value == Bool {
    /// Initializes a new binding boolean with another optional binding.
    /// Presence of a value in the initializing binding is considered as `true`
    /// and absence of a value - as `false`.
    init(value: Binding<(some Any)?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if newValue {
                value.wrappedValue = nil
            }
        }
    }
}
