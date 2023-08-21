from itertools import permutations
n = int(input())
global_permuts = []
for _ in range(0, n):
    string_input = list(input())
    permut = list(permutations(string_input))
    arr_of_permut = []
    for per in permut:
        arr_of_permut.append(''.join(per))
    arr_of_permut = sorted(list(set(arr_of_permut)))
    if arr_of_permut not in global_permuts:
        print('\n'.join(arr_of_permut))
        global_permuts.append(arr_of_permut)
        print()