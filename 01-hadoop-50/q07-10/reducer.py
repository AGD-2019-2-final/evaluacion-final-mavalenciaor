import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        key, val_c, val_b, val_a = line.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format(key, val_a, val_b))