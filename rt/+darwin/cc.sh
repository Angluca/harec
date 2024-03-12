#!/usr/bin/env sh

args=
hasVal=
for o in $*; do
	case $o in
		-T)
			hasVal="$o"
			;;
        -Wl,--gc-sections)
            ;;
        -Wl,--no-gc-sections)
            args="$args -Wl,-no_pie"
            ;;
		*)
			if [ "$hasVal" != "" ]; then
				hasVal=
			else
				args="$args $o"
			fi
			;;
	esac
done

/usr/bin/cc $args
