# 성적 통계 / 구현

def get_max_gap(class_list):
    max_gap_class = 0
    for i in range(len(class_list) - 1):
        max_gap_class = max(max_gap_class, class_list[i] - class_list[i + 1])
    return max_gap_class

for i in range(int(input())):
    class_list = list(map(int, input().split()))
    len_class = class_list.pop(0)
    class_list.sort(reverse=True)
    max_gap_class = get_max_gap(class_list)

    print(f'Class {i + 1}')
    print(f'Max {class_list[0]}, Min {class_list[len_class-1]}, Largest gap {max_gap_class}')