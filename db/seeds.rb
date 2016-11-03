# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


simplificator_players = [
  { first_name: 'Lukas'     , last_name: 'Eppler'       , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589598/lukas.jpg'},
  { first_name: 'Miriam'    , last_name: 'Schütz'       , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589571/profilfoto-2.jpg'},
  { first_name: 'Alessandro', last_name: 'Di Maria'     , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589604/profilfotos.jpg'},
  { first_name: 'Sabine'    , last_name: 'Schäuble'     , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589674/sabine2.jpg'},
  { first_name: 'Nicola'    , last_name: 'Piccinini'    , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589591/png.png'},
  { first_name: 'Ferdinand' , last_name: 'Niedermann'   , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589769/ferdi.png'},
  { first_name: 'Corin'     , last_name: 'Langosch'     , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589597/profilfoto-3.jpg'},
  { first_name: 'Thomas'    , last_name: 'Ritter'       , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933589799/profilfoto-2.jpg'},
  { first_name: 'Thomas'    , last_name: 'Arni'         , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933590158/thomas-arni.jpg'},
  { first_name: 'Corinne'   , last_name: 'Schuler'      , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933595481/corinne-portrait.png'},
  { first_name: 'Marcel'    , last_name: 'Rupf'         , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933590696/marcel.jpg'},
  { first_name: 'Manuel'    , last_name: 'Bouza'        , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933591292/manuel_portrait_071015.jpg'},
  { first_name: 'Mario'     , last_name: 'Schüttel'     , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933592692/160205_profilfotos-mario-512.jpg'},
  { first_name: 'Serge'     , last_name: 'Hänni'        , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933595186/Serge-512.jpg'},
  { first_name: 'Noëlle'    , last_name: 'Rosenberg'    , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933594182/noelle_480.jpg'},
  { first_name: 'Cédric'    , last_name: 'Wider'        , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933594369/2f1121ff007a56f495623c04f83166a5.jpeg'},
  { first_name: 'Marion'    , last_name: 'Schleifer'    , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933591687/profilfoto-marion.png'},
  { first_name: 'Florian'   , last_name: 'Unternährer'  , image_url: 'https://simplificator.mocoapp.com/system/user/avatar/933596258/florian-portrait_360.png'},
  { first_name: 'Sandra'    , last_name: 'Blatter'      , image_url: ''},
  { first_name: 'Marcus'    , last_name: 'Egues'        , image_url: ''}
]

simplificator_players.each do |player|
  Player.find_or_create_by!(player)
end
