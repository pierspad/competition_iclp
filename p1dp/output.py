a = input()
splitted = a.split(" ")

out_ = []

for at in splitted:
    if at.startswith("assign("):
        out_.append(at.split("assign(")[1][:-1])
    elif at.startswith("rows("):
        rows = int(at.split("rows(")[1][:-1])
        #print(rows)
    elif at.startswith("cols("):
        cols = int(at.split("cols(")[1][:-1])
        #print(cols)

for row in range(rows):
    for col in range(cols):
        printed = False
        for at in out_:
            sp = at.split(",")
            if int(sp[0]) == row+1 and int(sp[1]) == col+1:
                printed = True
                print(sp[2], end=" " if col != cols-1 else "")
                break
        if not printed:
            print("0", end=" " if col != cols-1 else "")

    print()