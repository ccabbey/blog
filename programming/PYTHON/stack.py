# simulate stack structure
class Stack:
    def __init__(self):
        self.items=[]

    def is_empty(self):
        return self.items==[]

    def push(self,item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def peek(self):
        return self.items[-1]

    def size(self):
        return len(self.items)

lst=[1,2,3,4,5]
lst_rev=[]
stack=Stack()
for l in lst:
    stack.push(l)
size=stack.size()
for i in range(size):
    lst_rev.append(stack.pop())
print('reversed list is {}.'.format(lst_rev)) #>> "edcba"