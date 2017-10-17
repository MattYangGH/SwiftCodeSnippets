

/// Delay for given milliseconds, and then execute given code.
///
/// - Parameters:
///   - seconds: Time to delay.
///   - completion: Code to execute after the delay.
func delay(_ seconds: Double, completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(Int(seconds * 1000.0))) {
        completion()
    }
}
