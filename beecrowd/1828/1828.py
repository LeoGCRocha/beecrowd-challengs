# dicionario obj -> oque ele vence
dic_wins = {
    "tesoura": ['papel','lagarto'],
    "papel": ['pedra','Spock'],
    "pedra": ['lagarto','tesoura'],
    "lagarto": ['Spock','papel'],
    "Spock": ['tesoura','pedra']
}
number = int(input())
for n in range(number):
    sheldon, raj = input().split()
    if sheldon == raj: 
        print('Caso #{}: De novo!'.format(n + 1))
    elif raj in dic_wins[sheldon]:
        print('Caso #{}: Bazinga!'.format(n + 1))
    else:
        print('Caso #{}: Raj trapaceou!'.format(n + 1))
