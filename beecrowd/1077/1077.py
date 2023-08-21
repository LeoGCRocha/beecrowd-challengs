n = int(input())
for _ in range(0, n):
    infix_expression = input()
    stack = []
    pos_fix_expression = ""
    # Converting values
    post_exp_stack = []
    operator_stack = []
    # Precedence
    dic_preced = {
        '+': 1,
        '-': 1,
        '*': 2,
        '/': 2,
        '^': 3
    }

    char_pos = 0
    for char_exp in infix_expression:
        if char_exp.isalpha() or char_exp.isdigit():
            post_exp_stack.append(char_exp)
        else:
            if char_exp == "(":
                operator_stack.append("(")
            elif char_exp == ")":
                backup = char_pos
                while True:
                    operator = operator_stack.pop()
                    if operator == "(":
                        break
                    else:
                        post_exp_stack.append(operator)
                    backup -= 1
            elif len(operator_stack) == 0 or operator_stack[-1] == "(":
                operator_stack.append(char_exp)
            else:
                try:
                    while len(operator_stack) > 0 and (dic_preced[char_exp] <= dic_preced[operator_stack[-1]]):
                        post_exp_stack.append(operator_stack.pop())
                except KeyError:
                    pass
                operator_stack.append(char_exp)

        char_pos += 1
    while len(operator_stack) != 0:
        post_exp_stack.append(operator_stack.pop())
    print("".join(post_exp_stack))