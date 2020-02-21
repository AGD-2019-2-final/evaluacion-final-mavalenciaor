import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        
        line = line.strip()
        val, keys = line.split("\t")
        keys = keys.split(",")
        len_val = len(val)
        for key in keys:
            sys.stdout.write("{}\t{}\t{}\n".format(key, len_val, val))
