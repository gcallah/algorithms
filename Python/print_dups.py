
def print_dups(a):
    n = len(a)
    ichecks = [0] * n
    pair_checks = [[0 for i in range(n)] for j in range(n)]
    for i in range(n):
        assert ichecks[i] == 0  # we haven't checked this before
        ichecks[i] = 1          # now set that we HAVE checked this
        for j in range(i + 1, n):
            assert pair_checks[i][j] == 0  # we haven't checked this before
            pair_checks[i][j] = 1          # now set that we HAVE checked this
            if a[i] == a[j]:
                print(str(a[i]))
