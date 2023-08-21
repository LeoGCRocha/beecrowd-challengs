while True:
    try:
        n = int(input())
        dict_cont = {}
        for _ in range(0, n):
            opt = input().split()
            if opt[0] not in dict_cont:
                dict_cont[opt[0]] = {
                    "D" : 0,
                    "E" : 0
                }
            dict_cont[opt[0]][opt[1]] += 1
        cont = 0
        for key, item in dict_cont.items(): 
            cont += min(item['D'], item['E'])
        print(cont)
    except EOFError:
        break
