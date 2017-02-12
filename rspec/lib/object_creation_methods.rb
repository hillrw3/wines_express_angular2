require_relative './models'

def create_wine(options = {})
  Wines.connection

  parameters = {
    varietal: 'Pinot Noir'
  }.merge(options)

  Wines.create(parameters)
end

# def create_pokemon(options = {})
#   Pokemons.connection
#
#   default_options = {
#     name: "Default Pokemon Name",
#     element_type: ['wind', 'water', 'fire', 'grass'].shuffle.first,
#     age: [1, 2, 3, 4, 5].shuffle.first,
#     sex: ['M', 'F'].shuffle.first,
#   }
#
#   Pokemons.create(default_options.merge(options))
# end
