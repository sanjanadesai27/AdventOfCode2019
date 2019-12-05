# Positions 
# [0] - position of the OPCODE 
# [1] - position of the first input 
# [2] - position of the second input 
# [3] - position of the output (overwrite existing value in the position)
# ! Remember that these positions are relative to the 

#OPCODES 
# 1 - add the two inputs (values in [2][3])
# 2 - multiply two inputs (values in[2][3])
# 99 - halt

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