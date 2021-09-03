//
//  DetailsView.swift
//  Car Rental App
//
//  Created by Nerimene on 31/8/2021.
//

import SwiftUI

struct DetailsView: View {
    
    @State var item: Car
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
//    var btnBack: some View {
//        Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//    }) {
//        Image(systemName: "arrow.backward")
//            .aspecstRatio(contentMode: .fit)
//            .foregroundColor(.white) }
//    }
//
//    var rightBtn: some View {
//        Image(systemName: "ellipsis")
//            .aspectRatio(contentMode: .fit)
//            .foregroundColor(.white)
//    }
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                        .frame(width: screenSize.width, height: (screenSize.height / 2) + 100, alignment: .top)
                        .padding(.top, -90)
                    
                    VStack {
                        HStack {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            
                            Spacer()
                            
                            Image(systemName: "ellipsis")
                                .resizable()
                                .frame(width: 24, height: 10)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                        
                        }.padding(.top, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Image(item.brandImg)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.black)
                                    ,alignment: .center
                                )
                            VStack {
                                Text("\(item.model)")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .minimumScaleFactor(0.5)
                                    .padding(.leading, 10)
                                    .padding(.top, 10)
                                
                                Text("\(item.year)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .padding(.leading, -60)
                            }
                            
                            Spacer()
                            
                           Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 14, height: 14)
                            .padding(.top, -10)
                            
                            Text("4.8")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.trailing, 10)
                                .padding(.top, -10)
                        }.padding(.leading, 10)
                        
                        Image(item.img)
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        Spacer()
                    }
                }
                HStack {
                    Text("Specifications")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading, 20)
                .padding(.top, 10)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black)
                            
                        VStack {
                            Image("speed")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.white)
                                .colorMultiply(.white)
                            
                            HStack {
                                Text("\(item.kms)")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                Text("km/h")
                                    .foregroundColor(.gray)
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black)
                            
                        VStack {
                            Image("1")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.white)
                            Text("LiftBack")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    Spacer()
                }.padding(.leading, 10)
                .padding(.top, 10)
                .frame(height: 150)
                
                HStack {
                    Text("Location")
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Image("walk")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24)
                    Text("\(item.distance)")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                }.padding(.leading, 20)
                .padding(.trailing, 20)
                
                HStack {
                    Image("location")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(item.location)")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.leading, 20)
                
                HStack(alignment: .bottom) {
                    Text("\(item.price)")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                    Text("/ day")
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: screenSize.width / 2)
                        .overlay(
                            Text("Book now ")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        )
                }.frame(height: 60)
            }
        }.ignoresSafeArea(edges: .all)
        .navigationBarBackButtonHidden(false)
        
        .padding(.bottom, 20)
//        .navigationBarItems(leading: btnBack, trailing: rightBtn)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(item: Cars[0])
    }
}

struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}
