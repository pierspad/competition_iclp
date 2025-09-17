import sys

fn = sys.argv[1]

with open(fn, "r") as f:
    lines = [i.strip() for i in f.readlines()]
    rows = lines[0].split(" ")[0]
    cols = lines[0].split(" ")[1]
    rows_d = lines[1].split(" ")
    cols_d = lines[2].split(" ")
    print(f"rows({rows}).")
    print(f"cols({cols}).")
    for i, d in enumerate(rows_d):
        print(f"rd({i+1}, {d}).")
    for i, d in enumerate(cols_d):
        print(f"cd({i+1}, {d}).")
with open('encoding.lp', 'r') as f:
    for l in f.readlines():
        print(l, end='')
