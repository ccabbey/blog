# simulate queue structure
class Queue:
    def __init__(self):
        self.items=[]
    
    def is_empty(self):
        return self.items==[]

    def enqueue(self,item):
        self.items.insert(0,item)

    def dequeue(self):
        self.items.pop()
    
    def size(self):
        return len(self.items)
        