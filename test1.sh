#!/bin/bash

for c in {1..20}
do
        t=$( date -d"-${c} min" )
        [ -z "$DT" ] && DT="${t%:*}" || DT="${DT},${t%:*}"
done

awk -v D="$DT" -v U="username" '
        BEGIN {
                n = split ( D, A, "," )
        }
        {
                for ( i = 1; i <= n; i++ )
                {
                        if ( ( $0 ~ A[i] ) && ( $0 ~ U ) )
                                print $0
                }
        }
' file.log
