def merge(intervals: list[list[int]]) -> list[list[int]]:
    intervals.sort(key=lambda x: x[0])

    start, end = intervals[0]
    result = []
    print(intervals)

    for interval in intervals[1:]:

        if interval[0] <= end:

            if interval[1] > end:
                end = interval[1]

        else:
            result.append([start, end])
            start = interval[0]
            end = interval[1]

    result.append([start, end])

    return result


print(merge([[1, 4], [2, 3]]))
