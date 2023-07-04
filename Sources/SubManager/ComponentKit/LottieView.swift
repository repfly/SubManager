//
//  LottieView.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

// import SwiftUI
// import Lottie
// import UIkit
//
// struct LottieView: UIViewRepresentable {
//    let filename: String
//    var loopMode: LottieLoopMode = .playOnce
//
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: .zero)
//        let animationView = AnimationView()
//
//        guard let animation = Animation.named(filename) else {
//            return view
//        }
//
//        animationView.animation = animation
//        animationView.loopMode = loopMode
//        animationView.play()
//
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//
//        NSLayoutConstraint.activate([
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
//        ])
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {}
// }
