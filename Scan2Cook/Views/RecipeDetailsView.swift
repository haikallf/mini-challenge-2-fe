//
//  CustomView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipeId: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var searchText = ""
    
    // Gesture Properties...
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            // MARK: Background
            VStack {
                Rectangle()
                    .fill(.gray)
                    .frame(width: 393, height: 492)
                    .blur(radius: getBlurRadius())
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            // MARK: Bottom Sheet
            // For Getting Height For Drag Gesture
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                print("geometry height: \(height)")
                print("screen height: \(UIScreen.main.bounds.height)")
                return AnyView(
                    ZStack {
                        // MARK: - BOTTOM SHEET BACKGROUND
                        Color.white
                            .ignoresSafeArea()
                        
                        VStack {
                            // MARK: - TOP DRAG INDICATOR
                            Capsule()
                                .fill(.white)
                                .frame(width: 60, height: 4)
                                .padding(.top)
                            
                            // MARK: - CUSTOM CONTENT
                            RecipeDetailsSheet(recipeId: "1")
                            
                            Spacer()
                        }
                    } //: ZSTACK
                        .offset(y: height - 360)
                        .offset(y: -offset > 0 ? -offset <= (height - 360) ? offset : -(height - 360) : 0)
                        .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                            out = value.translation.height
                            onChange()
                        }).onEnded({ value in
                            let maxHeight = height - 360
                            withAnimation {
                                // offset = 0
                                
                                // Logic Conditions For Moving States....
                                // Up down or mid...
                                if -offset > 360 && -offset < maxHeight / 2 {
                                    // Mid...
                                    offset = -(maxHeight / 3)
                                } else if -offset > maxHeight / 2 {
                                    offset = -maxHeight
                                } else {
                                    offset = 0
                                }
                            }
                            
                            // Storing Last Offset...
                            // So that the gesture can contine from the last position....
                            lastOffset = offset
                            
                        }))
                    
                    
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                HStack(alignment: .top) {
                    Image(systemName: "arrow.left")
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top, 12)
            .padding(.leading)
        }
        
        
    }
    
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    // Blur Radius for BG...
    func getBlurRadius() -> CGFloat {
        let progress = -offset / (UIScreen.main.bounds.height - 360)
        return progress * 30
    }
}

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipeId: "1")
    }
}
