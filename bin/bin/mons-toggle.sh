#!/bin/sh
case ${MONS_NUMBER} in
	1)
		mons -o
		;;
	2)
		mons -s
		;;
esac

