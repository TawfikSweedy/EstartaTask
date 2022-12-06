//
//  LottieView.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/6/22.
//

import SwiftUI
import Lottie

struct LottieLoader: View {
    @Binding var isPresented:Bool?
     var body: some View {
         if isPresented ?? false{
            ZStack {
                ZStack{
                    LottieView(lottieFile: "loader")
                        .scaleEffect(0.7)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
                .background(Color.black.opacity(0.1))
            }
         }
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieLoader(isPresented: .constant(true))
    }
}


 
struct LottieView: UIViewRepresentable {
    let lottieFile: String
 
    let animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        animationView.loopMode = .loop
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}
