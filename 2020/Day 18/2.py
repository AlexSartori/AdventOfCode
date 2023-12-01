class Expression:
    def __init__(self):
        self.expr = []

    def eval(self):
        res = 0
        op = None

        for token in self.expr:
            if token in ['+', '*']:
                op = token
            else:
                if type(token) == Expression:
                    v = token.eval()
                else:
                    v = int(token)

                if op is None:
                    res = v
                elif op == '+':
                    res += v
                elif op == '*':
                    res *= v
        return res

    def __str__(self):
        return '(' + ' '.join(str(x) for x in self.expr) + ')'


def parse(line):
    result = Expression()

    stack = [result]
    for char in line:
        curr = stack[-1]
        if char.isdigit() or char in ['+', '*']:
            curr.expr.append(char)
        elif char == '(':
            curr.expr.append(Expression())
            stack.append(curr.expr[-1])
        elif char == ')':
            stack = stack[:-1]

    return fix_associativity(result)


def fix_associativity(x):
    if type(x) == str:
        return x
    elif type(x) == list:
        expr = x
    else:
        expr = x.expr

    i = 0
    while i < len(expr):
        if expr[i] == '+':
            new_expr = Expression()
            new_expr.expr = [
                expr[i-1],
                '+',
                fix_associativity(expr[i+1])
            ]
            expr = expr[:i-1] + [new_expr] + expr[i+2:]
            i -= 1
        elif isinstance(expr[i], Expression):
            expr[i] = fix_associativity(expr[i])
        i += 1

    if type(x) == list:
        return x
    else:
        r = Expression()
        r.expr = expr
        return r


res = sum(parse(l).eval() for l in open('input'))
print("Overall sum:", res)
