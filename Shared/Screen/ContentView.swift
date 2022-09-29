//
//  ContentView.swift
//  Shared
//
//  Created by Lucas Portella on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                //MARK: Image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1.0), value: isAnimating)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            })
                    )
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1.0)) {
                    isAnimating = true
                }
            })
            
            // MARK: Info Panel
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30),
                alignment: .top
            )
            
            // MARK: Control Interface
            .overlay(
                Group {
                    HStack {
                        ControlImageView(icon: "minus.magnifyingglass") {
                            withAnimation(.spring()) {
                                if imageScale <= 1 {
                                    resetImageState()
                                } else if imageScale > 1 {
                                    imageScale -= 1
                                }
                            }
                        }

                        ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass") {
                            withAnimation(.spring()) {
                                resetImageState()
                            }
                        }
                        
                        ControlImageView(icon: "plus.magnifyingglass") {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(22)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom, 30),
                alignment: .bottom
            )
            
        }
        .navigationViewStyle(.stack)
    }
}

private extension ContentView {
    func resetImageState() {
        withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
