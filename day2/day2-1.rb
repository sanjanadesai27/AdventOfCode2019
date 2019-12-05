def add(a,b)
  a + b
end 

def multiply(a, b)
  a * b
end 

def intcode(arr)
  i = 0
  while arr[i] != 99
    puts i 
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
  inputArr = File.read("input.txt").split(',').map(&:to_i)
  puts intcode(inputArr).to_s
end 

main