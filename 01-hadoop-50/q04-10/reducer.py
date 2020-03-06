import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None
    total = 0

    for line in sys.stdin:

        key, val1, val2 = line.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format(val1, key, val2))