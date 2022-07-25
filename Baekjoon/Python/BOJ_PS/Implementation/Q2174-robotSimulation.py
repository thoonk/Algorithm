a, b = map(int, input().split())
n, m = map(int, input().split())

land = [[0] * a for _ in range(b)]

direction_dictionary = {
    'N': 0,
    'E': 1,
    'S': 2,
    'W': 3,
}

d = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
]

robots = []
for i in range(n):
    x, y, direction = input().split()
    r, c = b - int(y), int(x) - 1
    robots.append([r, c, direction_dictionary[direction]])
    land[r][c] = i+1

def turn(current_d, command, count):
    add_number = 3 if command == "L" else 1
    for i in range(count):
        current_d = (current_d + add_number) % 4

    return current_d

is_wrong_command = False

for i in range(m):
    robot_number, command_kind, command_count = input().split()
    robot_number = int(robot_number)
    command_count = int(command_count)

    r, c, direction = robots[robot_number - 1]
    if command_kind == 'L' or command_kind == 'R':
        new_direction = turn(direction, command_kind, command_count)
        robots[robot_number - 1] = [r, c, new_direction]
    else:
        for j in range(0, command_count):
            nr = r + d[direction][0]
            nc = c + d[direction][1]

            if 0 <= nr < b and 0 <= nc < a:
                if land[nr][nc] > 0:
                    is_wrong_command = True
                    print("Robot", land[r][c], "crashes into robot", land[nr][nc])
                    break
                else:
                    land[r][c] = 0
                    land[nr][nc] = robot_number
                    robots[robot_number - 1] = [nr, nc, direction]
                    r, c = nr, nc
            else:
                is_wrong_command = True
                print("Robot", land[r][c], "crashes into the wall")
                break
    if is_wrong_command:
        break

if not is_wrong_command:
    print('OK')