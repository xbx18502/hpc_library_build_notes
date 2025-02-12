# you can write to stdout for debugging purposes, e.g.
# print("this is a debug message")

def solution(S):
    # Implement your solution here
    if S == "0":
        return 0
    
    V = int(S, 2)
    operations = 0
    
    while V > 0:
        if V % 2 == 0:
            V //= 2
            operations += 1
        else:
            V -= 1
            operations += 1
            
    return operations
