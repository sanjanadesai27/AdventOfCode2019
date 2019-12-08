DESIRED_VAL = 19690720

def add(a,b)
  a + b
end 

def multiply(a, b)
  a * b
end 

def intcode(arr)
  i = 0
  while arr[i] != 99
    if arr[i] == 1 
      arr[arr[i+3]] = add(arr[arr[i+1]],arr[arr[i+2]])
      i += 4 
    elsif arr[i] == 2
      arr[arr[i+3]] = multiply(arr[arr[i+1]],arr[arr[i+2]])
      i += 4 
    end
  end 
  arr 
end 

def main 
  100.times do |i|
    100.times do |j|
      inputArr = File.read("input.txt").split(',').map(&:to_i)
      inputArr[1] = i 
      inputArr[2] = j
      intcode(inputArr)
      puts 100 * i + j if inputArr[0] == DESIRED_VAL
    end 
  end 

end 

main