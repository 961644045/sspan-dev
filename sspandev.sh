#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�[@_test.sh �WmoG���[��^��H(TU�"��ZY�.wk{���z{��4�JB�%��4P�NAjBH��x��O�����l#����3�3����s}��3�(U��RB_����)[+[�P��W��_�|&�2�,����U�)*
�")c((K�(�$&ʨ�TGIj"UT5�$�	&M/�
b�9��J�W���\JT�)�
}|�E�γ��s{�)PX��$��LMG	j�ؕ[2e�BZd}�bɚݨ��ŧ�w7����hMU"�4RQ�Vi���%{����Ͻ�^e�Χ4fvU�n�[se�u��~RT1M�Fy�0b��be�^�j�"c9�j˵�@1X���\ ��E�(� �Y����-{g�ߛ����m�.�  H2¹\���f�`#Z����E)�ԏa=z8G#�p�����p�$6E#����ǲ	�2�0��O�RⳫ���l?�����;��椵z�!/�nhR\�!��'�"�if�3&Q��)��(*0"�E���0N�&���)�cbJ�c������
����\zD�yHE*a�BC	=�45ъ�LW�|��f0�%�^�0�H�ߩ �p�%|нu� �B���vN'Sq��P�TÁ �ݨ����� �ú�&H)�4�pGKag����K��I����:^�f���m�Jk0��hh`�� `Nu4@p~��<~��V�����Io�{E�`5a��i��	��b��A�+F��2C�cA�⢑d��s=�K�D�XB�4�I|G�R �p���|wc�Zw�x뇓��lz���Apט�L��K'�n�w�p�ꃡ
�<\Q(l�b҃����"��@�"�Gb؁5��ʶSq���}���Ny�h����?g�4����Y��������H��D��2��'.�Q���sqp.>�G���<o�s�#rb䇓�g'v�_3���+~u����;�ZW�����E>{�O�#t�0:�����1��Q�ST4�߉T	 H�h`�k��%CS�i�FP������h��0��X?H{G�{9밞L��>Xڜ��9B�Ò�3}$���h��hs�\؋w�=���T3��{�8�����\^�Ί2�&����AM��سz����w�U��A��3�=Y}�E��a�|8ŜJ9PD�D���c_�~Umm����|�;n^;��p�i'�(6ò߯�����Z�.�)i�
�u�.�����u�pЊr���5k�կG^�����o<����E�~y˾��>�/��?�4�������9�<[K���*_{R+�W�f�nOy�턵7K� ]�+`j�~񪺳R��n�
j�������V�T�y�Z.�*.���%߾��Y�%���ÿ��`n�_�c�1xg]y�g׭��VH���hO�f������8Q{F  