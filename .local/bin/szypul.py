import math
M0 = M1 = M2 = M3 = M4 = M5 = M6 = M7 = 999
C1 = C2 = C4 = C8 = 888
print('Podaj liczbę wejściową: ',end='')
dec=liczbaWejsciowa=int(input())
jakDluga=len(str(dec))
binarna=[]

print('podano liczbę: ', liczbaWejsciowa)
while dec > 0:
    dlug=int(len(str(dec)))
    liczba= jakDluga-dlug
    binarna.append(dec%2)  
    for x in range(liczba):     
        print(' ',end='')
    print(dec,end='')
    print(' |',binarna[-1])
    dec=math.floor(dec/2)

for bit in binarna[::-1]:
    print (bit, end="")

M0, M1, M2, M3, M4, M5, M6, M7 = binarna[0], binarna[1], binarna[2], binarna[3], binarna[4], binarna[5], binarna[6], binarna[7] 
print("\n\n12|1100|M7 ",M7)
print("11|1011|M6 ",M6)
print("10|1010|M5 ",M5)
print(" 9|1001|M4 ",M4)
print(" 8|1000|C8 ")
print(" 7|0111|M3 ",M3)
print(" 6|0110|M2 ",M2)
print(" 5|0101|M1 ",M1)
print(" 4|0100|C4 ")
print(" 3|0011|M0 ",M0)
print(" 2|0010|C2 ")
print(" 1|0001|C1 \n")



print("‖ M7| M6| M5| M4| M3| M2| M1| M0‖") 
print("‖2^7|2^6|2^5|2^4|2^3|2^2|2^1|2^0‖")
print("‖ ",M7," | ",M6," | ",M5," | ",M4," | ",M3," | ",M2," | ",M1," | ",M0," ‖", sep='')

def xorDlaCzterech(a,b,c,d):
    wynik=a^b
    wynik=wynik^c
    wynik=wynik^d
    return wynik

def xorDlaPieciu(a,b,c,d,e):
    wynik=a^b
    wynik=wynik^c
    wynik=wynik^d
    wynik=wynik^e
    return wynik


C8 = xorDlaCzterech(M4,M5,M6,M7)
C4 = xorDlaCzterech(M1,M2,M3,M7)
C2 = xorDlaPieciu(M0,M2,M3,M5,M6)
C1 = xorDlaPieciu(M0,M1,M3,M4,M6)

print()
print("C8 = M4⊕ M5⊕ M6⊕ M7 =     ",M4,"⊕ ",M5,"⊕ ",M6,"⊕ ",M7," = ",C8, sep='')
print("C4 = M1⊕ M2⊕ M3⊕ M7 =     ",M1,"⊕ ",M2,"⊕ ",M3,"⊕ ",M7," = ",C4, sep='')
print("C2 = M0⊕ M2⊕ M3⊕ M5⊕ M6 = ",M0,"⊕ ",M2,"⊕ ",M3,"⊕ ",M5,"⊕ ",M6," = ",C2, sep='')
print("C1 = M0⊕ M1⊕ M3⊕ M4⊕ M6 = ",M0,"⊕ ",M1,"⊕ ",M3,"⊕ ",M4,"⊕ ",M6," = ",C1, sep='')

print("\n12|1100|M7 ",M7)
print("11|1011|M6 ",M6)
print("10|1010|M5 ",M5)
print(" 9|1001|M4 ",M4)
print(" 8|1000|C8 ",C8,"•")
print(" 7|0111|M3 ",M3)
print(" 6|0110|M2 ",M2)
print(" 5|0101|M1 ",M1)
print(" 4|0100|C4 ",C4,"•")
print(" 3|0011|M0 ",M0)
print(" 2|0010|C2 ",C2,"•")
print(" 1|0001|C1 ",C1,"•")

wynik_bin=[M7,M6,M5,M4,C8,M3,M2,M1,C4,M0,C2,C1]
print("\nwynik w postaci binarnej")
for bit in wynik_bin[::-1]:
    print (bit, end="")
print()
def zBINnaDEC (tab):
    wynik = 0
    ind = 0
    tabofvalues=[]

    for x in tab:
        wynik += x*(2**ind)
        if x*(2**ind) > 0:
            tabofvalues.append(2**ind)
        ind+=1
    return wynik, tabofvalues

print("\nwynik w postaci dziesiętnej i występujące liczby")
print(zBINnaDEC(wynik_bin)[0], zBINnaDEC(wynik_bin)[1], sep=": ")

print("\nODPOWIEDŹ: ")
print(liczbaWejsciowa,"→", zBINnaDEC(wynik_bin)[0])
