//: Playground - noun: a place where people can play

import UIKit

struct Card { //Give the Card struct a property "Color" which will hold the color values associated with the        card (Red, Blue, or Green).
    var color: String
    var roll: Int
}

class Deck {
    var cards = [Card]() // Give the Card a property "Roll" which will hold a random value that represents the side of the      die that will trigger that card.
    init() {
        for _ in 1...10 {
            let card = Card(color: "Blue", roll: Int(arc4random_uniform(2)+1))
            cards.append(card)

        }
        for _ in 1...10 {
            let card = Card(color: "Red", roll: Int(arc4random_uniform(2)+3))
            cards.append(card)
        }
        for _ in 1...10 {
            let card = Card(color: "Green", roll: Int(arc4random_uniform(3)+4))
            cards.append(card)
        }
    }
    func removeTop()->Card{ //Give the Deck a deal method that selects the "top-most" card, removes it, and returns it
        let top = cards.count - 1
        let temp = cards[top]
        cards.remove(at: top)
        return temp
    }
    
    func isEmpty()->Bool{ //Give the Deck a isEmpty method that returns true or false in regards to if the deck                 has ran out of cards.
        if cards.count == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func shuffle()->Any{ //Give the Deck a shuffle method that randomly reorders the deck's cards
        for _ in 1...30 {
            let randomNumber1 = Int(arc4random_uniform(UInt32(cards.count-1)))
            let randomNumber2 = Int(arc4random_uniform(UInt32(cards.count-1)))
            let temp = cards[randomNumber1]
            cards[randomNumber1] = cards[randomNumber2]
            cards[randomNumber2] = temp
        }
        return deck.cards
    }
}
var deck = Deck()

//print(deck.removeTop())
//print(deck.isEmpty())
//print(deck.shuffle())
//print(deck.cards)

class Player {
    var name: String //Give the Player class a name property
    var hand:[Card]=[] //Give the Player a hand property of type [Card]
    init(name: String){
        self.name = name
    }
    func draw(deck: Deck) -> Card { //Give the Player a draw method of type (Deck) -> Card which draws a card from a deck, adds it to the players hand, and returns it
        let draw_card = deck.removeTop()
        self.hand.append(draw_card)
        return draw_card
    }
    func rolldice() -> Int { //Give the Player a rollDice method that returns a random number between 1 and 6
        let diceroll: Int = Int(arc4random_uniform(5) + 1)
        return diceroll
    }

    func matchingCards(roll: Int, color: String) -> Int { //Give the Player a matchingCards method of (String, Int) -> Int that will count all the card the player has which match the given color string and roll integer.
        var count: Int = 0
        for i in hand {
            if (roll == i.roll && color == i.color){
                count += 1
            }
        }
        return(count)
    }
}

var player = Player(name:"Jay")
print(deck.shuffle())
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.draw(deck: deck))
print(player.rolldice())
print(player.matchingCards(roll:1 , color:"Blue"))
print(player.matchingCards(roll:2 , color:"Blue"))
print(player.matchingCards(roll:3 , color:"Red"))
print(player.matchingCards(roll:4 , color:"Red"))
print(player.matchingCards(roll:4 , color:"Green"))
print(player.matchingCards(roll:5 , color:"Green"))
print(player.matchingCards(roll:6 , color:"Green"))

