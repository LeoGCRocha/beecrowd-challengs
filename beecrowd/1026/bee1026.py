while True:
    try:
        num1, num2 = map(int, input().split())
        res = num1 ^ num2
        print(res)
    except EOFError:
        break