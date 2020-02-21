import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':
    
    cont = 0

    for line in sys.stdin:
        line = line.strip()
        aux, key, dat, let = line.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format(let, dat, key))
        cont += 1
        if cont == 6:
            break