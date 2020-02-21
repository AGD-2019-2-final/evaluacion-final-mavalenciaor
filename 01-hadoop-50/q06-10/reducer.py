import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None
    val_max = sys.maxsize * -1
    val_min = sys.maxsize


    for line in sys.stdin:
        line = line.strip()

        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
            
            if val > val_max:
                val_max = val
            
            if val < val_min:
                val_min = val

        else: 

            if curkey is not None:

                sys.stdout.write("{}\t{}\t{}\n".format(curkey, val_max, val_min))

            curkey = key
            val_max = val
            val_min = val
        
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, val_max, val_min))