class Node:
    def __init__(self, key):
        self.key = key
        self.left = None
        self.right = None

def add(root, key):
    if root == None:
        return Node(key)
    if key < root.key:
        root.left = add(root.left, key)
    elif key > root.key:
        root.right = add(root.right, key)
    return root

def orderer_list(root, list_to_order):
    if root != None:
        orderer_list(root.left, list_to_order)
        list_to_order.append(root.key)
        orderer_list(root.right, list_to_order)

if __name__ =="__main__":
    words_without_order = []
    # Binary Tree
    root = None
    while True:
        # EOF input URI 
        try:
            user_input = input()
            str_comp = ""
            for input_char in user_input:
                ascii_number = ord(input_char.lower())
                # Verify if number is in range of A-Z or a-z 
                if ascii_number >= 97 and ascii_number <= 122:
                    str_comp += input_char.lower()
                else:
                    if str_comp != "":
                        words_without_order.append(str_comp)
                        str_comp = ""
            if str_comp != "":
                words_without_order.append(str_comp)
                str_comp = ""
        except EOFError:
            break
        # Iterate through all strings
    for word in words_without_order:
        root = add(root, word)
    # Ordering List
    list_to_order = []
    orderer_list(root, list_to_order)
    for stringRes in list_to_order:
        print(stringRes)