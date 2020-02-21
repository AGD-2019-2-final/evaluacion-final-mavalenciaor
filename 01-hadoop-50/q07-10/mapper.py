import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        key, val_a, val_b = line.split("   ")
        val_c = len(val_b)
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(key, val_c, int(val_b), val_a))

        