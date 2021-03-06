#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

RANDOM_PASS=$(python -c "import random, string; print ''.join(random.choice(string.ascii_letters) for _ in range(12))")

PASS=${ROOT_PASS:-${RANDOM_PASS}}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "You can now connect to this CentOS container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
