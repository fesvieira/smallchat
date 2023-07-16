//
//  MessageShape.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 16/05/23.
//
import SwiftUI

struct AbsoluteRoundedRectangle: Shape {
    let topLeft: CGFloat
    let topRight: CGFloat
    let bottomRight: CGFloat
    let bottomLeft: CGFloat
    
    private let rect = CGRect()
    
    init(_ topLeft: CGFloat,_ topRight: CGFloat,_ bottomRight: CGFloat,_ bottomLeft: CGFloat) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomRight = bottomRight
        self.bottomLeft = bottomLeft
    }
    
    init(all: CGFloat) {
        self.topLeft = all
        self.topRight = all
        self.bottomRight = all
        self.bottomLeft = all
    }
    
    init(top: CGFloat, bottom: CGFloat) {
        self.topLeft = top
        self.topRight = top
        self.bottomRight = bottom
        self.bottomLeft = bottom
    }
    
    init(left: CGFloat, right: CGFloat) {
        self.topLeft = left
        self.topRight = right
        self.bottomRight = right
        self.bottomLeft = left
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + topLeft, y: rect.minY))
        
        // Top-right corner
        path.addArc(center: CGPoint(x: rect.maxX - topRight, y: rect.minY + topRight),
                    radius: topRight,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        
        // Bottom-right corner
        path.addArc(center: CGPoint(x: rect.maxX - bottomRight, y: rect.maxY - bottomRight),
                    radius: bottomRight,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        
        // Bottom-left corner
        path.addArc(center: CGPoint(x: rect.minX + bottomLeft, y: rect.maxY - bottomLeft),
                    radius: bottomLeft,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        
        // Top-left corner
        path.addArc(center: CGPoint(x: rect.minX + topLeft, y: rect.minY + topLeft),
                    radius: topLeft,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        AbsoluteRoundedRectangle(32, 32, 32, 32)
            .fill()
            .frame(width: 200, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
    }
}
