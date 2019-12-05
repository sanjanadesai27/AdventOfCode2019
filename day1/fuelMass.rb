#!/usr/bin/ruby

def calc(input) 
  (input/3).floor - 2 
end

def findFuelMass(initialAmount)
  totalFuel = calc(initialAmount).negative? ? 0 : calc(initialAmount)

  if totalFuel > 0
    totalFuel += findFuelMass(totalFuel)
  end 

  totalFuel
end 

def main 
  fuels = []
  IO.foreach("./day1input.txt") { |amount|
    fuels.push(findFuelMass(amount.to_i))
  }
  puts fuels.reduce(&:+)
end

main


