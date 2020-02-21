import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None
    val_max = 0

    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == curkey:
            
            if val > val_max:
                val_max = val 

        else: 

            if curkey is not None:

                sys.stdout.write("{}\t{}\n".format(curkey, val_max))

            curkey = key
            val_max = val
        
    sys.stdout.write("{}\t{}\n".format(curkey, val_max))