class Person():
    person_count=0
    persons=[]
    def __init__(self,name,age):
        self.name=name
        self.age=age
        Person.person_count+=1
        self.persons.append((self.name,self.age))

alex=Person("Alex Li",26)
blex=Person("Blex Li",30)
print(Person.person_count)
print(Person.persons)

b=9999
c=9999
print(b is c)