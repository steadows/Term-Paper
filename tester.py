
def exponentiate(x, y):
    temp = x
    for _ in range(y-1):
        x = x * temp
    return x
    

def recurse_exponentiation(x,y):
    if y == 0:
        return 1
    if y == 1:
        return x
    else:
        temp = x * recurse_exponentiation(x,y-1)
        return temp
    
print("using a loop: ", exponentiate(23,23))  
print("using recursion: ", recurse_exponentiation(23,23))  

