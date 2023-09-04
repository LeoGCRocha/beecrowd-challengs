import math
duration = {
    'W': 1,
    'H': 1/2,
    'Q': 1/4,
    'E': 1/8,
    'S': 1/16,
    'T': 1/32, 
    'X': 1/64
}
while True:
    inpt = input()
    if inpt == "*":
        break
    else:
        input_song = inpt[1:-1].split('/')
        count = 0
        for inp in input_song:
            cont = 0
            for x in inp:
                cont += duration[x]
            if cont == 1:
                count += 1        
        print(count)
