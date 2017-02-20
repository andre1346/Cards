defmodule Cards do
@moduledoc """
methode pour creer un jeu de carte.
"""
@doc """
retourner une liste de cartes
"""


	def create_deck do
		values=["Ace", "Jack", "Quenn", "King", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
		suits=["Spades", "Clubs", "Hearts", "Diamond"]

		for suit <-suits, value <- values do
		"#{value} of #{suit}"
    	end
		
	end

	 def create_multiple_deck(qte) do
	 	Cards.add_joker
	 	|> List.duplicate(qte)
	 	|> List.flatten

     end 
    def add_joker do
    	deck=Cards.create_deck
    	joker=["red_joker", "black_joker"]
    	List.flatten(deck, joker)

    end  

	def shuffle(deck) do
		Enum.shuffle(deck)
	end


	def contains?(deck, card) do
		Enum.member?(deck, card)
	end	
	
	@doc """
	divise un jeu de carte en main la 'main' indique combien de cartes jouer
	"""
	def deal(deck, hand_size) do
		Enum.split(deck, hand_size)
	end



	def players(x) do
     List.duplicate("players", x)
     |> Enum.with_index(1)
	end	


	def save(deck, filename) do
		binary = :erlang.term_to_binary(deck)
		File.write(filename, binary)
	end

	def load (filename) do

		case File.read(filename) do
		{:ok, binary} ->:erlang.binary_to_term binary
		{:error, _reason}->"sa existe pas nono"
		end	  
	end

	def create_hand(hand_size, qte) do
		Cards.create_multiple_deck(qte)
		|>Cards.shuffle
		|>Cards.deal(hand_size)	
	end	


	def give_cards(qte,players) do
		deck = Cards.create_deck
 		newDeck = Cards.shuffle(deck)
		List.duplicate(qte,players)
		 |> Enum.with_index(1)
           
	end

	def create_multiplayer_game(player_amount, hand_size) do 
		Cards.create_deck
			|> Cards.shuffle
			|> Cards.deal_multiplayer_hand(hand_size, player_amount)

		#players = Cards.players(player_amount)
		

	end


	def deal_multiplayer_hand(deck, hand_size, player_amount) do 
		Cards.deal(deck, hand_size)
		|>Cards.shuffle
	end
  FACON DE FAIRE POUR LES NONOS
  je te donne un jeu de 52 cartes
  brasse les cartes
  donne un nombre specifier ( a venir) de cartes 
  a chaque joueur (nombres a venir)
  a la fin garde le paquet en mains
  assure toi que chaque joueurs a le bon nombre de cartes.
 end