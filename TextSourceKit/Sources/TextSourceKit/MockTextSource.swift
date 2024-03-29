// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0


import Foundation

public struct MockTextSource: TextSource {
  private static let text = """
Apple Inc. is an American multinational technology company that specializes in consumer electronics, computer software and online services. Apple is the world's largest technology company by revenue (totaling $274.5 billion in 2020) and, since January 2021, the world's most valuable company. As of 2021, Apple is the world's fourth-largest PC vendor by unit sales and fourth-largest smartphone manufacturer.It is one of the Big Five American information technology companies, along with Amazon, Google (Alphabet), Facebook (Meta) and Microsoft.
Apple was founded by Steve Jobs, Steve Wozniak and Ronald Wayne in 1976 to develop and sell Wozniak's Apple I personal computer. It was incorporated by Jobs and Wozniak as Apple Computer, Inc. in 1977 and sales of its computers, including the Apple II, grew quickly. It went public in 1980 to instant financial success. Over the next few years, Apple shipped new computers featuring innovative graphical user interfaces, such as the original Macintosh, announced with the critically acclaimed advertisement "1984".
The high price of its products and limited application library caused problems, as did power struggles between executives. In 1985, Wozniak departed Apple amicably, while Jobs resigned to found NeXT, taking some Apple co-workers with him.
As the market for personal computers expanded and evolved through the 1990s, Apple lost considerable market share to the lower-priced duopoly of Microsoft Windows on Intel PC clones. The board recruited CEO Gil Amelio, who prepared the struggling company for eventual success with extensive reforms, product focus and layoffs in his 500-day tenure. In 1997, Amelio bought NeXT to resolve Apple's unsuccessful operating system strategy and bring back Steve Jobs, who replaced Amelio as CEO later that year. Apple returned to profitability under the revitalizing "Think different" campaign, launching the iMac and iPod, opening a retail chain of Apple Stores in 2001 and acquiring numerous companies to broaden their software portfolio. In 2007, the company launched the iPhone to critical acclaim and financial success. In 2011, Jobs resigned as CEO due to health complications and died two months later. He was succeeded by Tim Cook.
In August 2018, Apple became the first publicly traded U.S. company to be valued at over $1 trillionand the first valued over $2 trillion two years later. It has a high level of brand loyalty and is ranked as the world's most valuable brand; as of January 2021, there are 1.65 billion Apple products in use worldwide. The company receives significant criticism regarding the labor practices of its contractors, its environmental practices and business ethics, including anti-competitive behavior and materials sourcing.
"""
  
  public let words = text
    .components(separatedBy: .whitespacesAndNewlines)
  
  public init() {}
  
  public func fetch (index: Int = 0, count: Int? = nil) -> [String] {
    guard index >= 0, index < words.count else { return [] }
    
    guard let count = count else {
      return Array(words[index...])
    }
    
    if index + count < words.count {
      return Array(words[index..<index+count])
    } else {
      return Array(words[index...])
    }
  }
}
