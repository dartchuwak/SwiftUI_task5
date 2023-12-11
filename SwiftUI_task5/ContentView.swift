//
//  ContentView.swift
//  SwiftUI_task5
//
//  Created by Evgenii Mikhailov on 11.12.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var location = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
    let colors = [Color.white, .pink, .yellow, .black]
    let colorsBack = [Color.black, .white, .black, .white]

    var body: some View {
        ZStack {

            VStack(spacing:0) {
                ForEach(colorsBack, id: \.self) { color in
                    Rectangle()
                        .foregroundStyle(color)
                }
            }

            ZStack {

                VStack(spacing:0) {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .foregroundStyle(color)
                    }
                }

                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 100, height: 100)
                    .position(location)
                    .gesture(DragGesture()
                        .onChanged { gesture in
                            self.location = gesture.location
                        })
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
