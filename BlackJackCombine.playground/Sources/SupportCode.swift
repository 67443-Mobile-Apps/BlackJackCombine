import Foundation

public typealias Card = (String, Int) // a tuple with the display string and the point value
public typealias Hand = [Card]        // just an array of card tuples

// A deck of these card tuples (... and yes, I know in real Black Jack that Ace can be 11 or 1)
public let cards = [
  ("2♠️", 2), ("3♠️", 3), ("4♠️", 4), ("5♠️", 5), ("6♠️", 6), ("7♠️", 7), ("8♠️", 8), ("9♠️", 9), ("10♠️", 10), ("J♠️", 10), ("Q♠️", 10), ("K♠️", 10),("A♠️", 11),
  ("2♥️", 2), ("3♥️", 3), ("4♥️", 4), ("5♥️", 5), ("6♥️", 6), ("7♥️", 7), ("8♥️", 8), ("9♥️", 9), ("10♥️", 10), ("J♥️", 10), ("Q♥️", 10), ("K♥️", 10),("A♥️", 11),
  ("2♣️", 2), ("3♣️", 3), ("4♣️", 4), ("5♣️", 5), ("6♣️", 6), ("7♣️", 7), ("8♣️", 8), ("9♣️", 9), ("10♣️", 10), ("J♣️", 10), ("Q♣️", 10), ("K♣️", 10),("A♣️", 11),
  ("2♦️", 2), ("3♦️", 3), ("4♦️", 4), ("5♦️", 5), ("6♦️", 6), ("7♦️", 7), ("8♦️", 8), ("9♦️", 9), ("10♦️", 10), ("J♦️", 10), ("Q♦️", 10), ("K♦️", 10),("A♦️", 11)
]

// ... need a little more functionality for the Hand
public extension Hand {
  // need a string to display the contents of a hand
  var cardString: String {
    map { $0.0 }.joined(separator: " ")
  }
  
  // need the total point value of the hand
  var points: Int {
    map { $0.1 }.reduce(0, +)
  }
}


// And finally, an enum with the one error type (.busted) we are accounting for
public enum HandError: Error, CustomStringConvertible {
  case busted
  
  public var description: String {
    switch self {
    case .busted:
      return "Busted -- no soup for you."
    }
  }
}
