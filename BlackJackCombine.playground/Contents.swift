import Foundation
import Combine

// Setting up a future subscriber
let dealtHand = PassthroughSubject<Hand, HandError>()

// ----------------------
// A simple function to deal and then publish hand information to subscribers
func deal(_ cardCount: Int) {
  var deck = cards   // defined in SupportCode.swift
  var cardsRemaining = 52
  var hand = Hand()  // which is an array of card tuples (empty for now)
  
  for _ in 0 ..< cardCount {
    let randomIndex = Int.random(in: 0 ..< cardsRemaining)
    hand.append(deck[randomIndex])
    deck.remove(at: randomIndex)
    cardsRemaining -= 1
  }
  
  // As cards are dealt, the subscriber needs to be updated
  if hand.points > 21 {
    // send an error to the subscriber
    dealtHand.send(completion: .failure(.busted))
  } else {
    // send the updated hand to the subscriber
    dealtHand.send(hand)
  }
}

// ----------------------
// Add a subscription for the dealtHand PassthroughSubject
_ = dealtHand
    // sink() attaches a subscriber with closure-based behavior.
  .sink(receiveCompletion: {
    if case let .failure(error) = $0 {
      print(error)
    }
  }, receiveValue: { hand in
    print(hand.cardString, "for", hand.points, "points")
  })

// ----------------------
deal(2)
deal(3)
