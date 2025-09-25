//  ContentView.swift
//  RecetarioAPP
//
//  Created by Felipe Navarrete Navarrete on 25-09-25.

import SwiftUI

struct ContentView: View {
    
    // Aquí guardamos el estado de favorito, usando el id como clave.
    @State private var favorites: [String: Bool] = [:]

    let recipes: [Recipe] = [
        Recipe(id: "1A2B3C4D-5E6F-7A8B-9C0D-1E2F3A4B5C6D", name: "Medialunas de Grasa", ingredients: ["Harina 0000", "Levadura fresca", "Azúcar", "Sal", "Grasa bovina", "Agua tibia"], instructions: ["Disolver la levadura en agua tibia.", "Mezclar la harina con sal y azúcar.", "Incorporar la grasa derretida y la levadura.", "Amasar hasta obtener una masa lisa.", "Dejar leudar por 1 hora.", "Estirar y cortar en triángulos.", "Enrollar para dar forma de medialuna.", "Hornear a 200°C hasta que estén doradas."]),
        Recipe(id: "9B3D6A2E-C4E5-4A9B-B1D0-1F2A3D4C5E6F", name: "Vigilantes de Dulce de Leche", ingredients: ["Harina 0000", "Levadura fresca", "Leche tibia", "Huevo", "Manteca", "Dulce de leche"], instructions: ["Formar una corona con la harina.", "En el centro, agregar levadura disuelta, leche y huevo.", "Amasar y añadir la manteca blanda.", "Dejar leudar hasta duplicar su tamaño.", "Estirar la masa y rellenar con dulce de leche.", "Enrollar y dar forma de rollo.", "Hornear a fuego moderado."])
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe, favorites: $favorites)
                    } label: {
                        HStack {
                            Text(recipe.name)
                            Spacer()
                            if favorites[recipe.id] == true {
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(.pink)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recetas Argentinas")
        }
    }
}
