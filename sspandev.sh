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
�zB_sspandev.sh �W[oG~����c		aO�pi�*PZU�����dmv����ugm�i*%��@	$JBIh���R�	!�?�ٵ��=��ul�I���e�|�|s�̙�]��,��5��2RW����)�K[|aͻ^�~�
Ye-Uv��7j0G�4xEJ��P��(�&�#�Bi� C6L��IՉ�+��qb�}�4��Q���F:#S��O�S��:���,H����(ǴP��$��2yH#�.on͝ڨ���'zw7���z�/IDɘ(f�H�T3�׼�K��}>3�f{1"�DV�^Ș�i�ݽ��N�֭&�Q3d��
位�2b�c�Ҥ�<��d��j�[)V�� ��`񒞽@
0f���VI�r7'��[��,�7��-��]�]CDRT�����٦��h�[��ǾAǱ�q�!2١�b��X_��������T�ö�Ǻ�hcx�;�O�HpC#ùjh�Iy�_Z�S�ՅU���h��/�kʛc������@�m*Iӂ��@[B��2deb�"��PBbDE1�0@���aIr���X��G�qj�P@�)(T�!�ݹt�V�T���Bc)K��3R�x�,M.$�m�6C���m���EEب���A��2���CUN�F�9E����HScGj�H ��K*k���(��UI�Ȏc��[�{Зwr�AL��A���5wj�l��n��΢������yC� �q���������zo��}`�L��4F?9v!��ah0��ip�SC%�q��`���l��`T\O�9�֗�Dm�PHSD��P�`�m���ӑ���	��1�����뾿w�p���!=Jz�(���4�Y�z�D�Z�E�!�#�Rr\����Ҷ��������8v8��;Otw�G���t@��'fJ�8��Z5�ճ�h�1_��#.�Q�%A\�%GCo|[���~=�7���?�wvtס��=�n��W�yqѽ�{���ʵJq�O���H7:|�� �z�a��1��T���T� �lcf����4���X�Qw'���i�6��i`,����� N�h�+XOe�ra��Mb�sP��"��T��m_����<!����D�ru�p2ϻ��(7�8��(�嬬R("<j&���=gu���~�ސ���;3ؓ���>��'�H�T!H@Ud͔�6&(:�}1�Y���^��3���y��Wg@�('�(v�jX���{�5�}\�R?34"�*�W\�f&��|P��A+�:5>����k���zZE��nXx�U�����K��w}�ڽ��:�����Q���o.oN��ٝ/�w�����zyk���x��LXy=�+���^�w�*cUA�Ң��W��]X�޼�.�w��]|����}Ct��Z��9��>�gan�.�X|��+��Ժ;5_:�٩�P�_���lua\  