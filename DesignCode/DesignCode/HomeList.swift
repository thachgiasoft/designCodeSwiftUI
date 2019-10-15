//
//  HomeList.swift
//  DesignCode
//
//  Created by Kitwana Akil on 10/9/19.
//  Copyright © 2019 Kitwana Akil. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    
    @State var showingContent = false
    var courses = coursesData
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack (alignment: .leading){
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 60)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 30){
                        ForEach(courses) { item in
                            Button(action: { self.showingContent.toggle() }) {
                                GeometryReader { geometry in
                                    CourseView(
                                        title: item.title,
                                        image: item.image,
                                        color: item.color,
                                        shadowColor: item.shadowColor
                                    )
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 30) / -40
                                        ), axis: (x: 0, y: 10, z: 0))
                                    .sheet(isPresented: self.$showingContent, content: {
                                        CourseView()
                                    })
                                    
                                }
                                .frame(width: 246, height: 150)
                            }
                            
                            
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                .frame(height: 450)
                
                CertificateRow()
            }
            .padding(.top, 78.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150.0)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course : Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")
    ),
    Course(title: "Design Course",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4")
    ),
    Course(title: "Swift UI Advanced",
           image: "Illustration3",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Framer Playground",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Flutter for Designers",
           image: "Illustration5",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]
