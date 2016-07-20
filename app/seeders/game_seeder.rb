class GameSeeder
  GAMES = [
   {
     name: 'Pandemic Legacy: Season 1',
     genre: 'Strategy',
     designer: 'Rob Daviau',
     description: 'Pandemic Legacy is a co-operative campaign game, with an overarching story-arc played through 12-24 sessions, depending on how well your group does at the game.',
     max_players: 4,
     min_players: 2,
     max_playtime: 60,
     min_playtime: 60,
     year: 2015
   }, {
     name: 'Terra Mystica',
     genre: 'Strategy',
     designer: 'Jens Drogemuller',
     description: 'In the land of Terra Mystica dwell 14 different peoples in seven landscapes, and each group is bound to its own home environment, so to develop and grow, they must terraform neighboring landscapes into their home environments in competition with the other groups.',
     max_players: 5,
     min_players: 2,
     max_playtime: 150,
     min_playtime: 60,
     year: 2012
   }, {
     name: 'Agricola',
     genre: 'Strategy',
     designer: 'Uwe Rosenberg',
     description: "In Agricola, you're a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you'll find on a farm: collecting clay, wood, or stone; building fences; and so on.",
     max_players: 5,
     min_players: 1,
     max_playtime: 30,
     min_playtime: 150,
     year: 2007
   }, {
     name: 'Eclipse',
     genre: 'Strategy',
     designer: 'Touko Tahkokallio',
     description: "In Agricola, you're a farmer in a wooden shack with your spouse and little else. On a turn, you get to take only two actions, one for you and one for the spouse, from all the possibilities you'll find on a farm: collecting clay, wood, or stone; building fences; and so on.",
     max_players: 6,
     min_players: 2,
     max_playtime: 60,
     min_playtime: 200,
     year: 2011
   }, {
     name: 'Ticket to Ride',
     genre: 'Family',
     designer: 'Alan R. Moon',
     description: 'With elegantly simple gameplay, Ticket to Ride can be learned in under 15 minutes, while providing players with intense strategic and tactical decisions every turn. ',
     max_players: 5,
     min_players: 2,
     max_playtime: 30,
     min_playtime: 60,
     year: 2004
   }
 ]

 def self.seed!
   GAMES.each do |game|
     boardgame = Game.find_or_initialize_by(name: game[:name])
     boardgame.genre = game[:genre]
     boardgame.designer = game[:designer]
     boardgame.description = game[:description]
     boardgame.max_players = game[:max_players]
     boardgame.min_players = game[:min_players]
     boardgame.max_playtime = game[:max_playtime]
     boardgame.min_playtime = game[:min_playtime]
     boardgame.year = game[:year]
     boardgame.save!
   end
 end
end
