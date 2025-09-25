//
//  ContentView.swift
//  RecetarioAPP
//
//  Created by Felipe Navarrete Navarrete on 25-09-25.
//

import SwiftUI

struct ContentView: View {
    let recipes: [Recipe] = [
        Recipe(name: "Medialunas de Grasa", ingredients: ["Harina 0000", "Levadura fresca", "Azúcar", "Sal", "Grasa bovina", "Agua tibia"], instructions: ["Disolver la levadura en agua tibia.", "Mezclar la harina con sal y azúcar.", "Incorporar la grasa derretida y la levadura.", "Amasar hasta obtener una masa lisa.", "Dejar leudar por 1 hora.", "Estirar y cortar en triángulos.", "Enrollar para dar forma de medialuna.", "Hornear a 200°C hasta que estén doradas."]),
        Recipe(name: "Vigilantes de Dulce de Leche", ingredients: ["Harina 0000", "Levadura fresca", "Leche tibia", "Huevo", "Manteca", "Dulce de leche"], instructions: ["Formar una corona con la harina.", "En el centro, agregar levadura disuelta, leche y huevo.", "Amasar y añadir la manteca blanda.", "Dejar leudar hasta duplicar su tamaño.", "Estirar la masa y rellenar con dulce de leche.", "Enrollar y dar forma de rollo.", "Hornear a fuego moderado."])
    ]
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(recipes) { recipe in
                        NavigationLink{
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            Text(recipe.name)
                        }
                        
                    }
                }
                .navigationTitle("Recetas Argentinas")
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
