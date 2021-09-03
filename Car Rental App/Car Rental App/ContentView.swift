//
//  ContentView.swift
//  Car Rental App
//
//  Created by Nerimene on 30/8/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Choose")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("a Car")
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    
                }.padding(.top, 30)
                .padding(.leading, 20)
                VStack {
                    Text("Brands")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.leading, -160)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Brands, id: \.id) { item in
                                CarMarkView(item: item)
                            }
                        }.padding(.top, 10)
                        .padding(.leading, 20)
                    }
                }
                HStack {
                    Text("Available cars")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    Spacer()
                    Image("filter1")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                }.padding(.bottom, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(Cars) { item in
                            NavigationLink(destination: DetailsView(item: item)) {
                                CarView(item: item)
                            }
                        }.padding(.all)
                    }
                }.background(Color(red: 236/255, green: 236/255, blue: 236/255, opacity: 1.0))
                .ignoresSafeArea(edges: .all)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .frame(height: 80)
                    .padding(.bottom, -16)
                    .overlay(
                        HStack {
                            Image(systemName: "square.grid.2x2.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                                .padding(.trailing, 50)
                            Image(systemName: "bell.badge")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                                .padding(.trailing, 50)
                            
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                                .padding(.trailing, 50)
                            
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                                .padding(.trailing, 30)
                        }
                    )
            }.background(Color(red: 236/255, green: 236/255, blue: 236/255, opacity: 1.0))
            .ignoresSafeArea(edges: .all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }.accentColor(.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CarMarkView: View {
    @State var item: carBrand
    var body: some View {
        if item.type == "txt" {
            Button(action: {
                item.selected.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(item.selected ? Color.blue : Color.white)
                    .frame(width: 70, height: 70)
                    .overlay(
                        Text("ALL")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(item.selected ? .white : .black)
                        ,alignment: .center
                    )
            })
        } else {
            Button(action: {
                item.selected.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(item.selected ? Color.blue : Color.white)
                    .frame(width: 70, height: 70)
                    .overlay(
                        Image(item.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(item.selected ? .white : .black)
                        ,alignment: .center
                    )
            })
        }
    }
}

struct CarView: View {
    @State var item: Car
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            VStack {
                HStack {
                    Image(item.img)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.top, -20)
                    Spacer()
                    VStack {
                        Text("\(item.model)")
                            .font(.title3)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .minimumScaleFactor(0.5)
                            .padding(.leading, 10)
                            .padding(.trailing, 20)
                        
                        Text("    \(item.year)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.trailing, -190)
                    }
                }
               // Spacer()
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
                        .frame(width: 150)
                        .overlay(
                            Text("Details ")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        )
                }.frame(height: 60)
            }
        }.frame(height: 160)
    }
}
