number_of_entries = int(input())
arr_apend = [
    int(input()) for _ in range(number_of_entries)
]
array = [0] * number_of_entries
for x in range(0, len(arr_apend)):
    if arr_apend[x] == 1:
        array[x] += 1
    if x >= 1 and arr_apend[x-1] == 1:
        array[x] += 1
    if x < len(arr_apend) - 1 and arr_apend[x+1] == 1:
        array[x] += 1
for x in array:
    print(x)