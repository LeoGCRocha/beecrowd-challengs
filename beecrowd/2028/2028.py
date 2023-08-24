def sequence(num):
    if num == 0:
        return ["0"]
    if num == 1:
        return ["0", "1"]
    else:
        sequence = ["0", "1"]
        for i in range(2, num + 1):
            sequence.extend([i] * i)
        return sequence
count = 1
while True:
    try:
        N = int(input())
        res = [str(x) for x in sequence(N)]
        print('Caso {}: {} numero{}'.format(count, len(res), 's' if len(res) > 1 else ''))
        print(" ".join(res))
        print()
        count += 1
    except EOFError:
        break