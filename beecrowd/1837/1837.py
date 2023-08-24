# exp -> a = b * q + r -> dividendo = divisor * quociente + resto
# descobrir o resto que contepla a solucao
# exp_quociente -> (a - r) / q 
# exp_quociente -> ((-7 - 0) % 3) == 0 -> r = 0
# exp_quociente -> ((-7 - 2) % 3) == 0 -> r = 2 -> divisao exata solucao encontrada
dividendo, divisor = [int(number) for number in input().split()]
for r in range(abs(divisor)):
    if ((dividendo - r) % divisor) == 0:
        q = int((dividendo - r ) / divisor)
        print(q,r)
        break