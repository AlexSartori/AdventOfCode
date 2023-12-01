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

    return result


res = sum(parse(l).eval() for l in open('input'))
print("Overall sum:", res)
