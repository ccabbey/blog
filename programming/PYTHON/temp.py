def recursive(a,b):
    if b==1:
        return (2*a+4)/(a+2)
    else:
        recursive((2*a*b+4)/(a+2),b-1)
print(recursive(2019,2018))