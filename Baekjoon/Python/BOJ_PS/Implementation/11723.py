import sys

m = int(sys.stdin.readline())
s = set()

for _ in range(m):
    temp = sys.stdin.readline().strip().split()
    cmd = temp[0]

    if len(temp) == 1:
        if cmd == "all":
            s = set([i for i in range(1, 21)])
        else:
            s = set()

    else:
        n = int(temp[1])

        if cmd == "add":
            s.add(n)
        elif cmd == "remove":
            s.discard(n)
        elif cmd == "check":
            print(1 if n in s else 0)
        elif cmd == "toggle":
            if n in s:
                s.discard(n)
            else:
                s.add(n)
