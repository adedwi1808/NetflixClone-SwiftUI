//
//  SnapCarousel.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State private var isViewLoaded = false
    
    init(
        spacing: CGFloat = 15,
        trailingSpace: CGFloat = 100,
        index: Binding<Int>,
        list: [T],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.list = list
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                        .offset(y: getOffset(item, width: width))
                        .rotationEffect(getAngel(item, width: width))
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + adjustmentWidth + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded( { value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
            .onAppear {
                DispatchQueue.main.async {
                    currentIndex = index
                    isViewLoaded = true
                }
            }
        }
        .animation(.linear, value: currentIndex)
    }
}

extension SnapCarousel {
    func getOffset(_ item: T, width: CGFloat) -> CGFloat {
        let offsetHeight: CGFloat = 10
        let progress = ((offset < 0 ? offset : -offset) / width) * offsetHeight
        let topOffset = -progress < offsetHeight ? progress : -(progress + (offsetHeight * 2))
        
        let previous = getIndex(item) - 1 == currentIndex ? (offset < 0 ? topOffset : -topOffset) : 0
        let next = getIndex(item) + 1 == currentIndex ? (offset < 0 ? -topOffset : topOffset) : 0
        let checkBetween = currentIndex >= 0 && currentIndex < list.count ? (getIndex(item) - 1 == currentIndex ? previous : next) : 0
        
        return getIndex(item) == currentIndex ? -offsetHeight - checkBetween : 0
    }
    
    func getAngel(_ item: T, width: CGFloat) -> Angle {
        let offsetHeight: CGFloat = 10
        let progress = ((offset < 0 ? offset : -offset) / width) * offsetHeight
        let topOffset = -progress < offsetHeight ? progress : -(progress + (offsetHeight * 2))
        
        let previous = getIndex(item) - 1 == currentIndex ? (offset < 0 ? topOffset : -topOffset) : 0
        let next = getIndex(item) + 1 == currentIndex ? (offset < 0 ? -topOffset : topOffset) : 0
        
        let checkBetween = currentIndex >= 0 && currentIndex < list.count ? (getIndex(item) - 1 == currentIndex ? previous : next) : 0
        
        let result = getIndex(item) != currentIndex ? -offsetHeight - checkBetween : 0
        
        return Angle(degrees: getIndex(item) + 1 == currentIndex ? result : -result)
    }
    
    func getIndex(_ item: T) -> Int {
        let index = list.firstIndex { currentItem in
            return currentItem.id == item.id
        }
        
        return index ?? 0
    }
}

