import Combine
import Foundation
import SwiftUI

@available(iOS 15.0, *)
func someFunc() {
    print(#function)
}

someFunc()

let a = Text("")
    .gesture(TapGesture().simultaneously(with: TapGesture()).onEnded { _ in print("Hello, world!") })
