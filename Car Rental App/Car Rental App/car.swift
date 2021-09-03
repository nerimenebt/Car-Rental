//
//  car.swift
//  Car Rental App
//
//  Created by Nerimene on 30/8/2021.
//

import Foundation

struct carBrand : Identifiable{
    let id: Int
    let type, image, brandType: String
    var selected: Bool
}

var Brands = [carBrand(id: 0, type: "txt", image: "", brandType: "all", selected: true),
              carBrand(id: 1, type: "img", image: "tesla1", brandType: "tesla", selected: false),
              carBrand(id: 2, type: "img", image: "audi1", brandType: "audi", selected: false),
              carBrand(id: 3, type: "img", image: "mazda1", brandType: "mazda", selected: false),
              carBrand(id: 4, type: "img", image: "mercedes", brandType: "mercedes", selected: false),
              carBrand(id: 5, type: "img", image: "bmw", brandType: "bmw", selected: false),
              carBrand(id: 6, type: "img", image: "mitsubishi1", brandType: "mitsubishi", selected: false),
              carBrand(id: 7, type: "img", image: "porsche1", brandType: "porsche", selected: false),
              carBrand(id: 8, type: "img", image: "volkswagen", brandType: "volkswagen", selected: false)]

struct Car : Identifiable {
    let id: Int
    let img, model, year, price, kms, location, distance, type, brandImg: String
}

var Cars = [Car(id: 0, img: "t1", model: "Tesla Model X", year: "2018", price: "$180", kms: "322", location: "Los Angelos, CA", distance: "344 m", type: "tesla", brandImg: "tesla1"),
            Car(id: 1, img: "t2", model: "Tesla Model S", year: "2021", price: "$250", kms: "200", location: "Los Angelos, CA", distance: "200 m", type: "tesla", brandImg: "tesla1"),
            Car(id: 2, img: "a1", model: "Audi Model A3", year: "2020", price: "$300", kms: "240", location: "Los Angelos, CA", distance: "344 m", type: "audi", brandImg: "audi1"),
            Car(id: 3, img: "a2", model: "Audi Model A4", year: "2021", price: "$370", kms: "160", location: "Los Angelos, CA", distance: "200 m", type: "audi", brandImg: "audi1"),
            Car(id: 4, img: "bmw1", model: "BMW Model 230", year: "2021", price: "$390", kms: "350", location: "Los Angelos, CA", distance: "344 m", type: "bmw", brandImg: "bmw"),
            Car(id: 5, img: "bmw2", model: "BMW Model 330", year: "2021", price: "$460", kms: "270", location: "Los Angelos, CA", distance: "200 m", type: "bmw", brandImg: "bmw"),
            Car(id: 6, img: "p1", model: "Porsche 718 Spyder", year: "2020", price: "$600", kms: "300", location: "Los Angelos, CA", distance: "344 m", type: "porsche", brandImg: "porsche1"),
            Car(id: 7, img: "m1", model: "Mercedes Model Classe S", year: "2020", price: "$530", kms: "270", location: "Los Angelos, CA", distance: "200 m", type: "mercedes", brandImg: "mercedes")]
